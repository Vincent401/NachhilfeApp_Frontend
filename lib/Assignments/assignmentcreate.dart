import 'dart:convert';

//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nachhilfe_app/Elemente/_subjects.dart';
import 'package:nachhilfe_app/Screens/homescreen.dart';
import 'package:nachhilfe_app/help/calls/subjectcalls.dart';
//import 'package:nachhilfe_app/Elemente/_assignments.dart';
import 'package:nachhilfe_app/help/variables.dart';

import 'package:http/http.dart' as http;

//import '../help/calls.dart';
//import 'package:nachhilfe_app/main.dart';

TextEditingController titelcontroller = TextEditingController();
TextEditingController descrcontrooller = TextEditingController();
TextEditingController subjectcontroller = TextEditingController();


class AssignmentCreatePage extends StatefulWidget {
  const AssignmentCreatePage({Key? key}) : super(key: key);

  @override
  State<AssignmentCreatePage> createState() => _AssignmentCreatePageState();
}

void postAssignment() async {
  DocumentSnapshot userdoc =
      await usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get();

  var url = Uri.parse('http://localhost:8080/api/v1/assignments/add');
  Map<String, dynamic> body = {
    "owner": userdoc['id'],
    "subject": subjectcontroller.text.toString(),
    "name": titelcontroller.text.toString(),
    "description": descrcontrooller.text.toString()
  }; //titelcontroller.text.toString(), descrcontrooller.text.toString() //"deleted": "false"
  Map<String, String> header = <String, String>{
    'Content-Type': 'application/json'
  };
  final response = await http.post(url,
      body: jsonEncode(body), headers: header); //, headers: header
  if (response.statusCode == 200) {
    //print('Good');
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
  titelcontroller.text = '';
  descrcontrooller.text = '';
  subjectcontroller.text = '';
}

class _AssignmentCreatePageState extends State<AssignmentCreatePage> {

  final Future<List<Subjects>> subjects = fetchSubjectAll();
  Subjects? currSub = null;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Style.back,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Style.text,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Neues Assignment erstellen',
                          style: mystyle(23),
                        )),
                    const Icon(null)
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.85,
                  margin: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Titel',
                    style: mystyle(20),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.85,
                  //height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Style.lightback,
                  ),
                  child: TextField(
                    style: mystyle(18, Style.text),
                    cursorColor: Style.accent,
                    controller: titelcontroller,
                    maxLines: 1,
                    decoration: InputDecoration(
                        hintText: 'Mathe Assignment....',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        hintStyle: mystyle(20, Colors.grey, FontWeight.w300),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Style.accent),
                          borderRadius: BorderRadius.circular(30),
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.85,
                  margin: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Beschreibung',
                    style: mystyle(20),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.85,
                  //height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Style.lightback,
                  ),
                  child: TextField(
                    style: mystyle(18, Style.text),
                    cursorColor: Style.accent,
                    maxLines: 5,
                    controller: descrcontrooller,
                    decoration: InputDecoration(
                        hintText: 'Mathe Assignment zu....',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        hintStyle: mystyle(20, Colors.grey, FontWeight.w300),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Style.accent),
                          borderRadius: BorderRadius.circular(30),
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.85,
                  margin: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Schulfach',
                    style: mystyle(20),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),
                /*Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.85,
                  //height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Style.lightback,
                  ),
                  child: TextField(
                    style: mystyle(18, Style.text),
                    cursorColor: Style.accent,
                    maxLines: 1,
                    controller: subjectcontroller,
                    decoration: InputDecoration(
                        hintText: 'Mathe....',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        hintStyle: mystyle(20, Colors.grey, FontWeight.w300),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Style.accent),
                          borderRadius: BorderRadius.circular(30),
                        )),
                  ),
                ),*/
                FutureBuilder<List<Subjects>>(
                    future: subjects,
                    builder: (context, future){
                      if(!future.hasData) {
                        return Container();
                      } else {
                        List<Subjects>? list = future.data;
                        Subjects? dropdownValue;
                        if(currSub!= null){
                          dropdownValue = currSub;
                        }
                        return Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.85,
                            //height: MediaQuery.of(context).size.height * 0.3,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Style.lightback,
                            ),
                            child: SizedBox(
                              width:MediaQuery.of(context).size.width * 0.83,
                              child: DropdownButton<Subjects>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_downward,color: Style.accent,),
                                elevation: 16,
                                style: const TextStyle(color: Style.text, fontSize: 18),
                                dropdownColor: Style.lightback,
                                onChanged: (Subjects? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    dropdownValue = value;
                                    subjectcontroller.text = value!.id;
                                    currSub = value;
                                    print(value.name);
                                  });
                                },
                                items: list?.map<DropdownMenuItem<Subjects>>((Subjects value) {
                                  return DropdownMenuItem<Subjects>(
                                    value: value,
                                    child: Text(value.name),//
                                  );
                                }).toList(),
                              ),
                            )
                        );
                      }
                    }
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                /*Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.85,
                margin: const EdgeInsets.only(left: 30),
                child: Text(
                  'Fälligkeits Datum',
                  style: mystyle(20),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /100,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.85,
                //height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Style.lightback,
                ),
                child: TextField(
                  style: mystyle(18, Style.text),
                  cursorColor: Style.accent,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: '24.12.2022....',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      hintStyle: mystyle(20, Colors.grey,FontWeight.w300),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2, color: Style.accent),
                        borderRadius: BorderRadius.circular(30),
                      )
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.85,
                margin: const EdgeInsets.only(left: 30),
                child: Text(
                  'Zuweisen',
                  style: mystyle(20),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /100,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.85,
                //height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Style.lightback,
                ),
                child: TextField(
                  style: mystyle(18, Style.text),
                  cursorColor: Style.accent,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: 'John....',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      hintStyle: mystyle(20, Colors.grey,FontWeight.w300),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2, color: Style.accent),
                        borderRadius: BorderRadius.circular(30),
                      )
                  ),
                ),
              ),*/



                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      postAssignment();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width > 250
                          ? 250
                          : MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Style.accent),
                      child: Center(
                        child: Text(
                          'Assignment erstellen',
                          style: mystyle(20, Style.text),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
              ],
            ),
          ),
        ));
  }
}
