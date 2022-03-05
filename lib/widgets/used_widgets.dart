import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String SELECTED_ROCKET = "SELECTED_ROCKET";
  static const String TEXT = "TEXT";
  SharedPreferences? prefs;
  String text = "";
  bool checkBoxValue = false;
  TextEditingController controller = TextEditingController();
  String? selectedRocket;
  DateTime? selectedDateTime;
  List<String> rockets = ["Falcon", "Merlin", "Booster", "Apollo"];

  @override
  void initState() {
    getSharedPrefs();
    super.initState();
  }

  getSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedRocket = prefs!.getString(SELECTED_ROCKET);
      text = prefs!.getString(TEXT) ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Space X'),
      ),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(
                    visible: checkBoxValue,
                    child: Container(height: 200, child: Text("Input Text: $text", style: TextStyle(fontSize: 24)))),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      onSubmitted: (value) {
                        setState(() {
                          text = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          text = value;
                        });
                      },
                      controller: controller,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Name Surname",
                          hintText: "Name Surname",
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)))),
                ),
                MaterialButton(
                    color: Colors.red,
                    child: Text("Show input"),
                    onPressed: () {
                      setState(() {
                        prefs!.setString(TEXT, controller.text);

                        text = controller.text;
                      });
                    }),
                MaterialButton(
                    color: Colors.red,
                    child: Text("Clear memory"),
                    onPressed: () {
                      setState(() {
                        prefs!.remove(TEXT);
                      });
                    }),
                Checkbox(
                    activeColor: Colors.green,
                    value: checkBoxValue,
                    onChanged: (value) {
                      setState(() {
                        checkBoxValue = value!;
                      });
                    }),
                DropdownButton(
                  hint: Text("Please select a rocket"),
                  value: selectedRocket,
                  onChanged: (value) {
                    setState(() {
                      prefs!.setString(SELECTED_ROCKET, value.toString());
                      selectedRocket = value.toString();
                    });
                  },
                  items: rockets.map((String name) {
                    return DropdownMenuItem<String>(
                      value: name,
                      child: Text(name),
                    );
                  }).toList(),
                ),
                SizedBox(height: 50),
                MaterialButton(
                    color: Colors.red,
                    child: Text("Select Date"),
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime(2022, 01, 03),
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                          selectableDayPredicate: (day) {
                            String a = DateFormat('EEEE').format(day);
                            if (a == "Saturday") {
                              return false;
                            }
                            if (a == "Sunday") {
                              return false;
                            }

                            return true;
                          });
                    }),
                MaterialButton(
                    color: Colors.red,
                    child: Text("Select Date via Modal"),
                    onPressed: () {
                      showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Wrap(
                              children: [
                                CupertinoDatePicker(onDateTimeChanged: (dateTime) {}),
                                MaterialButton(
                                    color: Colors.red,
                                    child: Text("Select"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    })
                              ],
                            );
                          });
                    }),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
