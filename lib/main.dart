import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
int blackcolor=0;
int redcolor=0;
String Check(){
 if(blackcolor>redcolor)
  return 'Black Wins';
 else if(redcolor>blackcolor)
   return'Red Wins';
 else {
   return 'Draw';
 }
}
void Restart(){
 blackcolor=0;
 redcolor=0;
}
int Cardflip(){
  Random random=Random();
  return random.nextInt(12)+1;
}
bool isvisible(){
  if(redcolor!=0 && blackcolor!=0){
    return true;
  }
  else{
    return false;
  }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
            title: Center(child: Text('Card Game'))),
        body: Center(
          child: Row(
              children: [

                TextButton(
                  onPressed: (){
                    setState(() {
                      blackcolor=Cardflip();
                    });
                  },
                  child: Expanded(
                      child: Image
                        (image: AssetImage('assets/black$blackcolor.png'))),
                ),


                 TextButton(onPressed: (){
                   setState(() {
                     redcolor=Cardflip();
                   });
                 } ,
                 child: Expanded(child: Image(image: AssetImage('assets/red$redcolor.png')))
                 ),
              ],


          ),
        ),
        bottomSheet: Visibility(
          visible: isvisible(),
          child: Container(
            padding: EdgeInsets.all(20),
            width:MediaQuery.of(context).size.width ,
            height: 150,
            child: Column(
               children: [
                 Text(Check(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                 SizedBox(height: 10,),
                 TextButton(onPressed: (){
                   setState(() {
                     Restart();
                   });;
                 }, child:Text('Re-Start',style: TextStyle(color: Colors.white),),
                   style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                 ),

               ],
            ),

          ),
        ),
      ),
    );
  }
}
