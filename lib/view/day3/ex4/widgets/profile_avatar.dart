import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final bool isActive;
  final String? newImageUrl;
  final bool hasBorder;

  const ProfileAvatar({
    Key? key,
    this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,
    this.newImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        newImageUrl != null
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipOval(
                  child: Image.file(
                    File(newImageUrl!),
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.green,
                child: CircleAvatar(
                  radius: hasBorder ? 17.0 : 40.0,
                  backgroundColor: Colors.grey[200],
                  backgroundImage:
                      CachedNetworkImageProvider(imageUrl as String),
                ),
              ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
