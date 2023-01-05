import 'package:flutter/material.dart';
import 'package:nachhilfe_app/Elemente/_assignments.dart';

import '../Elemente/_member.dart';
import '../Elemente/_subjects.dart';
import '../help/calls/membercalls.dart';
import '../help/calls/subjectcalls.dart';
//import '../help/calls/submissioncalls.dart';
import '../help/variables.dart';

import 'package:http/http.dart' as http;

TextEditingController titelcontroller = TextEditingController();
TextEditingController descrcontrooller = TextEditingController();
TextEditingController subjectcontroller = TextEditingController();
TextEditingController zuweisencontroller = TextEditingController();
TextEditingController datecontroller = TextEditingController();

class AssignmentChangePage extends StatefulWidget {
  const AssignmentChangePage({Key? key, required this.currAssignment}) : super(key: key);

  final Assignment currAssignment;

  @override
  State<AssignmentChangePage> createState() => _AssignmentChangePageState();
}

void putAssignment(Assignment assignment, Subjects subjects) async {
  var url = Uri.parse('http://localhost:8080/api/v1/assignments/update/${assignment.id}?name=${titelcontroller.text}&description=${descrcontrooller.text}&subjectId=${subjects.id}');
  final response = await http.put(url); //, headers: header
  if (response.statusCode == 200) {
    //print('Good');
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

class _AssignmentChangePageState extends State<AssignmentChangePage> {

  final Future<List<Subjects>> subjects = fetchSubjectAll();
  Subjects? currSub;
  final Future<List<Member>> member = fetchMemberAll();
  Member? currMem;

  @override
  Widget build(BuildContext context) {
    titelcontroller.text = widget.currAssignment.name;
    descrcontrooller.text = widget.currAssignment.description;
    currSub;
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
                        'Assignment bearbeiten',
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
                                  //print(value.name);
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

              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.85,
                margin: const EdgeInsets.only(left: 30),
                child: Text(
                  'Zuweisen',
                  style: mystyle(20),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),

              FutureBuilder<List<Member>>(
                  future: member,
                  builder: (context, future){
                    if(!future.hasData) {
                      //print('da kommt nix');
                      return Container();
                    } else {
                      List<Member>? list = future.data;
                      Member? dropdownValue;
                      if(currMem!= null){
                        dropdownValue = currMem;
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
                            child: DropdownButton<Member>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward,color: Style.accent,),
                              elevation: 16,
                              style: const TextStyle(color: Style.text, fontSize: 18),
                              dropdownColor: Style.lightback,
                              onChanged: (Member? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value;
                                  zuweisencontroller.text = value!.id;
                                  currMem = value;
                                  //print(value.name);
                                });
                              },
                              items: list?.map<DropdownMenuItem<Member>>((Member value) {
                                return DropdownMenuItem<Member>(
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

              Container(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                     DateTime date = _selectDate(context);
                    datecontroller.text = date.year.toString();
                    //postSubmission(datecontroller.text);
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
                        'Enddatum auswählen',
                        style: mystyle(20, Style.text),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    putAssignment(widget.currAssignment, currSub!);
                    Navigator.pop(context);
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));*/
                    //postSubmission(DateTime(2023,1,10));
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
                        'speichern',
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
      ),
    );
  }
}

_selectDate(BuildContext context) async {
  final DateTime? selected = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 365)),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Style.accent,
            onPrimary: Style.text,
            onSurface: Style.text,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
            ),
          ),
          dialogBackgroundColor: Style.back
        ),
        child: child!,
      );
    },
  );
  return selected;
}