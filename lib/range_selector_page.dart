import 'package:flutter/material.dart';
import 'package:flutter_demo_app/randomizer_page.dart';
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
      body: RangeSelectorForm( // F12
        formKey: formKey,
        minValueSetter: (value) => _min = value,
        maxValueSetter: (value) => _max = value,
        ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.lightBlue, // how to set colorScheme color?
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            if (_min < _max) {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => RandomizerPage(
                      min: _min, 
                      max: _max
                  ),
                ),
              );
            }
            else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Invalid Range'),
                  content: const Text('The minimum value must be less than the maximum value.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ); 
            }
          }
        },
        child: const Icon(Icons.arrow_forward)
      ),
    );
  }
}