import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wiseapp/main.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SearchPage(),

    )
    ;
  }

}
class SearchPage extends StatefulWidget{
  const SearchPage({Key? key}) : super(key: key);

  @override 
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        elevation: 8.0,
      ),
  // AppBar

      body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Search for a Movie", 
            style: TextStyle
            (color:Colors.white,
            fontSize:22.0, 
            fontWeight :FontWeight.bold
          ),
         ),
         SizedBox(
          height:20.0,
         ),
         TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xff302360),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,)
          ),
         )
    ], // Column
  ),
      ),

    );
  }
}