import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>[];

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
                  onTap: () async{
                    var response = await Navigator.pushNamed(context, '/create-note', arguments: notes[i]);

                    if(response!=null){
                      String description = response.toString();

                      if(description.isEmpty){
                        setState(() {
                          notes.removeAt(i);                        
                        });
                      }else{
                        setState(() {
                          notes[i] = description.toString();                        
                        });
                      }
                    }
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
         /*final description = await Navigator.push(context, 
            MaterialPageRoute(builder:(context)=>CreateNotePage()));*/
            final description = await  Navigator.pushNamed(context, '/create-note');
            
            setState(() {
              if(description!=null){
                notes.add(description.toString());
              }
            });
        },
        //backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );

  }
}