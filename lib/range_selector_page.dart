import 'package:flutter/material.dart';
import 'package:flutter_demo_app/range_selector_form.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({super.key});

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  final formKey = GlobalKey<FormState>();
  int _min = 0;
  int _max = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.lightBlue, // how to set colorScheme color?
            shape: BoxShape.rectangle,
          ),
        ),
        title: const Center(
          child: Text('Select Range'),
        ),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        minValueSetter: (value) => _min = value,
        maxValueSetter: (value) => _max = value,
        ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.lightBlue, // how to set colorScheme color?
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
          }
        },
        child: const Icon(Icons.arrow_forward)
      ),
    );
  }
}