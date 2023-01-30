import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';
import '../toast/toast_screen.dart';

class HorizontalStepperScreen extends StatefulWidget {
  const HorizontalStepperScreen({Key? key}) : super(key: key);

  @override
  State<HorizontalStepperScreen> createState() => _HorizontalStepperScreenState();
}

class _HorizontalStepperScreenState extends State<HorizontalStepperScreen> {

  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Horizontal Stepper"),
      body: Stepper(
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Row(
            children: <Widget>[
              TextButton(
                onPressed: () {
                  if (details.stepIndex < 2) {
                    details.onStepContinue!();
                  } else {
                    showToast("Done");
                  }
                },
                child: const Text('Continue'),
              ),
              TextButton(
                onPressed: details.onStepCancel,
                child: const Text('Back'),
              ),
            ],
          );
        },
        type: stepperType,
        physics: const ScrollPhysics(),
        currentStep: _currentStep,
        onStepTapped: (step) => setState(() => _currentStep = step),
        onStepContinue: (){
          _currentStep < 2 ? setState(() => _currentStep += 1) : null;
        },
        onStepCancel: () {
          _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
        },
        steps: <Step>[
          Step(
            title: const Text('Account'),
            content: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email Address'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
              ],
            ),
            isActive: _currentStep >= 0,
            state: _currentStep == 0
                ? StepState.indexed
                : _currentStep > 0
                ? StepState.complete
                : StepState.disabled,
          ),
          Step(
            title: const Text('Address'),
            content: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Home Address'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Postcode'),
                ),
              ],
            ),
            isActive: _currentStep >= 1,
            state: _currentStep == 1
                ? StepState.indexed
                : _currentStep > 1
                ? StepState.complete
                : StepState.disabled,
          ),
          Step(
            title: const Text('Mobile Number'),
            content: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Mobile Number'),
                ),
              ],
            ),
            isActive: _currentStep >= 2,
            state: _currentStep == 2
                ? StepState.indexed
                : _currentStep > 2
                ? StepState.complete
                : StepState.disabled,
          ),
        ],
      ),
    );
  }
}
