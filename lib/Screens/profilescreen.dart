import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../help/variables.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: (){
          try {
            FirebaseAuth.instance.signOut();
          }catch(e){print(e);}
        },
        child: Container(
          width: MediaQuery.of(context).size.width > 200 ? 200 : MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Style.accent
          ),
          child: Center(
            child: Text('Sign out', style: mystyle(25, Style.text),),
          ),
        ),
      ),
    );
  }
}
