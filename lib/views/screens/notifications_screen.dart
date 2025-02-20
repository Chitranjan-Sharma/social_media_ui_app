import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:social_media_ui_app/utils/dummy_data.dart';

import '../../utils/color_constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              color: Colors.white,
              icon: Icon(Icons.more_vert),
              itemBuilder: (itemBuilder) => List.generate(
                  5,
                  (i) => PopupMenuItem(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Item ${i + 1}"),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(Icons.settings)
                        ],
                      ))))
        ],
        centerTitle: false,
        title: Text(
          "Notifications",
          style: TextStyle(
              fontSize: 18,
              color: ColorConstants.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (_, i) {
            return Slidable(
              startActionPane:
                  ActionPane(motion: SizedBox(), children: [SizedBox()]),
              endActionPane:
                  ActionPane(motion: SizedBox(), children: [SizedBox()]),
              child: ListTile(
                onTap: () {},
                leading: Icon(Icons.notifications_active),
                title: Text(
                  "@username",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Text(
                  dummyText,
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            );
          }),
    );
  }
}
