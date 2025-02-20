import 'package:flutter/material.dart';
import 'package:social_media_ui_app/utils/color_constants.dart';

class UserStatusWidget extends StatelessWidget {
  const UserStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: ColorConstants.blueDark),
                borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/dp1.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
              child: Text(
            "User name",
            maxLines: 1,
            style: TextStyle(
              
                fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
          ))
        ],
      ),
    );
  }
}
