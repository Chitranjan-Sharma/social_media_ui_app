import 'package:flutter/material.dart';

import '../../../utils/color_constants.dart';

class ChatsTab extends StatefulWidget {
  const ChatsTab({super.key});

  @override
  State<ChatsTab> createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab> {
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
          "Messages",
          style: TextStyle(
              fontSize: 18,
              color: ColorConstants.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (_, i) {
            return ListTile(
              onTap: () {},
              leading: CircleAvatar(
                radius: 22.5,
                backgroundImage: AssetImage("assets/dp4.jpg"),
              ),
              title: Text(
                "Username",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                "Last message...",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              trailing: Text("Time"),
            );
          }),
    );
  }
}
