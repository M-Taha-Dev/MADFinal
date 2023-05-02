import './task5/customWidget.dart';
import 'package:flutter/material.dart';

class task3 extends StatefulWidget {
  @override
  _task3State createState() => _task3State();
}

class _task3State extends State<task3> {
  final _formKey = GlobalKey<FormState>();

  String _name = 'H';
  int _age = 0;

  void _submitForm() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      var snackBar = SnackBar(
        content: Text('Hi! $_name , you are $_age years old'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextWidget(text: 'Form with validations', textColor: Colors.white, textSize: 25,),
        Container(
          margin:EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty ) {
                        return 'Please enter your name';
                      }
                      else if (value.length <= 2){
                        return 'Your name should consists at least 3 characters';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Age'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }
                      final age = int.tryParse(value);
                      if (age == null || age < 18) {
                        return 'You must be at least 18 years old';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _age = int.parse(value!);
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}