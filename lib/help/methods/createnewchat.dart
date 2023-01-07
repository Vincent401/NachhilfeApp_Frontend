import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../variables.dart';

void CreateNewChat(String name, String otherUserID) async{

  DocumentReference documentReference = await chatcollection.add(
    {
      'ChatID': '',
      'ChatName': name,
      'members': [],
      'RecentMessage': '',
      'RecentMessageSender': '',
      'RecentMessageTime': '',
      'messages':''
    }
  );
  await documentReference.update({
    'members': FieldValue.arrayUnion([FirebaseAuth.instance.currentUser?.uid, otherUserID]),
    'ChatID': documentReference.id,
  });

  DocumentReference documentReferenceUser = usercollection.doc(FirebaseAuth.instance.currentUser?.uid);
  await documentReferenceUser.update({ //return
    'chats': FieldValue.arrayUnion([documentReference.id])
  });

  DocumentReference documentReferenceUser2 = usercollection.doc(otherUserID);
  await documentReferenceUser2.update({ //return
    'chats': FieldValue.arrayUnion([documentReference.id])
  });

}

void newChatMessage(String nachricht, String chatId)async{
  chatcollection.doc(chatId).collection('messages').add({
    'message':nachricht,
    'sender':FirebaseAuth.instance.currentUser?.uid,
    'time': Timestamp.now()
  });

  void getUserId(String id) async{
    /*Stream temp = await usercollection.doc().get().asStream();
    for (int i = 0; i < num.parse(temp.length.toString()); i++) {
      if(id.compareTo(temp.document[i]) == 0){

      }
    }*/
    QuerySnapshot querySnapshot = await usercollection.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    for(int i = 0; i < num.parse(allData.length.toString()); i++){
      if(List[i])
    }
    print(allData);

  }

  /*DocumentReference documentReference = await messagescollection.add({
    'message':nachricht,
    'sender':FirebaseAuth.instance.currentUser?.uid,
    'time': Timestamp.now()
  });

  documentReference.collection('messages').add({
    'message':nachricht,
    'sender':FirebaseAuth.instance.currentUser?.uid,
    'time': Timestamp.now()
  });
  'message':nachricht,
    'sender':FirebaseAuth.instance.currentUser?.uid,
    'time': Timestamp.now()

  DocumentReference documentReference = await chatcollection.doc(chatID);
  documentReference.update({
    'messages': FieldValue.arrayUnion(['Nachricht 1'])
  });*/
}

getChats(String chatId) async {
  return chatcollection
      .doc(chatId)
      .collection('messages')
      //.orderBy('time')
      .snapshots();
}