import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class ChipScreenDemo extends StatefulWidget {
  const ChipScreenDemo({Key? key}) : super(key: key);

  @override
  State<ChipScreenDemo> createState() => _ChipScreenState();
}

class Mychip {
  Mychip(this.name, this.isSelected);

  String name;
  bool isSelected;
}

class _ChipScreenState extends State<ChipScreenDemo> {
  var _selectedChoiceChip = [false, false];
  var _selectedInputChip = [false, false];
  var _selectedFilterChip = [false, false];

  final List<Mychip> _inputChipList = <Mychip>[
    Mychip('Input chip 3', false),
    Mychip('Input chip 4', false),
  ];

  ListView get deleteChipList {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _inputChipList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: InputChip(
              deleteIconColor: Colors.white,
              deleteIcon: const Icon(Icons.cancel),
              showCheckmark: true,
              onDeleted: () {
                setState(() {
                  _inputChipList.removeWhere((value) {
                    return value == _inputChipList[index];
                  });
                });
              },
              checkmarkColor: Colors.white,
              selected: _inputChipList[index].isSelected,
              onSelected: (value) {
                setState(() {
                  _inputChipList[index].isSelected = value;
                });
              },
              selectedColor: Colors.lightGreenAccent,
              pressElevation: 16,
              elevation: 8,
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.blue,
              label: Text(
                _singleChoiceChipList[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  final _singleChoiceChipList = ["Chip 5", "Chip 6"];
  int? _value = -1;
  ListView get singleChoiceChipMaker {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _singleChoiceChipList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: ChoiceChip(
              selected: _value == index,
              onSelected: (selected) {
                setState(() {
                  _value = selected ? index : null;
                });
              },
              selectedColor: Colors.lightGreenAccent,
              pressElevation: 16,
              elevation: 8,
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.blue,
              label: Text(
                _singleChoiceChipList[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Chips"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  showToast("Clicked.");
                },
                child: Chip(
                  padding: const EdgeInsets.all(16),
                  onDeleted: () {
                    showToast("Deleted");
                  },
                  deleteIcon: const Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.green,
                  elevation: 8,
                  label: const Text(
                    "Chip",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              getDivider(),
              const Text(
                "Action Chip",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ActionChip(
                  backgroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.all(16),
                  pressElevation: 16,
                  elevation: 8,
                  label: const Text(
                    "Action Chip",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    showToast("Action chip clicked.");
                  }),
              getDivider(),
              const Text(
                "Choice Chips",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChoiceChip(
                      selectedColor: Colors.greenAccent,
                      padding: const EdgeInsets.all(16),
                      elevation: 8,
                      backgroundColor: Colors.blue,
                      onSelected: (value) {
                        setState(() {
                          _selectedChoiceChip[0] = value;
                        });
                        if (value == true) {
                          showToast("Selected");
                        }
                      },
                      label: const Text(
                        "Choice Chip 1",
                        style: TextStyle(color: Colors.white),
                      ),
                      selected: _selectedChoiceChip[0]),
                  ChoiceChip(
                      selectedColor: Colors.greenAccent,
                      padding: const EdgeInsets.all(16),
                      elevation: 8,
                      backgroundColor: Colors.blue,
                      onSelected: (value) {
                        setState(() {
                          _selectedChoiceChip[1] = value;
                        });
                        if (value == true) {
                          showToast("Selected");
                        }
                      },
                      label: const Text(
                        "Choice Chip 2",
                        style: TextStyle(color: Colors.white),
                      ),
                      selected: _selectedChoiceChip[1]),
                ],
              ),
              getDivider(),
              const Text(
                "Input Chips",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InputChip(
                    showCheckmark: true,
                    checkmarkColor: Colors.white,
                    selectedColor: Colors.greenAccent,
                    selected: _selectedInputChip[0],
                    onSelected: (value) {
                      setState(() {
                        _selectedInputChip[0] = value;
                      });
                    },
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.all(16),
                    pressElevation: 16,
                    elevation: 8,
                    label: const Text(
                      "Input chip 1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  InputChip(
                    selected: _selectedInputChip[1],
                    showCheckmark: true,
                    checkmarkColor: Colors.white,
                    selectedColor: Colors.greenAccent,
                    onSelected: (value) {
                      setState(() {
                        _selectedInputChip[1] = value;
                      });
                    },
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.all(16),
                    pressElevation: 16,
                    elevation: 8,
                    label: const Text(
                      "Input chip 2",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              getDivider(),
              const Text(
                "Filter Chips",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilterChip(
                      showCheckmark: true,
                      checkmarkColor: Colors.white,
                      selected: _selectedFilterChip[0],
                      selectedColor: Colors.lightGreenAccent,
                      pressElevation: 16,
                      elevation: 8,
                      padding: const EdgeInsets.all(16),
                      backgroundColor: Colors.black,
                      label: const Text(
                        "Filter Chip 1",
                        style: TextStyle(color: Colors.white),
                      ),
                      onSelected: (value) {
                        setState(() {
                          _selectedFilterChip[0] = value;
                        });
                      }),
                  FilterChip(
                      showCheckmark: true,
                      checkmarkColor: Colors.white,
                      selected: _selectedFilterChip[1],
                      selectedColor: Colors.lightGreenAccent,
                      pressElevation: 16,
                      elevation: 8,
                      padding: const EdgeInsets.all(16),
                      backgroundColor: Colors.black,
                      label: const Text(
                        "Filter Chip 2",
                        style: TextStyle(color: Colors.white),
                      ),
                      onSelected: (value) {
                        setState(() {
                          _selectedFilterChip[1] = value;
                        });
                      }),
                ],
              ),
              getDivider(),
              const Text(
                "Single Choice Chip",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(height: 100, child: singleChoiceChipMaker),
              getDivider(),
              const Text(
                "Delete Chips",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(height: 100, child: deleteChipList),
            ],
          ),
        ),
      ),
    );
  }

  Widget getDivider() {
    return Column(
      children: const [
        SizedBox(
          height: 16,
        ),
        Divider(
          height: 10,
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
