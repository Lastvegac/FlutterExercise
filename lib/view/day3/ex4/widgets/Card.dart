import 'package:flutter/material.dart';
import 'package:flutter_part_1/utils/size_config.dart';
import 'package:flutter_part_1/view/day3/ex4/widgets/profile_avatar.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

ImagePicker picker = ImagePicker();

const avatar =
    'https://petkingdomspa.com/wp-content/uploads/2021/01/CAT-LONG-CHO-CHO.jpg';
const txtDCStyle = TextStyle(fontSize: 10, color: Colors.white);

class CardApp extends StatefulWidget {
  const CardApp({Key? key}) : super(key: key);

  @override
  _CardAppState createState() => _CardAppState();
}

//() => Navigator.of(context).pop()
class _CardAppState extends State<CardApp> {
  bool isChecked = false;
  String text =
      '"Maybe that"s what batman us about. Not winning...but failing, and getting back up. Knowing he"ll fail, fail a thousand times but still won"t give up."';

  String content = '';
  DateTime selectedDate = DateTime.now();

  PickedFile? imageFile;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  const Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: const Text("Gallery"),
                    leading: const Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: const Text("Camera"),
                    leading: const Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void handleCheckbox(value) {
    setState(() {
      isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: null,
        ),
        title: const Text("Enouvo - Flutter Training Series"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[200],
        padding:
            const EdgeInsets.only(top: 50, bottom: 20, right: 20, left: 20),
        constraints: BoxConstraints.expand(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              // padding: const EdgeInsets.only(left: 20),
              height: 60,
              width: 350,
              child: Row(
                children: <Widget>[
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    value: isChecked,
                    // onChanged: (bool? value) {
                    //   setState(() {
                    //     isChecked = value!;
                    //   });
                    // },
                    onChanged: handleCheckbox,
                  ),
                  const Text('Make a coffee')
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              height: 140,
              width: 350,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20),
                          child: Column(
                            children: [
                              imageFile != null
                                  ? ProfileAvatar(
                                      isActive: true,
                                      newImageUrl: imageFile?.path)
                                  : const ProfileAvatar(
                                      imageUrl: avatar,
                                      isActive: true,
                                    ),
                              IconButton(
                                  onPressed: () {
                                    _showChoiceDialog(context);
                                  },
                                  icon: const Icon(Icons.camera_alt))
                            ],
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25),
                          const Text('Bruce Wayne'),
                          const Text(
                            'I"m Batman',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${selectedDate.toLocal()}".split(' ')[0]),
                              const SizedBox(width: 30),
                              TextButton(
                                  onPressed: () => _selectDate(context),
                                  child: const Text('Select date')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 15),
                    margin: const EdgeInsets.fromLTRB(0, 0, 20, 80),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text("DC", style: txtDCStyle),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage("assets/images/background.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: ProfileAvatar(
                              imageUrl: avatar,
                              isActive: false,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'I"m Batman',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                'DC - Batman',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        text,
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: TextField(
                          controller: TextEditingController(),
                          onChanged: (value) {
                            content = value;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.5),
                            ),
                            hintText: 'Type your message...',
                          ),
                        )),
                        const SizedBox(width: 10),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                text = content;
                              });
                              TextEditingController().clear();
                            },
                            child: const Text(
                              'Reply',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
