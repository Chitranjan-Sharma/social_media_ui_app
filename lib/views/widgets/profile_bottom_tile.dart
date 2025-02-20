import 'package:flutter/material.dart';

class ProfilePostFollowerBottomTile extends StatelessWidget {
  const ProfilePostFollowerBottomTile(
      {super.key, required this.text, required this.count});
  final String text;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$count",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        )
      ],
    );
  }
}
