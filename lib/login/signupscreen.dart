import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nachhilfe_app/help/variables.dart';
import 'package:nachhilfe_app/login/loginscreen.dart';

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
      backgroundColor: style.back,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height /10,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Text('Sign up', style: mystyle(50, style.text),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width > 175 ? 175 : MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: style.lightback,
                    ),
                    child: TextField(
                      style: mystyle(18, style.text),
                      controller: firstnamecontroller,
                      cursorColor: style.accent,
                      decoration: InputDecoration(
                          hintText: 'First Name',
                          prefixIcon: const Icon(Icons.mail_outline_outlined, color: style.accent,),
                          prefixStyle: mystyle(20, style.accent),
                          hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: style.accent),
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
                      color: style.lightback,
                    ),
                    child: TextField(
                      style: mystyle(18, style.text),
                      controller: lastnamecontroller,
                      cursorColor: style.accent,
                      decoration: InputDecoration(
                          hintText: 'Last Name',
                          prefixIcon: const Icon(Icons.mail_outline_outlined, color: style.accent,),
                          prefixStyle: mystyle(20, style.accent),
                          hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: style.accent),
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
                  color: style.lightback,
                ),
                child: TextField(
                  style: mystyle(18, style.text),
                  controller: emailcontroller,
                  cursorColor: style.accent,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.mail_outline_outlined, color: style.accent,),
                      prefixStyle: mystyle(20, style.accent),
                      hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2, color: style.accent),
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
                  color: style.lightback,
                ),
                child: TextField(
                  style: mystyle(18, style.text),
                  controller: passwordcontroller,
                  obscureText: true,
                  cursorColor: style.accent,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline, color: style.accent,),
                      hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2, color: style.accent),
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
                  color: style.lightback,
                ),
                child: TextField(
                  style: mystyle(18, style.text),
                  controller: confirmpasswordcontroller,
                  obscureText: true,
                  cursorColor: style.accent,
                  decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      prefixIcon: const Icon(Icons.lock_outline, color: style.accent,),
                      hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2, color: style.accent),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width > 116 ? 116 : MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: style.lightback,
                    ),
                    child: TextField(
                      style: mystyle(18, style.text),
                      controller: daycontroller,
                      cursorColor: style.accent,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Day',
                          //prefixIcon: const Icon(Icons.mail_outline_outlined, color: style.accent,),
                          prefixStyle: mystyle(20, style.accent),
                          hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: style.accent),
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
                      color: style.lightback,
                    ),
                    child: TextField(
                      style: mystyle(18, style.text),
                      controller: monthcontroller,
                      cursorColor: style.accent,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Month',
                          //prefixIcon: const Icon(Icons.mail_outline_outlined, color: style.accent,),
                          prefixStyle: mystyle(20, style.accent),
                          hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: style.accent),
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
                      color: style.lightback,
                    ),
                    child: TextField(
                      style: mystyle(18, style.text),
                      controller: yearcontroller,
                      cursorColor: style.accent,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Year',
                          //prefixIcon: const Icon(Icons.mail_outline_outlined, color: style.accent,),
                          prefixStyle: mystyle(20, style.accent),
                          hintStyle: mystyle(20, Colors.grey,FontWeight.w700),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: style.accent),
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
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailcontroller.text, password: passwordcontroller.text).then((signeduser) => {
                        usercollection.doc(signeduser.user?.uid).set({
                        //'username': usernamecontroller.text,
                        'first name': firstnamecontroller.text,
                        'last name': lastnamecontroller.text,
                        'email': emailcontroller.text,
                        'day of birth': daycontroller.text,
                        'month of birth': monthcontroller.text,
                        'year of birth': yearcontroller.text,
                        //'password': passwordcontroller.text,
                        'uid': signeduser.user?.uid,
                      }),
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const NavigationPage())),
                    });
                  }catch (e){
                    //print(e);
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width > 200 ? 200 : MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: style.accent
                  ),
                  child: Center(
                    child: Text('SIGN UP', style: mystyle(25, style.text),),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /20,),
              InkWell(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const NavigationPage())),
                child: Container(
                  width: MediaQuery.of(context).size.width > 200 ? 200 : MediaQuery.of(context).size.width,
                  height: 60,
                  child: Center(
                    child: Text('Already have an account? \n Sign in', style: mystyle(15, style.text), textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
