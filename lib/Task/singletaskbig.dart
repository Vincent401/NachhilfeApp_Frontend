import 'package:flutter/material.dart';
import 'package:nachhilfe_app/help/variables.dart';

class SingleTaskBig extends StatefulWidget {
  const SingleTaskBig({Key? key,required this.date, required this.title, required this.task, required this.solution, required this.color}) : super(key: key);

  final DateTime date;
  final String title;
  final String task;
  final String solution;
  final Color color;

  @override
  State<SingleTaskBig> createState() => _SingleTaskBigState();
}

class _SingleTaskBigState extends State<SingleTaskBig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.back,
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
                      child: const Icon(Icons.arrow_back_ios, size: 30, color: style.text,),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    alignment: Alignment.center,
                      child: Text(widget.title, style: mystyle(25),)
                  ),
                  const Icon(null)
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.centerRight,
                child: Text('Fälligkeitsdatum:', style: mystyle(17, widget.color),),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text('${widget.date.day}.${widget.date.month}.${widget.date.year}', style: mystyle(17, widget.color),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  widget.task,
                  style: mystyle(20, style.text, FontWeight.w300),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Lösung eingeben:',
                  style: mystyle(20),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /50,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: style.lightback,
                ),
                child: TextField(
                  style: mystyle(18, style.text),
                  cursorColor: style.accent,
                  maxLines: 10,
                  decoration: InputDecoration(
                      hintText: 'Lösung....',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2, color: style.accent),
                        borderRadius: BorderRadius.circular(30),
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /15,),
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
                        color: style.accent
                    ),
                    child: Center(
                      child: Text('Lösung einreichen', style: mystyle(20, style.text),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /15,),
            ],
          ),
        ),
      )
    );
  }
}
