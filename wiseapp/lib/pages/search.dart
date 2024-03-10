// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:wiseapp/main.dart';
// import 'package:wiseapp/pages/Instagram/Insta_main.dart';

// void main(){
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget{
//   const MyApp({Key? key}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: InstaMain(),

//     )
//     ;
//   }

// }
// class SearchPage extends StatefulWidget{
//   const SearchPage({Key? key}) : super(key: key);

//   @override 
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage>{

//   static List<SearchModel> main_app_list=[
//     SearchModel("Instagram","Social Media",
//     "https://firebasestorage.googleapis.com/v0/b/wiseapp-22256.appspot.com/o/instagram_assets%2FInstagram.png?alt=media&token=0fa2248e-9482-4701-ad19-ae91860f196f"),
//   ];

//   void updatedList(String value){

//   }
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       backgroundColor: Color(0xFF1f1545),
//       appBar: AppBar(
//         backgroundColor: Color(0xFF1f1545),
//         elevation: 8.0,
//       ),
//   // AppBar

//       body: Padding(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Search ", 
//             style: TextStyle
//             (color:Colors.white,
//             fontSize:22.0, 
//             fontWeight :FontWeight.bold
//           ),
//          ),
//          SizedBox(
//           height:20.0,
//          ),
//          TextField(
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: Color(0xff302360),
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0),
//             borderSide: BorderSide.none,),
//             hintText: "Search Here",
//             prefixIcon: Icon(Icons.search),
//           ),
      
//          ),
//          SizedBox(height: 20.0,),
//          Expanded(child:ListView(),),
//     ], // Column
//   ),
//       ),

//     );
//   }
// }