//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nachhilfe_app/help/variables.dart';
//import 'package:nachhilfe_app/login/loginscreen.dart';

import '../help/calls/membercalls.dart';
import '../main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController daycontroller = TextEditingController();
  TextEditingController monthcontroller = TextEditingController();
  TextEditingController yearcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.back,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height /10,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Text('Sign up', style: mystyle(50, Style.text),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width > 175 ? 175 : MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Style.lightback,
                    ),
                    child: TextField(
                      style: mystyle(18, Style.text),
                      controller: firstnamecontroller,
                      cursorColor: Style.accent,
                      decoration: InputDecoration(
                          hintText: 'First Name',
                          prefixIcon: const Icon(Icons.person_outline_rounded, color: Style.accent,),
                          prefixStyle: mystyle(20, Style.accent),
                          hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: Style.accent),
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width > 175 ? 175 : MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Style.lightback,
                    ),
                    child: TextField(
                      style: mystyle(18, Style.text),
                      controller: lastnamecontroller,
                      cursorColor: Style.accent,
                      decoration: InputDecoration(
                          hintText: 'Last Name',
                          prefixIcon: const Icon(Icons.person_outline_rounded, color: Style.accent,),
                          prefixStyle: mystyle(20, Style.accent),
                          hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: Style.accent),
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height /20,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width > 350 ? 350 : MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Style.lightback,
                ),
                child: TextField(
                  style: mystyle(18, Style.text),
                  controller: emailcontroller,
                  cursorColor: Style.accent,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.mail_outline_outlined, color: Style.accent,),
                      prefixStyle: mystyle(20, Style.accent),
                      hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2, color: Style.accent),
                        borderRadius: BorderRadius.circular(30),
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /20,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width > 350 ? 350 : MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Style.lightback,
                ),
                child: TextField(
                  style: mystyle(18, Style.text),
                  controller: passwordcontroller,
                  obscureText: true,
                  cursorColor: Style.accent,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline, color: Style.accent,),
                      hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2, color: Style.accent),
                        borderRadius: BorderRadius.circular(30),
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /20,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width > 350 ? 350 : MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Style.lightback,
                ),
                child: TextField(
                  style: mystyle(18, Style.text),
                  controller: confirmpasswordcontroller,
                  obscureText: true,
                  cursorColor: Style.accent,
                  decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      prefixIcon: const Icon(Icons.lock_outline, color: Style.accent,),
                      hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2, color: Style.accent),
                        borderRadius: BorderRadius.circular(30),
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /40,),
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width > 350 ? 350 : MediaQuery.of(context).size.width,
                child: Text('Date of Birth', style: mystyle(17),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width > 116 ? 116 : MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Style.lightback,
                    ),
                    child: TextField(
                      style: mystyle(18, Style.text),
                      controller: daycontroller,
                      cursorColor: Style.accent,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Day',
                          //prefixIcon: const Icon(Icons.mail_outline_outlined, color: style.accent,),
                          prefixStyle: mystyle(20, Style.accent),
                          hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: Style.accent),
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width > 116 ? 116 : MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Style.lightback,
                    ),
                    child: TextField(
                      style: mystyle(18, Style.text),
                      controller: monthcontroller,
                      cursorColor: Style.accent,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Month',
                          //prefixIcon: const Icon(Icons.mail_outline_outlined, color: style.accent,),
                          prefixStyle: mystyle(20, Style.accent),
                          hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: Style.accent),
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width > 116 ? 116 : MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Style.lightback,
                    ),
                    child: TextField(
                      style: mystyle(18, Style.text),
                      controller: yearcontroller,
                      cursorColor: Style.accent,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Year',
                          //prefixIcon: const Icon(Icons.mail_outline_outlined, color: style.accent,),
                          prefixStyle: mystyle(20, Style.accent),
                          hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: Style.accent),
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height /20,),
              InkWell(
                onTap: (){
                  try{
                    Future<String> string = postMember('${firstnamecontroller.text} ${lastnamecontroller.text}');
                    string.then((value) {
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailcontroller.text, password: passwordcontroller.text).then((signeduser) => {
                        usercollection.doc(signeduser.user?.uid).set({
                          //'username': usernamecontroller.text,
                          'firstName': firstnamecontroller.text,
                          'lastName': lastnamecontroller.text,
                          'email': emailcontroller.text,
                          'dayOfBirth': daycontroller.text,
                          'monthOfBirth': monthcontroller.text,
                          'yearOfBirth': yearcontroller.text,
                          //'password': passwordcontroller.text,
                          'uid': signeduser.user?.uid,
                          'id': value,
                          'chats': []
                        }),
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const NavigationPage())),
                      });
                    }
                    ); //=> id = value,

                  }catch (e){
                    print(e);
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width > 200 ? 200 : MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Style.accent
                  ),
                  child: Center(
                    child: Text('SIGN UP', style: mystyle(25, Style.text),),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /20,),
              InkWell(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const NavigationPage())),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width > 200 ? 200 : MediaQuery.of(context).size.width,
                  height: 60,
                  child: Center(
                    child: Text('Already have an account? \n Sign in', style: mystyle(15, Style.text), textAlign: TextAlign.center,),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /20,),
            ],
          ),
        ),
      ),
    );
  }
}
