import 'package:flutter/material.dart';
import 'package:notes/create_note_page.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>['Tarefa 0', 'Tarefa 1', 'Tarefa 2'];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("NOTES"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children:  [
            for(var i=0; i<notes.length; i++)
               Card(
                child: ListTile(
                title:Text(notes[i]),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, 
            MaterialPageRoute(builder:(context)=>CreateNotePage())).then((value) => {
              setState((){
                notes.add(value);
              })
            });
          //setState(() {
            //notes.add('Tarefa ${notes.length.toString()}');
          //});
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );

  }
}