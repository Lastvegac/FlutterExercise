import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_part_1/view/day1/ex9/components/endpoint.apiProvider.dart';
import 'package:flutter_part_1/view/day1/ex9/components/listViewItem.dart';
import 'package:url_launcher/url_launcher.dart';

class Example9 extends StatefulWidget {
  const Example9({Key? key}) : super(key: key);

  @override
  _Example9State createState() => _Example9State();
}

class _Example9State extends State<Example9> {
  ApiProvider apiProvider = ApiProvider();

  @override
  void initState() {
    super.initState();

    getMediumData();
  }

  late bool isLoading = false;
  late String searchTerm;
  late String title;
  //List<MediumWidget> todoWidgets = [];
  TextEditingController editingController = TextEditingController();
  late String descrip;
  late int length;
  List<dynamic> itemsList = [];
  // ignore: prefer_typing_uninitialized_variables
  var mediumData;
  late String imageUrl;

  Future getMediumData() async {
    mediumData = await apiProvider.getBlogs();
    title = mediumData['feed']['title'];
    imageUrl = mediumData['items'][0]['thumbnail'];
    isLoading = true;
    // ignore: avoid_print
    print(imageUrl);
    log(mediumData);
    setState(() {
      itemsList = mediumData['items'];
    });
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.lightBlueAccent,
        ),
      );
    }
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchTerm = value;
                  });
                },
                controller: editingController,
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                    shrinkWrap: false,
                    //scrollDirection: Axis.horizontal,
                    //physics: NeverScrollableScrollPhysics(),
                    itemCount: itemsList.length,
                    itemBuilder: (BuildContext context, int i) {
                      if (editingController.text.isEmpty) {
                        return InkWell(
                          onTap: () {
                            _launchURL(mediumData['items'][i]['link']);
                          },
                          child: ListViewItems(
                            author: mediumData['items'][i]['author'],
                            imageUrl: mediumData['items'][i]['thumbnail'],
                            title: mediumData['items'][i]['title'],
                          ),
                        );
                      } else if (mediumData['items'][i]['title']
                          .toLowerCase()
                          .contains(editingController.text)) {
                        return InkWell(
                          onTap: () {
                            launch(mediumData['items'][i]['link']);
                          },
                          child: ListViewItems(
                            author: mediumData['items'][i]['author'],
                            imageUrl: mediumData['items'][i]['thumbnail'],
                            title: mediumData['items'][i]['title'],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
