import 'package:flutter/material.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/text_to_speech.dart';
import 'package:wiseapp/pages/GoogleMaps/gm_main.dart';
import 'package:wiseapp/pages/Instagram/Insta_main.dart';
import 'package:wiseapp/pages/IRCTC/irctc_main.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/search.dart';

class SearchModel {
  final String appName;
  final String appType;
  final String appImage;

  SearchModel(this.appName, this.appType, this.appImage);
}

List<SearchModel> performSearch(String query, List<SearchModel> dataList) {
  if (query.isEmpty) {
    return []; // Return an empty list if the query is empty
  }

  // Perform the search and filter the dataList based on the query
  return dataList.where((item) =>
    item.appName.toLowerCase().contains(query.toLowerCase())
  ).toList();
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // ... (rest of your state variables and performSearch function)
    final List<SearchModel> mainAppList = [
    SearchModel(
      "Instagram",
      "Social Media",
      "https://w7.pngwing.com/pngs/722/1011/png-transparent-logo-icon-instagram-logo-instagram-logo-purple-violet-text.png",
    ),
    SearchModel(
      "Zomato",
      "Food Delivery",
      "https://upload.wikimedia.org/wikipedia/commons/7/75/Zomato_logo.png",
    ),
    SearchModel(
      "GPAY",
      "Payment/Finance",
      "https://w7.pngwing.com/pngs/667/120/png-transparent-google-pay-2020-hd-logo.png",
    ),
    SearchModel(
      "Google Maps",
      "Navigation",
      "https://w7.pngwing.com/pngs/200/830/png-transparent-google-map-logo-google-maps-navigation-location-text-logo-sign.png",
    ),
    SearchModel(
      "IRCTC",
      "Travel Assistance",
      "https://logos-world.net/wp-content/uploads/2020/11/IRCTC-Logo.png",
    ),
    // Add more SearchModel objects as needed
  ];

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1f1545),
        elevation: 8.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Search ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            // Search bar
            TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 234, 232, 239),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search Here",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    Navigator.push( // Navigate to another page when animation is clicked
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()), // Replace HomePage with your destination page
                    );
                  },
                  icon: Icon(Icons.mic),
                ),
              ),
            ),
            Visibility(
              visible: searchText.isEmpty,
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  
                  Text(
                    'Additional widgets',
                    style: TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    child: Text('Button'),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            // Search bar and results
            Expanded(
              child: ListView.builder(
                itemCount: performSearch(searchText, mainAppList).length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  title: Text(
                    performSearch(searchText, mainAppList)[index].appName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    performSearch(searchText, mainAppList)[index].appType,
                    style: const TextStyle(color: Colors.white),
                  ),
                  leading: Image.network(
                    performSearch(searchText, mainAppList)[index].appImage,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (_textFieldFocusNode.canRequestFocus) {
//           FocusScope.of(context).requestFocus(_textFieldFocusNode);
//         } else {
//           FocusScope.of(context).unfocus();
//         }
//       },
//       child: Scaffold(
//         backgroundColor: _switchValue ? Colors.grey[200] : Colors.black,
//         body: SafeArea(
//           top: true,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
//                     child: Container(
//                       child: ImageFetcher(
//                         imageUrl: 'instagram_assets/WiseApp.png',
//                         width: 230,
//                         height: 45,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsetsDirectional.fromSTEB(90, 0, 20, 0),
//                     child: Switch.adaptive(
//                       value: _switchValue,
//                       onChanged: (newValue) {
//                         setState(() {
//                           _switchValue = newValue;
//                         });
//                       },
//                       activeColor: Colors.blue,
//                       activeTrackColor: Colors.lightBlue,
//                       inactiveTrackColor: Colors.grey,
//                       inactiveThumbColor: Colors.grey[400],
//                     ),
//                   ),
//                 ],
               
//               ),

//               Align(
//                 alignment: AlignmentDirectional(1, -1),
//                 child: Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
//                   child: Padding(
//     padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
//     child: InkWell(
//       onTapDown: (TapDownDetails details) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => SearchPage()),
//         );
//       },
//                   child: Container(
//                     width: 2537,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       boxShadow: [
//                         BoxShadow(
//                           blurRadius: 3,
//                           color: Colors.black.withOpacity(0.2),
//                           offset: const Offset(0, 1),
//                         )
//                       ],
//                       borderRadius: BorderRadius.circular(40),
//                       border: Border.all(
//                         color: Colors.grey,
//                       ),
//                     ),
//                     alignment: AlignmentDirectional.center,
//                     child: Padding(
//                       padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 12, 0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Icon(
//                             Icons.search_rounded,
//                             color: Colors.grey,
//                             size: 24,
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
//                               child: Container(
//                                 width: 200,
//                                 child: TextField(
//                                   controller: _textController,
//                                   focusNode: _textFieldFocusNode,
//                                   decoration: InputDecoration(
//                                     labelText:  AppLocalizations.of(context)!.searchapphere,
//                                     labelStyle: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.normal,
//                                       color: Colors.black,
//                                     ),
//                                     hintStyle: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.normal,
//                                       color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//                                     ),
//                                     enabledBorder: InputBorder.none,
//                                     focusedBorder: InputBorder.none,
//                                     errorBorder: InputBorder.none,
//                                     focusedErrorBorder: InputBorder.none,
//                                     filled: true,
//                                     fillColor: Colors.grey[200],
//                                   ),
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.normal,
//                                     color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//                                   ),
//                                   cursorColor: Colors.blue,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Icon(
//                             Icons.mic_none,
//                             color: Colors.grey,
//                             size: 30,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//                 ),
//               ),
//               Flexible(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Opacity(
//                         opacity: 0.6,
//                         child: Align(
//                           alignment: AlignmentDirectional(-1, 0),
//                           child: Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
//                             child: Text(
//                                AppLocalizations.of(context)!.socialmedia,
//                               textAlign: TextAlign.start,
//                               style: TextStyle(
//                                 fontFamily: 'Readex Pro',
//                                 fontSize: 22,
//                                 color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//   padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
//   child: SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         InkWell(
//           splashColor: Colors.transparent,
//           focusColor: Colors.transparent,
//           hoverColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//           onTap: () async {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => InstaMain()),
//             );
//           },
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: InkWell(
//                     onTap: () {
//                       // Handle tapping on the image
//                     },
//                     child: ImageFetcher(
//                       imageUrl: 'instagram_assets/Instagram_logo_2016.svg.png',
//                       width: 150,
//                       height: 150,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ),
//                                       Text(
//                                          AppLocalizations.of(context)!.instagram,
//                                         style: TextStyle(
//                                           fontFamily: 'Readex Pro',
//                                           fontSize: 22,
//                                           color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
                              
//                               Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(8),
//                                       child: ImageFetcher(
//                                         imageUrl: 'instagram_assets/snapchat-logo-filters-png-5.png',
//                                         height: 150,
//                                         fit: BoxFit.scaleDown,
//                                       ),
//                                     ),
//                                   ),
//                                   Text(                 
//                                      AppLocalizations.of(context)!.snapchat,

//                                     style: TextStyle(
//                                       fontFamily: 'Readex Pro',
//                                       fontSize: 22,
//                                       color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(8),
//                                       child: ImageFetcher(
//                                         imageUrl: 'instagram_assets/pinterest-logos-vector-png-hd-14.png',
//                                         width: 150,
//                                         height: 150,
//                                         fit: BoxFit.contain,
//                                       ),
//                                     ),
//                                   ),
//                                   Text(                           
//                                               AppLocalizations.of(context)!.pinterest,
//                                     style: TextStyle(
//                                       fontFamily: 'Readex Pro',
//                                       fontSize: 22,
//                                       color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(8),
//                                       child: ImageFetcher(
//                                        imageUrl: 'instagram_assets/1690643640twitter-x-icon-png.webp',
//                                         width: 150,
//                                         height: 150,
//                                         fit: BoxFit.contain,
//                                       ),
//                                     ),
//                                   ),
//                                   Text(        
//                                       AppLocalizations.of(context)!.x,

//                                     style: TextStyle(
//                                       fontFamily: 'Readex Pro',
//                                       fontSize: 22,
//                                       color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
                     
                     
                     
                     
//                      Opacity(
//   opacity: 0.6,
//   child: Align(
//     alignment: AlignmentDirectional(-1, 0),
//     child: Padding(
//       padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
//       child: Text(
//         AppLocalizations.of(context)!.navigationapp,
//         textAlign: TextAlign.start,
//         style: TextStyle(
//                 fontFamily: 'Readex Pro',
//                 fontSize: 22,
//                 color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//               ),
//       ),
//     ),
//   ),
// ),
// Padding(
//   padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
//   child: SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         InkWell(
//           splashColor: Colors.transparent,
//           focusColor: Colors.transparent,
//           hoverColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//           onTap: () async {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => GoogleMaps()),
//             );
//           },
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: ImageFetcher(
//                         imageUrl: 'instagram_assets/google-maps-logo-on-transparent-white-background-free-vector.jpg',
//                         width: 150,
//                         height: 150,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     AppLocalizations.of(context)!.googlemaps,
//                     style: TextStyle(
//                 fontFamily: 'Readex Pro',
//                 fontSize: 22,
//                 color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//               ),
//                   ),
//                 ],
//               ),
//               Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: ImageFetcher(
//                         imageUrl: 'instagram_assets/unnamed-3.png',
//                         width: 150,
//                         height: 150,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     AppLocalizations.of(context)!.gpsnavigation,
//                     style: TextStyle(
//                 fontFamily: 'Readex Pro',
//                 fontSize: 22,
//                 color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//               ),
//                   ),
//                 ],
//               ),
//               Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: ImageFetcher(
//                         imageUrl: 'instagram_assets/unnamed-2.png',
//                         width: 150,
//                         height: 150,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     AppLocalizations.of(context)!.waze,
//                     style: TextStyle(
//                 fontFamily: 'Readex Pro',
//                 fontSize: 22,
//                 color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//               ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
// Opacity(
//   opacity: 0.6,
//   child: Align(
//     alignment: AlignmentDirectional(-1, 0),
//     child: Padding(
//       padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
//       child: Text(
//         AppLocalizations.of(context)!.foodeliveryapp,
//         textAlign: TextAlign.start,
//         style: TextStyle(
//           fontFamily: 'Readex Pro',
//           fontSize: 23,
//           color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//         ),
//       ),
//     ),
//   ),
// ),
// Padding(
//   padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
//   child: SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: ImageFetcher(
//                   imageUrl: 'instagram_assets/Zomato_logo.png',
//                   width: 150,
//                   height: 150,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Text(
//               AppLocalizations.of(context)!.zomato,
//               style: TextStyle(
//                 fontFamily: 'Readex Pro',
//                 fontSize: 22,
//                 color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//               ),
//             ),
//           ],
//         ),
//         Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: ImageFetcher(
//                   imageUrl: 'instagram_assets/Swiggy.png',
//                   width: 150,
//                   height: 150,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             Text(
//               AppLocalizations.of(context)!.swiggy,
//               style: TextStyle(
//                 fontFamily: 'Readex Pro',
//                 fontSize: 22,
//                 color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//               ),
//             ),
//           ],
//         ),
//         Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: ImageFetcher(
//                   imageUrl: 'instagram_assets/ubereats.png',
//                   width: 150,
//                   height: 150,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             Text(
//               AppLocalizations.of(context)!.swiggy,
//               style: TextStyle(
//                 fontFamily: 'Readex Pro',
//                 fontSize: 22,
//                 color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   ),
// ),                                   
//                      Opacity(
//   opacity: 0.6,
//   child: Align(
//     alignment: AlignmentDirectional(-1, 0),
//     child: Padding(
//       padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
//       child: Text(
//         AppLocalizations.of(context)!.paymentfinance,
//         textAlign: TextAlign.start,
//         style: TextStyle(
//           fontFamily: 'Readex Pro',
//           fontSize: 23,
//           color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//         ),
//       ),
//     ),
//   ),
// ),
// Padding(
//   padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
//   child: SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: ImageFetcher(
//                   imageUrl: 'instagram_assets/605abdb7af3405c6b20a426b1e128322.jpg',
//                   width: 150,
//                   height: 150,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Text(
//               AppLocalizations.of(context)!.gpay,
//               style: TextStyle(
//                 fontFamily: 'Readex Pro',
//                 fontSize: 22,
//                 color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//               ),
//             ),
//           ],
//         ),
//         Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: ImageFetcher(
//                   imageUrl: 'instagram_assets/Screenshot_2024-02-23_at_23.57.04.png',
//                   width: 150,
//                   height: 150,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             Text(
//               AppLocalizations.of(context)!.phonepay,
//               style: TextStyle(
//                 fontFamily: 'Readex Pro',
//                 fontSize: 22,
//                 color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//               ),
//             ),
//           ],
//         ),
//         Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: ImageFetcher(
//                   imageUrl: 'instagram_assets/Screenshot_2024-02-23_at_23.58.44.png',
//                   width: 150,
//                   height: 150,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             Text(
//               AppLocalizations.of(context)!.paytm,
//               style: TextStyle(
//                 fontFamily: 'Readex Pro',
//                 fontSize: 22,
//                 color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   ),
// ),


//   Opacity(
//   opacity: 0.6,
//   child: Column(
//     children: [
//       Align(
//         alignment: AlignmentDirectional(-1, 0),
//         child: Padding(
//           padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
//           child: Text(
//             AppLocalizations.of(context)!.travelapp,
//             textAlign: TextAlign.start,
//             style: TextStyle(
//               fontFamily: 'Readex Pro',
//               fontSize: 23,
//               color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//             ),
//           ),
//         ),
//       ),
//     ],
//   ),
// ),
// Padding(
//   padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
//   child: SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         InkWell(
//           splashColor: Colors.transparent,
//           focusColor: Colors.transparent,
//           hoverColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//           onTap: () async {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => IRCTC()),
//             );
//           },
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: ImageFetcher(
//                         imageUrl: 'instagram_assets/google-maps-logo-on-transparent-white-background-free-vector.jpg',
//                         width: 150,
//                         height: 150,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     AppLocalizations.of(context)!.irctc,
//                     style: TextStyle(
//                 fontFamily: 'Readex Pro',
//                 fontSize: 22,
//                 color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//               ),
//                   ),
//                 ],
//               ),
//         Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: ImageFetcher(
//                   imageUrl: 'instagram_assets/unnamed-4.png',
//                   width: 150,
//                   height: 150,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             Text(
//               AppLocalizations.of(context)!.makemytrip,
//               style: TextStyle(
//                 fontFamily: 'Readex Pro',
//                 fontSize: 22,
//                 color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//               ),
//             ),
//           ],
//         ),
//         Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: ImageFetcher(
//                   imageUrl: 'instagram_assets/unnamed.png',
//                   width: 150,
//                   height: 150,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             Text(
//               AppLocalizations.of(context)!.whereismytrain,
//               style: TextStyle(
//                 fontFamily: 'Readex Pro',
//                 fontSize: 22,
//                 color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   ),
//       ],

          
//         ),
//                 ),
//               ),

//       ],
//     ),
//   ),
// ),
// ],
// ),
// ),
// ),
// );             

//   }
