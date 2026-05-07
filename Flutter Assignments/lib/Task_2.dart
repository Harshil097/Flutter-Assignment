import 'package:flutter/material.dart';

class CounterTask extends StatefulWidget {
  const CounterTask({super.key});

  @override
  State<CounterTask> createState() => _CounterTaskState();
}

class _CounterTaskState extends State<CounterTask> {
  int counter = 0;
  void IncrementCounter(){
    setState(() {
      counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This many time you cliked the button:',style: TextStyle(fontSize: 20),),
            Text('$counter',style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            IncrementCounter();
          },
          child: Icon(Icons.add),
      ),
    );
  }
}
