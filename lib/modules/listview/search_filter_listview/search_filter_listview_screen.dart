import 'package:flutter/material.dart';

import '../../toast/toast_screen.dart';

class SearchFilterListviewScreen extends StatefulWidget {
  const SearchFilterListviewScreen({Key? key}) : super(key: key);

  @override
  State<SearchFilterListviewScreen> createState() =>
      _SearchFilterListviewScreenState();
}

class _SearchFilterListviewScreenState
    extends State<SearchFilterListviewScreen> {
  final List<String> list = [
    "a",
    "abc",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z"
  ];
  late List<String> newDataList;
  TextEditingController _textController = TextEditingController();
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search Filter Listview');
  bool _is_autofocus = false;

  @override
  void initState() {
    super.initState();
    newDataList = List.from(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          // Navigate to the Search Screen
          IconButton(
            icon: customIcon,
            onPressed: () {
              setState(() {
                performSearchOperation();
              });
            },
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: ListView.builder(
              itemCount: newDataList.length,
              itemBuilder: (contex, index) {
                return GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            width: 1.0,
                            style: BorderStyle.solid),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      borderOnForeground: true,
                      child: SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: Center(
                          child: Text(
                            newDataList[index],
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      showToast("Selected : ${newDataList[index]}");
                    });
              }),
        ),
      ),
    );
  }

  void resetData() {
    setState(() {
      if (newDataList != null) {
        newDataList.clear();
        newDataList = List.from(list);
      }
    });
  }

  void performSearchOperation() {
    setFocus();

    if (customIcon.icon == Icons.search) {
      customIcon = const Icon(Icons.cancel);

      customSearchBar = ListTile(
        title: TextField(
          cursorColor: Colors.white,
          cursorWidth: 1,
          autofocus: _is_autofocus,
          onChanged: onItemChanged,
          controller: _textController,
          decoration: const InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
            border: InputBorder.none,
          ),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    } else {
      customIcon = const Icon(Icons.search);
      customSearchBar = const Text('Search Filter Listview');
      _textController.clear();
      resetData();
    }
  }

  onItemChanged(String value) {
    setState(() {
      newDataList = list
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void setFocus() {
    setState(() {
      _is_autofocus = !_is_autofocus;
    });
  }

  Widget searchView() {
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            onChanged: onItemChanged,
            controller: _textController,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
    );
  }
}
