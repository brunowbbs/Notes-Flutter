import 'package:flutter/material.dart';

class CreateNotePage extends StatefulWidget{

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  String description = "";

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
        centerTitle: true,
        actions: [
          IconButton(icon:const Icon(Icons.delete), onPressed: (){})
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [
           Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              maxLines: 5,
              maxLength: 100,
              onChanged: (value){
                setState(() {
                  description = value;                  
                });
              },
              /*decoration: InputDecoration(
                border: InputBorder.none
              ),*/
            ),
          ),
          if(description.isNotEmpty) ElevatedButton(
            onPressed: (){
              Navigator.pop(context, description);
            }, 
            child: const Text('Salvar')
            )
        ],
      ) ,
    );

  }
}