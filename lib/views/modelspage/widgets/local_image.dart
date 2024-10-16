
import 'package:flutter/material.dart';

class LocalImage extends StatefulWidget {
  const LocalImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  LocalImageState createState() => LocalImageState();
}

class LocalImageState extends State<LocalImage> {
  int currentUrlIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, bottom: 10, left: 30, right: 30),
      child: Image.asset(
          widget.url,
        alignment: Alignment.center,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}