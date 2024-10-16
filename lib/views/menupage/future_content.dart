import 'package:flutter/material.dart';

class FutureContent extends StatelessWidget {
  const FutureContent({
    super.key, required this.content,
  });
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      key: UniqueKey(),
      future: Future.delayed(const Duration(milliseconds: 201),() => 1), 
      builder: (context, snapshot) => snapshot.hasData ? content : Container() ,
      );
  }
}
