import 'package:flutter/material.dart';
import 'package:nachhilfe_app/Elemente/_offer.dart';

import '../Elemente/_subjects.dart';
import '../help/calls/offercalls.dart';
import '../help/calls/subjectcalls.dart';
import '../help/variables.dart';
import 'offersmal.dart';

TextEditingController subjectcontroller = TextEditingController();

class OfferCreate extends StatefulWidget {
  const OfferCreate({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<OfferCreate> createState() => _OfferCreateState();
}

class _OfferCreateState extends State<OfferCreate> {

  final Future<List<Subjects>> subjects = fetchSubjectAll();
  Subjects? currSub;
  late Future<List<Offer>> offers;

  @override
  void initState() {
    super.initState();
    gettingOffers();
  }

  gettingOffers() async {
    offers = fetchSingleOffer(widget.id);
  }

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
                        'Neues Angebot erstellen',
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

              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: (){
                    postOffer(currSub!.id.toString(), widget.id);
                    setState(() {
                      offers = fetchSingleOffer(widget.id);
                    });
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

              /*Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.85,
                margin: const EdgeInsets.only(left: 30),
                child: Text(
                  'Meine Angebote',
                  style: mystyle(20),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.85,
                margin: const EdgeInsets.only(left: 30),
                child: FutureBuilder<List<Offer>>(
                    future: offers,
                    builder: (context, future){
                      if(!future.hasData) {
                        return Container();
                      } else {
                        List<Offer>? list = future.data;
                        //print(future.data?.length);
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: list!.length,
                            itemBuilder: (context, index){
                              return OfferSmal(subjectId: list[index].subjectID,);
                            }
                        );
                      }
                    }
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
