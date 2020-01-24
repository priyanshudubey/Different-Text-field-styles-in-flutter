import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    ));

class MainScreen extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MoblieNumberField()
        ],
      ),
      );
  }

}

class MoblieNumberField extends StatefulWidget {
  MoblieNumberField({Key key}) : super(key: key);
  @override
  _MoblieNumberFieldState createState() => _MoblieNumberFieldState();
}

class _MoblieNumberFieldState extends State<MoblieNumberField> {
  TextEditingController _text = TextEditingController();
  String dropdownvalue = '+91';
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 25, left: 30, right: 50),
        alignment: Alignment.centerLeft,
        child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            DropdownButton(
                              value: dropdownvalue,
                              icon: Icon(Icons.arrow_drop_down),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              underline: Container(
                                height: 5,
                                color: Colors.white,
                              ),
                              onChanged: (String newvalue) {
                                setState(() {
                                  dropdownvalue = newvalue;
                                });
                              },
                              items: <String>[
                                '+91',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _text,
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                decoration: InputDecoration(
                                  errorText: _validate ? 'Field can\'t be empty': null,
                                  border: InputBorder.none,
                                  hintText: 'Enter your mobile number',
                                  hintStyle: TextStyle(
                                      letterSpacing: 1.5,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                      color: Colors.black),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                    ]))));
  }
}