

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'homePage.dart';

class editscreen extends StatefulWidget {
  const editscreen({super.key});

  @override
  State<editscreen> createState() => _editscreenState();
}

class _editscreenState extends State<editscreen> {

  TextEditingController _edit=TextEditingController();

  void initState(){
    super.initState();
    if(Get.arguments != null) {
      _edit.text = Get.arguments['note'].toString();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('edit'),
        centerTitle: true,
      ),

      //   ===========body======

      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal:50),
            child: TextFormField(
              controller: _edit,
            ),
          ),

          SizedBox(height: 20),
          ElevatedButton(
              onPressed: (){
                FirebaseFirestore.instance
                    .collection('notes')
                    .doc(Get.arguments['docId'].toString())
                    .update({
                  'note':_edit.text.trim()
                })
                    .then((value){
                  Get.offAll(()=> homePage());
                  print('note updated succesfully');
                });
              },
              child:Text('update')
          )
        ],
      ),
    ) ;
  }
}