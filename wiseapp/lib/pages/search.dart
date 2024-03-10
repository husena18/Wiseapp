import 'package:flutter/material.dart';
import 'package:wiseapp/pages/search_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<SearchModel> main_app_list = [
    SearchModel(
      "Instagram",
      "Social Media",
      "https://w7.pngwing.com/pngs/722/1011/png-transparent-logo-icon-instagram-logo-instagram-logo-purple-violet-text.png",
    ),
  ];

  List<SearchModel> display_list = List.from(main_app_list);

  void updatedList(String value) {
    setState(() {
      display_list = main_app_list
          .where(
            (element) =>
                element.app_name!.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

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
            TextField(
              onChanged: (value) => updatedList(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 234, 232, 239),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search Here",
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: display_list.isEmpty
                  ? Center(
                      child: const Text(
                        "No app found",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: const EdgeInsets.all(8.0),
                        title: Text(
                          display_list[index].app_name!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${display_list[index].app_type!}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        leading: Image.network(
                          display_list[index].app_image!,
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
