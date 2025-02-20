import 'package:flutter/material.dart';
import 'package:social_media_ui_app/views/screens/notifications_screen.dart';

import '../../../utils/color_constants.dart';
import '../../widgets/post_widget.dart';
import '../../widgets/user_status_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.camera)),
            Flexible(
              child: Center(
                child: Text(
                  "Explore",
                  style: TextStyle(
                      fontSize: 18,
                      color: ColorConstants.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => NotificationsScreen()));
                },
                icon: Icon(Icons.notifications)),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  width: 80,
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(right: 10),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(5, (i) => UserStatusWidget()),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: List.generate(5, (pIndex) => PostWidget()),
            ),
          )
        ],
      ),
    );
  }
}
