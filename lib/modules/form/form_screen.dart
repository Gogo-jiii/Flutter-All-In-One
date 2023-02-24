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
        margin: setMargin(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getFormField(_nameKey, "Enter Name", (value) {
                doValidation(_nameKey, null);
              }, (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              }, null, null),
              getFormField(_ageKey, "Enter Age", (value) {
                doValidation(_ageKey, null);
              }, (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the age';
                }
                if (int.parse(value) < 18) {
                  return 'You need to be above 18 years of age';
                }
                return null;
              }, TextInputType.number, 3),
              getFormField(_phoneNumberKey, "Enter Phone Number", (value) {
                doValidation(_phoneNumberKey, null);
              }, (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the phone number';
                }
                if (value.length != 10) {
                  return 'Please enter a 10 digit mobile number';
                }
                return null;
              }, TextInputType.phone, 10),
              getFormField(_emailKey, "Enter Email ID", (value) {
                doValidation(_emailKey, null);
              }, (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email address';
                }
                if (!RegExp(_emailRegex).hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              }, TextInputType.emailAddress, null),
              getSizedBox(16.0),
              getElevatedButton("Submit", onPressed: (){ doValidation(null, _formKey);}),
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
