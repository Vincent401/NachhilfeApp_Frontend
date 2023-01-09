import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nachhilfe_app/offer/offercreate.dart';
import '../Contract/contractcreate.dart';
import '../help/variables.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
              child: const Icon(Icons.person, size: 300,color: Style.text,),
            ),
            StreamBuilder(
            stream: usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get().asStream(),
            builder: (context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                if(snapshot.data['chats'] != null){
                  if(snapshot.data['chats'].length != 0){
                    id = snapshot.data['id'];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.data['firstName'] + ' ', style: mystyle(20),),
                        Text(snapshot.data['lastName'], style: mystyle(20),),
                      ],
                    );
                  }
                  return const Center(child: CircularProgressIndicator(color: Style.accent,),);
                }
                return const Center(child: CircularProgressIndicator(color: Style.accent,),);
              }
              return const Center(child: CircularProgressIndicator(color: Style.accent,),);
            }
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>OfferCreate(id: id))),
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
              child: InkWell( //
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ContractCreate(id: id,))),

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
}
