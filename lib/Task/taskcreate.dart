import 'package:flutter/material.dart';
import 'package:nachhilfe_app/help/variables.dart';

class TaskCreatePage extends StatefulWidget {
  const TaskCreatePage({Key? key}) : super(key: key);

  @override
  State<TaskCreatePage> createState() => _TaskCreatePageState();
}

class _TaskCreatePageState extends State<TaskCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.back,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height /15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Icon(Icons.arrow_back_ios, size: 30, color: Style.text,),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text('Neue Aufgabe erstellen', style: mystyle(25),)
                  ),
                  const Icon(null)
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.85,
                margin: const EdgeInsets.only(left: 30),
                child: Text(
                  'Titel',
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
                      hintText: 'Mathe Aufgabe....',
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
                  'Aufgaben Text',
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
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Rechne 1 + 1....',
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
                  'Lösungs Text',
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
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Lösung ist 2....',
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
              ),

              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width > 250 ? 250 : MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Style.accent
                    ),
                    child: Center(
                      child: Text('Aufgabe erstellen', style: mystyle(20, Style.text),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /25,),
            ],
          ),
        ),
      )
    );
  }
}
