import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:note_app/screen/homePage.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();

  final globalkey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('login'),
        centerTitle: true,
      ),

      body: Form(
        key: globalkey,
        child: Center(
          child: Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          label: Text('enter your email'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )
                      ),
                      validator:(value){
                        if (value==null || value.isEmpty){
                          return 'enter your email';
                        }
                        return null;
                      }
                  ),
                ),


                SizedBox(height: 20),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                        controller: _password,
                        decoration: InputDecoration(
                            label: Text('enter your password'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )
                        ),
                        validator: (value){
                          if (value ==null || value.isEmpty){
                            return 'enter password';
                          }
                          return null;
                        }

                    )
                ),



                // ===============buttons===================

                SizedBox(height: 20),
                Container(
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

                      onPressed: ()async{
                        var email=_email.text.trim();
                        var password=_password.text.trim();

                        try{
                          final User? loginuser=
                              (await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: email,
                                  password: password
                              )).user;
                          if (loginuser != null){
                            Get.to(()=> homePage());
                          }
                          else{
                            print('email or password is incorrect');
                          }
                        }on FirebaseAuthException catch (e){
                          print('errooorr');
                        }

                      },
                      child: Text('login',style: TextStyle(
                          fontSize: 18
                      ),)
                  ),
                ),



                SizedBox(height: 20),
                InkWell(
                    onTap: (){},
                    child: Text('forgot-password',style: TextStyle(
                        fontSize: 18
                    ),)
                ),

                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  height: 50,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, 'signup');
                      },
                      child: Text('Sign-Up')

                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}