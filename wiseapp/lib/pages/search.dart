import 'package:flutter/material.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/text_to_speech.dart';
import 'package:wiseapp/pages/GoogleMaps/gm_main.dart';
import 'package:wiseapp/pages/Instagram/Insta_main.dart';
import 'package:wiseapp/pages/IRCTC/irctc_main.dart';
import 'package:wiseapp/image_fetch.dart';
import 'package:wiseapp/pages/search.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                color: Color.fromARGB(255, 158, 158, 158),
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
            // Search bar and results
            Expanded(
              child: ListView.builder(
                itemCount: performSearch(searchText, mainAppList).length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  title: Text(
                    performSearch(searchText, mainAppList)[index].appName,
                    style: const TextStyle(
                      color:Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    performSearch(searchText, mainAppList)[index].appType,
                    style: const TextStyle(color:Colors.white),
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