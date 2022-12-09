import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nachhilfe_app/help/variables.dart';
import 'package:nachhilfe_app/login/signupscreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.back,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height /10,),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Text('Log in', style: mystyle(50, style.text),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height /15,),
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
            InkWell(
              onTap: (){
                try {
                  FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text);
                }catch(e){}
              },
              child: Container(
                width: MediaQuery.of(context).size.width > 200 ? 200 : MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: style.accent
                ),
                child: Center(
                  child: Text('LOG IN', style: mystyle(25, style.text),),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height /20,),
            InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpPage())),
              child: Container(
                width: MediaQuery.of(context).size.width > 200 ? 200 : MediaQuery.of(context).size.width,
                height: 60,
                child: Center(
                  child: Text('Don’t have an account? \n Sign up', style: mystyle(15, style.text), textAlign: TextAlign.center,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
