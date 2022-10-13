import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class ChipScreen extends StatefulWidget {
  const ChipScreen({Key? key}) : super(key: key);

  @override
  State<ChipScreen> createState() => _ChipScreenState();
}

class Mychip {
  Mychip(this.name, this.isSelected);

  String name;
  bool isSelected;

  @override
  String toString() {
    return 'Mychip{name: $name, isSelected: $isSelected}';
  }
}

class _ChipScreenState extends State<ChipScreen> {
  final List<Mychip> _choiceChips = <Mychip>[
    Mychip('Chip 1', false),
    Mychip('Chip 2', false),
  ];

  final List<Mychip> _inputChips = <Mychip>[
    Mychip('Chip 1', false),
    Mychip('Chip 2', false),
  ];

  final List<Mychip> _filterChips = <Mychip>[
    Mychip('Chip 1', false),
    Mychip('Chip 2', false),
  ];

  List<Mychip> _deleteChips = <Mychip>[
    Mychip('Chip 1', false),
    Mychip('Chip 2', false),
  ];

  ListView get choiceChipList {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _choiceChips.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: ChoiceChip(
                selectedColor: Colors.greenAccent,
                padding: const EdgeInsets.all(16),
                elevation: 8,
                backgroundColor: Colors.blue,
                onSelected: (value) {
                  setState(() {
                    _choiceChips[index].isSelected = value;
                  });
                  if (value == true) {
                    showToast("Selected");
                  }
                },
                label: Text(
                  _choiceChips[index].name,
                  style: TextStyle(color: Colors.white),
                ),
                selected: _choiceChips[index].isSelected),
          );
        });
  }

  ListView get inputChipList {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _inputChips.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: InputChip(
              showCheckmark: true,
              checkmarkColor: Colors.white,
              selectedColor: Colors.greenAccent,
              selected: _inputChips[index].isSelected,
              onSelected: (value) {
                setState(() {
                  _inputChips[index].isSelected = value;
                });
              },
              backgroundColor: Colors.amber,
              padding: const EdgeInsets.all(16),
              pressElevation: 16,
              elevation: 8,
              label: Text(
                _inputChips[index].name,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  ListView get filterChipList {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _filterChips.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: FilterChip(
                showCheckmark: true,
                checkmarkColor: Colors.white,
                selected: _filterChips[index].isSelected,
                selectedColor: Colors.lightGreenAccent,
                pressElevation: 16,
                elevation: 8,
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.black,
                label: Text(
                  _filterChips[index].name,
                  style: TextStyle(color: Colors.white),
                ),
                onSelected: (value) {
                  setState(() {
                    _filterChips[index].isSelected = value;
                  });
                }),
          );
        });
  }

  ListView get deleteChipList {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _deleteChips.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: InputChip(
              deleteIconColor: Colors.white,
              deleteIcon: const Icon(Icons.cancel),
              showCheckmark: true,
              onDeleted: () {
                setState(() {
                  _deleteChips.removeAt(index);
                });
              },
              checkmarkColor: Colors.white,
              selected: _deleteChips[index].isSelected,
              onSelected: (value) {
                setState(() {
                  _deleteChips[index].isSelected = value;
                });
              },
              selectedColor: Colors.lightGreenAccent,
              pressElevation: 16,
              elevation: 8,
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.blue,
              label: Text(
                _deleteChips[index].name,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  final _singleChoiceChips = ["Chip 1", "Chip 2"];
  int? _value = -1;
  ListView get singleChoiceChipsList {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _singleChoiceChips.length,
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
                _singleChoiceChips[index],
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
              getDivider("Action Chip"),
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
              getDivider("Choice Chip"),
              SizedBox(height: 100, child: choiceChipList),
              getDivider("Input Chip"),
              SizedBox(height: 100, child: inputChipList),
              getDivider("Filter Chip"),
              SizedBox(height: 100, child: filterChipList),
              getDivider("Single Choice Chip"),
              SizedBox(height: 100, child: singleChoiceChipsList),
              getDivider("Delete Chip"),
              SizedBox(height: 100, child: deleteChipList),
            ],
          ),
        ),
      ),
    );
  }

  Widget getDivider(String title) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Divider(
          height: 10,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
