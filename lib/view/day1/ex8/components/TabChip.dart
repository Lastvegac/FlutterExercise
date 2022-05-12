import 'package:flutter/material.dart';

class TabChip extends StatefulWidget {
  final String chipTitle;

  TabChip(this.chipTitle) : assert(chipTitle != null);

  @override
  State<StatefulWidget> createState() {
    return _TabChipState();
  }
}

class _TabChipState extends State<TabChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      avatar: const CircleAvatar(),
      label: Text(
        widget.chipTitle,
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.red,
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: isSelected
          ? Colors.red
          : Colors.white, // Switch colors if chip is selected
      shape:
          const StadiumBorder(side: BorderSide(color: Colors.red, width: 2.0)),
      selectedColor: Colors.red,
      selected: isSelected,
      onPressed: () {
        setState(() {
          isSelected = isSelected ? false : true;
        });
      },
//      onSelected: (bool value){
//        setState(() {
//          isSelected = true;
//        });
//      },
    );
  }
}
