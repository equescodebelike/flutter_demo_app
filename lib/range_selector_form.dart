import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm({
    super.key,
    required this.formKey,
    required this.minValueSetter,
    required this.maxValueSetter
  });

  final GlobalKey<FormState> formKey;

  final IntValueSetter minValueSetter;
  final IntValueSetter maxValueSetter;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding( //ctrl + dot
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              fieldLabelText: 'Min',
              intValueSetter: minValueSetter,
            ),
            const SizedBox(height: 16),
            RangeSelectorTextFormField(
              fieldLabelText: 'Max',
              intValueSetter: maxValueSetter,
            ),
          ],
        ),
      ),
      
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    required this.fieldLabelText,
    required this.intValueSetter,
    super.key,
  });

  final String fieldLabelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: fieldLabelText,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator:(value) {
        if(value == null || int.tryParse(value) == null) {
          return 'Must be an integer';
        }
        else {
          return null;
        }
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}