import 'package:flutter/material.dart';

class ListViewItems extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ListViewItems({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.rating,
    required this.totalReview,
  });

  final String imageUrl;
  final String name;
  final String address;
  final String rating;
  final String totalReview;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            height: 90,
            width: 100,
            margin: const EdgeInsets.only(right: 10),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(address),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.star),
                  Text(rating),
                  const SizedBox(width: 10),
                  Text(totalReview)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
