import 'package:flutter/material.dart';

class ListViewItems extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ListViewItems(
      {required this.imageUrl, required this.author, required this.title});

  final String imageUrl;
  final String author;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(0.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.network(
              imageUrl,
              height: 200,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 500,
              height: 70,
              child: Container(
                padding: const EdgeInsets.all(2.0),
                color: Colors.grey[600],
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      author,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
