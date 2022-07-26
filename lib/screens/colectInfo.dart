import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vim/models/carInfo.dart';
import 'package:vim/models/localInfo.dart';
import 'package:vim/screens/report.dart';

class ColectInfoScreen extends StatefulWidget {
  static String routeName = '/colectInfo';
  @override
  State<ColectInfoScreen> createState() => _colectInfoState();
}

class _colectInfoState extends State<ColectInfoScreen> {
  bool _validVim = false;
  TextEditingController _vim = TextEditingController(text: "2HGFA16537H507451");
  TextEditingController _year = TextEditingController(text: "2007");

  bool _infoColected = false;
   String CurrentCarInfoKey = "CurrentCarInfo";
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("VIM Reader"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: !_validVim
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Introduce VIM Number',
                    ),
                    Container(
                        width: 200,
                        child: TextField(
                          controller: _vim,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                            if (_vim.text.length == 17) {
                              
                              
                               setState(() {
                                 _validVim = true;
                               });
                             
                            } else {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,

                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("VIM Error"), 
                                      // backgroundColor: Colors.green,
                                      shape:Border.all(),
                                      actions: [
                                        ElevatedButton(onPressed: (){
                                          Navigator.pop(context);
                                        }, child: Text("Okay"))
                                      ],
                                      content: Text("The given VIM Code is not valid, please verify it and try again."),
                                    );
                                  });
                            }
                        },
                        style: ButtonStyle(),
                        child: Text("Next"))
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Introduce Car's year",
                    ),
                    Container(
                        width: 100,
                        child: TextField(
                          controller: _year,
                          keyboardType: TextInputType.number,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                             
                              setState(() {
                                _validVim = false;
                              });
                            },
                            style: ButtonStyle(),
                            child: Text("Edit Vim Number")),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () async {

                                if (_year.text.length==4) {
                                  final prefs = await SharedPreferences.getInstance();
                             LocalCarInfo extraInfo = LocalCarInfo(_vim.text,_year.text);
                             
                             String stringed = jsonEncode(extraInfo);
                             bool saved = await prefs.setString(CurrentCarInfoKey,stringed);
                                  setState(() {
                                    _infoColected = true;
                                  });
                                  Navigator.pushNamed(
                                      context, ReportScreen.routeName);
                                }else{
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Year Error"),
                                          // backgroundColor: Colors.green,
                                          shape: Border.all(),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Okay"))
                                          ],
                                          content: Text(
                                              "The given Year is not valid, please verify it and try again."),
                                        );
                                      });
                                }
                            },
                            style: ButtonStyle(),
                            child: Text("Get Car Information")),
                      ],
                    )
                  ],
                )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
