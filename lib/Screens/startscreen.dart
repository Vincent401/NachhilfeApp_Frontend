import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Elemente/_offer.dart';
import '../Elemente/_subjects.dart';
import '../help/calls/offercalls.dart';
import '../help/calls/subjectcalls.dart';
import '../help/variables.dart';

TextEditingController subjectcontroller = TextEditingController();
TextEditingController offercontroller = TextEditingController();

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  bool _isLoading = false;
  final Future<List<Subjects>> subjects = fetchSubjectAll();
  Subjects? currSub;
  final Future<List<Offer>> offers = fetchOfferAll();
  Offer? currOff;
  String id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.back,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height /15,),
            Container(
              alignment: Alignment.center,
              child: Icon(Icons.person, size: 300,color: Style.text,),
            ),
            StreamBuilder(
              stream: usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get().asStream(), 
              builder: (context, AsyncSnapshot snapshot){
                id = snapshot.data['id'];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data['firstName'] + ' ', style: mystyle(20),),
                    Text(snapshot.data['lastName'], style: mystyle(20),),
                  ],
                );
              }
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  popUpDialog(context);
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
                      'Angebot erstellen',
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
                  popUpDialog2(context);
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
                      'Angebot aussuchen',
                      style: mystyle(20, Style.text),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  popUpDialog(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Style.lightback,
        title: Center(child: Text('Erstelle ein Angebot', style: mystyle(25), textAlign: TextAlign.left,)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _isLoading ? const Center(child: CircularProgressIndicator(color: Style.accent,),) :
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
          ],
        ),
        actions: [
          //ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: const Text('CANCEL'),),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                setState(() {
                  _isLoading = false;
                });
                postOffer(currSub!.id, id);
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll<Color>(Style.accent),
                  textStyle: MaterialStatePropertyAll<TextStyle>(mystyle(25)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Style.accent),
                      )
                  ),
                  padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 10, horizontal: 10))
              ),
              child: const Text('Angebot erstellen'),
            ),
          )
        ],
      );
    });
  }
  //fetchOfferAll
  popUpDialog2(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Style.lightback,
        title: Center(child: Text('Erstelle ein Angebot', style: mystyle(25), textAlign: TextAlign.left,)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _isLoading ? const Center(child: CircularProgressIndicator(color: Style.accent,),) :
            FutureBuilder<List<Offer>>(
                future: offers,
                builder: (context, future){
                  if(!future.hasData) {
                    return Container();
                  } else {
                    List<Offer>? list = future.data;
                    Offer? dropdownValue;
                    if(currOff!= null){
                      dropdownValue = currOff;
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
                          child: DropdownButton<Offer>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward,color: Style.accent,),
                            elevation: 16,
                            style: const TextStyle(color: Style.text, fontSize: 18),
                            dropdownColor: Style.lightback,
                            onChanged: (Offer? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue = value;
                                offercontroller.text = value!.id;
                                currOff = value;
                              });
                            },
                            items: list?.map<DropdownMenuItem<Offer>>((Offer value) {
                              return DropdownMenuItem<Offer>(
                                value: value,
                                child: Text(value.subjectID),//
                              );
                            }).toList(),
                          ),
                        )
                    );
                  }
                }
            ),
          ],
        ),
        actions: [
          //ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: const Text('CANCEL'),),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                setState(() {
                  _isLoading = false;
                });
                //postOffer(currSub!.id, id);
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll<Color>(Style.accent),
                  textStyle: MaterialStatePropertyAll<TextStyle>(mystyle(25)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Style.accent),
                      )
                  ),
                  padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 10, horizontal: 10))
              ),
              child: const Text('Angebot erstellen'),
            ),
          )
        ],
      );
    });
  }

}
