import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class task6 extends StatefulWidget {
  @override
  State<task6> createState() => _task6State();
}

class _task6State extends State<task6> {
  var nameController = TextEditingController();
  String? nameValue = 'No Value Saved';

  @override
  void initState() {
    super.initState();
    getSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        titleSpacing: 21,
        backgroundColor: const Color(0xFF0D47A1),
        shadowColor: Colors.deepPurpleAccent,
        elevation: 21,
        title: const Text('Custom Widget'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Container(
                child: Center(
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                              label: const Text('Name'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21))),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              var prefs = await SharedPreferences.getInstance();
                              prefs.setString(
                                  'name', nameController.text.toString());
                            },
                            child: const Text('Save')),
                        Text('Shared Preferences Value: ${nameValue}')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getSharedPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    nameValue = prefs.getString('name');
    setState(() {});
  }
}