import 'package:flutter/material.dart';

class CreateNotePage extends StatelessWidget{
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
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              maxLines: 5,
              maxLength: 100,
              /*decoration: InputDecoration(
                border: InputBorder.none
              ),*/
            ),
          ),
          ElevatedButton(onPressed: (){}, child: const Text('Salvar'))
        ],
      ) ,
    );

  }
  
}