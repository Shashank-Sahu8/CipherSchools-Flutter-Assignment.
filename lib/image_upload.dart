import 'dart:io';

import 'package:flutter/material.dart';

class upload_image extends StatefulWidget {
  File imagefile;
  String videopath;
  upload_image({super.key, required this.videopath, required this.imagefile});

  @override
  State<upload_image> createState() => _upload_imageState();
}

class _upload_imageState extends State<upload_image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
