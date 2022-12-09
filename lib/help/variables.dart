import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class style{
  static const Color accent = Color(0xFF548c2f); //Color(0x00548c2f)
  static const Color text = Color(0xFFCCC5B9);
  static const Color back = Color(0xFF252422);
  static const Color lightback = Color(0xFF403D39);
}

TextStyle mystyle(double size, [ Color color = style.text, FontWeight fw = FontWeight.w700]){
  return TextStyle(
    inherit: true,
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}

CollectionReference usercollection = FirebaseFirestore.instance.collection('users');