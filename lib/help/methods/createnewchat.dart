import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../variables.dart';

void createNewChat(String name, String otherUserID) async{

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
  print(FirebaseAuth.instance.currentUser?.uid);
  await documentReference.update({
    'members': FieldValue.arrayUnion([FirebaseAuth.instance.currentUser?.uid, otherUserID]),
    'ChatID': documentReference.id,
  });

  DocumentReference documentReferenceUser = usercollection.doc(FirebaseAuth.instance.currentUser?.uid);
  await documentReferenceUser.update({
    'chats': FieldValue.arrayUnion([documentReference.id])
  });

  DocumentReference documentReferenceUser2 = usercollection.doc(otherUserID);
  await documentReferenceUser2.update({
    'chats': FieldValue.arrayUnion([documentReference.id])
  });

}

void newChatMessage(String nachricht, String chatId)async{
  chatcollection.doc(chatId).collection('messages').add({
    'message':nachricht,
    'sender':FirebaseAuth.instance.currentUser?.uid,
    'time': Timestamp.now()
  });
}

getChats(String chatId) async {
  return chatcollection
      .doc(chatId)
      .collection('messages')
      .snapshots();
}