// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../db/db_helper.dart';
import 'add_note_screen.dart';
import 'edit_note_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List notes = [];

  void fetchNotes() async {
    notes = await DBHelper.getNotes();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
        centerTitle: true,
      ),
      body: notes.isEmpty
          ? Center(child: Text("No Notes Found"))
          : ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(notes[index]['title']),
              subtitle: Text(notes[index]['description']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditNoteScreen(
                            id: notes[index]['id'],
                            title: notes[index]['title'],
                            description: notes[index]['description'],
                          ),
                        ),
                      );
                      fetchNotes();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await DBHelper.deleteNote(notes[index]['id']);
                      fetchNotes();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddNoteScreen()),
          );
          fetchNotes();
        },
      ),
    );
  }
}