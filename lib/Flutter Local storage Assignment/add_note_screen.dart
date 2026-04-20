import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:note_app/screen/homePage.dart';

class addNote extends StatefulWidget {
  const addNote({super.key});

  @override
  State<addNote> createState() => _addNoteState();
}

class _addNoteState extends State<addNote> {

  TextEditingController _note=TextEditingController();

  User? user=FirebaseAuth.instance.currentUser;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('addNote'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _note,
                decoration: InputDecoration(
                  label: Text('add note'),
                ),
              ),
            ),





            // ==============butttons=============

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // margin: EdgeInsets.only(left: 35),
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                      onPressed:()async{
                        var note=_note.text.trim();

                        if (note.isNotEmpty){
                          await FirebaseFirestore.instance
                              .collection('notes')
                              .doc()
                              .set({
                            'createAt': DateTime.now(),
                            "note": note,
                            'userId': user?.uid,
                            'crateAt': DateTime.now()
                          }).then((value)=>Get.off(homePage()));
                        }
                      },
                      child: Text('add',style: TextStyle(
                          fontSize: 18
                      ),)
                  ),
                ),



                // ============cancel button==========

                Container(
                    child: Text('cancel')
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}