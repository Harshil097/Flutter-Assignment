import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:note_app/screen/loginPage.dart';

signupuser(String name, String email, String contact, String password) async {
  var userid = FirebaseAuth.instance.currentUser;

  await FirebaseFirestore.instance
      .collection('users')
      .doc(userid!.uid)
      .set({
    'name': name,
    'email': email,
    'contact': contact,
    'password': password,
    'createAt': DateTime.now(),
    'userId': userid!.uid,
  })
      .then(
        (value) => {FirebaseAuth.instance.signOut(), Get.to(() => loginPage())},
  );
}