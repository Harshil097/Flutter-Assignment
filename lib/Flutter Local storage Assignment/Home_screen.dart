

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:note_app/screen/addNote.dart';
import 'package:note_app/screen/editScreen.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  User? user=FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('homePage'),
        centerTitle: true,
      ),

      body: Container(
        child: StreamBuilder(
            stream:
            FirebaseFirestore.instance
                .collection('notes')
                .where('userId', isEqualTo: user!.uid)
                .snapshots(),

            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('error');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CupertinoActivityIndicator());
              }

              if(snapshot !=null && snapshot.data !=null) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var Note = snapshot.data!.docs[index]['note'];
                      var noteId = snapshot.data!.docs[index]['userId'];
                      var docId = snapshot.data!.docs[index].id;


                      return Card(
                        margin: EdgeInsets.all(8),
                        child: ListTile(
                          title: Text(Note),
                          subtitle: Text(snapshot.data!.docs[index]['userId']),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              GestureDetector(
                                onTap: (){
                                  Get.to(()=> editscreen());
                                },
                                child: Icon(Icons.edit),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: (){
                                  showDialog(
                                      context: context,
                                      builder:
                                          (BuildContext context )=>AlertDialog(
                                        title: Text('delete'),
                                        content: Text('are you sure to delete'),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: ()async {
                                                await FirebaseFirestore.instance
                                                    .collection('notes')
                                                    .doc(docId)
                                                    .delete();
                                                Navigator.pop(context);
                                              },
                                              child: Text('Yes')
                                          ),

                                          TextButton(
                                              onPressed: (){
                                                Navigator.pop(context ,'ok');
                                              },
                                              child: Text('No')
                                          ),
                                        ],
                                      )
                                  );
                                },
                                child: Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                );
              }
              return Container();
            }
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(addNote());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}