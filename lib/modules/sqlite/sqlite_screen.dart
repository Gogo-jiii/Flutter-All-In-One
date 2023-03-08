import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/sqlite/model_class.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

import 'data_base.dart';

class SqliteScreen extends StatefulWidget {
  const SqliteScreen({Key? key}) : super(key: key);

  @override
  State<SqliteScreen> createState() => _SqliteScreenState();
}

class _SqliteScreenState extends State<SqliteScreen> {
  final _formKey = GlobalKey<FormState>();
  final _form2Key = GlobalKey<FormState>();

  final DbManager dbManager = DbManager();

  late String _name;
  late String _oldData;
  late String _newData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "SQLite"),
      body: Container(
        margin: setMargin(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _name = value;
                        });
                      },
                      decoration:
                          const InputDecoration(labelText: "Enter Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    getSizedBox(16),
                    getElevatedButton(
                      "Save data",
                      onPressed: () {
                        saveData();
                      },
                    ),
                    getSizedBox(16),
                    getElevatedButton(
                      "Get data",
                      onPressed: () {
                        getData();
                      },
                    ),
                    getSizedBox(16),
                    getElevatedButton(
                      "Delete data",
                      onPressed: () {
                        deleteData();
                      },
                    ),
                  ],
                ),
              ),
              getSizedBox(16),
              Form(
                key: _form2Key,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _oldData = value;
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: "Enter data to be updated"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    getSizedBox(16),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _newData = value;
                        });
                      },
                      decoration:
                          const InputDecoration(labelText: "Enter new data"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    getSizedBox(16),
                    getElevatedButton(
                      "Update data",
                      onPressed: () {
                        updateData();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveData() async {
    if (_formKey.currentState!.validate()) {
      await dbManager.insertModel(ModelClass(name: _name));
      showToast("Data saved");
    }
  }

  void getData() async {
    List<ModelClass> list = await dbManager.getModelList();
    showToast("Data: ${list.toString()}");
  }

  void deleteData() async {
    if (_formKey.currentState!.validate()) {
      await dbManager.deleteModel(ModelClass(name: _name));
      showToast("Data deleted");
    }
  }

  void updateData() async {
    if (_form2Key.currentState!.validate()) {
      List<Map<String, dynamic>> listOfMap = await dbManager.getModel(_oldData);

      Map<String, dynamic> firstMap = listOfMap[0];
      ModelClass oldModel = ModelClass.fromJson(firstMap);
      oldModel.name = _newData;
      await dbManager.updateModel(oldModel);
      showToast("Data updated");
    }
  }
}
