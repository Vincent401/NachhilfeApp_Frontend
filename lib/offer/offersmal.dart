import 'package:flutter/material.dart';
import 'package:nachhilfe_app/Elemente/_offer.dart';
import 'package:nachhilfe_app/Elemente/_subjects.dart';
import 'package:nachhilfe_app/help/variables.dart';

import '../help/calls/subjectcalls.dart';

class OfferSmal extends StatefulWidget {
  OfferSmal({Key? key, required this.subjectId}) : super(key: key);

  String subjectId;

  @override
  State<OfferSmal> createState() => _OfferSmalState();
}

class _OfferSmalState extends State<OfferSmal> {

  @override
  Widget build(BuildContext context) {
    Future<List<Subjects>> subject = fetchSubjectOne(widget.subjectId);

    return Container(
      child: FutureBuilder<List<Subjects>>(
          future: subject,
          builder: (context, future){
            if(!future.hasData) {
              print(future.data?.length);
              return Container();
            } else {
              List<Subjects>? list = future.data;
              print('Subjects: ' + list!.first.name);
              return Text('HI ho' + list!.first.name, style: mystyle(20),);
            }
          }
      ),
    );
  }
}
