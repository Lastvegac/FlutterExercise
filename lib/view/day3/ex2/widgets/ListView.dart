import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_part_1/view/day3/ex2/components/listViewItem.dart';
import 'package:flutter_part_1/view/day3/ex2/configuration/nearby_list.dart';

class ListViewApp extends StatefulWidget {
  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<ListViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black),
                  Text("Therapist",
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  Icon(Icons.menu, color: Colors.black),
                ],
              ),
              const SizedBox(height: 30),
              Swiper(
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      imageList[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: imageList.length,
                itemWidth: 400,
                itemHeight: 200.0,
                scale: 0.9,
                viewportFraction: 0.8,
                layout: SwiperLayout.TINDER,
                autoplay: true,
                pagination:
                    const SwiperPagination(margin: EdgeInsets.only(top: 170)),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Nearby Therapist",
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  Text("See more",
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: foodList.length,
                itemBuilder: (context, index) {
                  var food = foodList[index];
                  return ListViewItems(
                    imageUrl: food['image'] ?? '',
                    name: food['name'] ?? '',
                    address: food['address'] ?? '',
                    totalReview: '(${food['totalReview']}reviews)',
                    rating: food['rating'] ?? '',
                  );
                },
              ))
            ],
          )),
    );
  }
}
