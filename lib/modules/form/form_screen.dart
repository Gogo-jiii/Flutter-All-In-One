import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  final _nameKey = GlobalKey<FormFieldState>();
  final _ageKey = GlobalKey<FormFieldState>();
  final _phoneNumberKey = GlobalKey<FormFieldState>();
  final _emailKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Form"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                key: _nameKey,
                onChanged: (value) {
                  doValidation(_nameKey, null);
                },
                decoration: const InputDecoration(labelText: "Enter Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: _ageKey,
                onChanged: (value) {
                  doValidation(_ageKey, null);
                },
                keyboardType: TextInputType.number,
                maxLength: 3,
                decoration: const InputDecoration(labelText: "Enter Age"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the age';
                  }
                  if (int.parse(value) < 18) {
                    return 'You need to be above 18 years of age';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: _phoneNumberKey,
                onChanged: (value) {
                  doValidation(_phoneNumberKey, null);
                },
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration:
                    const InputDecoration(labelText: "Enter Phone Number"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the phone number';
                  }
                  if (value.length != 10) {
                    return 'Please enter a 10 digit mobile number';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: _emailKey,
                onChanged: (value) {
                  doValidation(_emailKey, null);
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: "Enter Email ID"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address';
                  }
                  if (!RegExp(_emailRegex).hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  doValidation(null, _formKey);
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void doValidation(
      GlobalKey<FormFieldState>? keyName, GlobalKey<FormState>? formKey) {
    if (formKey != null && formKey.currentState!.validate()) {
      showToast("Form is valid.");
    } else if (keyName != null) {
      keyName.currentState!.validate();
    }
  }
}
