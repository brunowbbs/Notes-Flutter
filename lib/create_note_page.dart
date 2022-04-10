import 'package:flutter/material.dart';

class CreateNotePage extends StatefulWidget{

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  String description = "";
  var textController = TextEditingController();
  var isEditing = false;

  @override
  void initState() {

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) { 
    if(ModalRoute.of(context)!.settings.arguments != null){
      description = ModalRoute.of(context)!.settings.arguments.toString();
      textController.text = description;

      setState(() {
        isEditing = true;
      });

    }

    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title:  Text( isEditing ? 'Edit Note': 'Create Note'),
        centerTitle: true,
        actions: [
          if(isEditing)
          IconButton(icon:const Icon(Icons.delete), onPressed: (){
            Navigator.pop(context,"");
          })
        ],
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [
           Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              //maxLines: 5,
              decoration: const InputDecoration(
                labelText: "Descrição"
              ),
              controller: textController,
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