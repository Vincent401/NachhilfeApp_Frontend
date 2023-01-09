import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nachhilfe_app/Elemente/_offer.dart';

import '../help/calls/contractcalls.dart';
import '../help/calls/offercalls.dart';
import '../help/methods/createnewchat.dart';
import '../help/variables.dart';

class ContractCreate extends StatefulWidget {
  ContractCreate({Key? key, required this.id}) : super(key: key);

  String id;

  @override
  State<ContractCreate> createState() => _ContractCreateState();
}

class _ContractCreateState extends State<ContractCreate> {

  final Future<List<Offer>> offers = fetchOfferAll();
  Offer? currOff;

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
                        'Ein Nachhilfe Angebot finden',
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
                  'Angebot aussuchen',
                  style: mystyle(20),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              FutureBuilder<List<Offer>>(
                  future: offers,
                  builder: (context, future){
                    if(!future.hasData) {
                      print('Pos 1');
                      return Container();
                    } else {
                      print('Pos 2');
                      List<Offer>? list = future.data;
                      Offer? dropdownValue;
                      if(currOff!= null){
                        dropdownValue = currOff;
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
                            child: DropdownButton<Offer>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward,color: Style.accent,),
                              elevation: 16,
                              style: const TextStyle(color: Style.text, fontSize: 18),
                              dropdownColor: Style.lightback,
                              onChanged: (Offer? value) {
                                setState(() {
                                  dropdownValue = value;
                                  currOff = value;
                                });
                              },
                              items: list?.map<DropdownMenuItem<Offer>>((Offer value) {
                                return DropdownMenuItem<Offer>(
                                  value: value,
                                  child: Text(value.subjectID)
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
                  onTap: (){
                    postContract(currOff!.memberID,widget.id,currOff!.subjectID );
                    createNewChat('Chat Name', 'zkSxXjj9WNhd6so3AaPrsoI5lGd2');
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
                        'Angebot wählen',
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