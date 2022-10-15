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
        margin: EdgeInsets.all(16),
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
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await dbManager.insertModel(ModelClass(name: _name));
                          showToast("Data saved");
                        }
                      },
                      child: const Text("Save data"),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        List<ModelClass> list = await dbManager.getModelList();
                        showToast("Data: ${list.toString()}");
                      },
                      child: const Text("Get data"),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await dbManager.deleteModel(ModelClass(name: _name));
                          showToast("Data deleted");
                        }
                      },
                      child: const Text("Delete data"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
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
                    const SizedBox(
                      height: 16,
                    ),
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
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_form2Key.currentState!.validate()) {
                          List<Map<String, dynamic>> listOfMap =
                              await dbManager.getModel(_oldData);

                          Map<String, dynamic> firstMap = listOfMap[0];
                          ModelClass oldModel = ModelClass.fromJson(firstMap);
                          oldModel.name = _newData;
                          await dbManager.updateModel(oldModel);
                          showToast("Data updated");
                        }
                      },
                      child: const Text("Update data"),
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
}
