import 'package:flutter/material.dart';

import '../Elemente/_assignment2.dart';
import '../Elemente/_member.dart';
import '../help/calls/membercalls.dart';
import '../help/calls/zuweisencalls.dart';
import '../help/variables.dart';

TextEditingController zuweisencontroller = TextEditingController();
TextEditingController datecontroller = TextEditingController();
TextEditingController datecontrolleryear = TextEditingController();
TextEditingController datecontrollermonth = TextEditingController();
TextEditingController datecontrollerday = TextEditingController();

class AssignmentAssignPage extends StatefulWidget {
  const AssignmentAssignPage({Key? key, required this.currAssignment}) : super(key: key);

  final Assignment2 currAssignment;

  @override
  State<AssignmentAssignPage> createState() => _AssignmentAssignPageState();
}

class _AssignmentAssignPageState extends State<AssignmentAssignPage> {

  final Future<List<Member>> member = fetchMemberAll();
  Member? currMem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.back,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            children: [
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
                        'Assignment zuweisen',
                        style: mystyle(23),
                      )),
                  const Icon(null)
                ],
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
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
                                setState(() {
                                  dropdownValue = value;
                                  zuweisencontroller.text = value!.id;
                                  currMem = value;
                                });
                              },
                              items: list?.map<DropdownMenuItem<Member>>((Member value) {
                                return DropdownMenuItem<Member>(
                                  value: value,
                                  child: Text(value.name),
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
                  'Fälligkeits Datum',
                  style: mystyle(20),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Style.lightback,
                ),
                child: TextField(
                  style: mystyle(18, Style.text),
                  cursorColor: Style.accent,
                  controller: datecontroller,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: '06.01.2023',
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
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    _selectDate(context);
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

              Container(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    postSubmission(DateTime(int.parse(datecontrolleryear.text), int.parse(datecontrollermonth.text), int.parse(datecontrollerday.text)),
                    widget.currAssignment.id,currMem!.id, widget.currAssignment.owner);
                    Navigator.pop(context);
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
                        'Zuweisen',
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
  datecontroller.text = '${selected!.day}.${selected.month}.${selected.year}';
  datecontrollerday.text = '${selected.day}';
  datecontrollermonth.text = '${selected.month}';
  datecontrolleryear.text = '${selected.year}';
  return selected;
}