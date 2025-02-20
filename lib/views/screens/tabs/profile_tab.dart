import 'package:flutter/material.dart';
import 'package:social_media_ui_app/views/widgets/profile_bottom_tile.dart';

import '../../../utils/color_constants.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final List<String> buttonsText = [
    "Photos",
    "Posts",
    "Stories",
    "Friends",
    "Mentions",
  ];
  int sIndex = 0;
  int columsCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25)),
                    child: Image.asset(
                      "assets/dp1.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 250,
                    )),
                SafeArea(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                        ))
                  ],
                )),
                Positioned(
                  bottom: 0,
                  left: 20,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              "assets/dp2.jpg",
                            ),
                          ),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.camera,
                                  color: ColorConstants.blueDark,
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "User name",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text("@username")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfilePostFollowerBottomTile(text: "Photos", count: 150),
                Container(
                  height: 30,
                  color: Colors.grey,
                  width: 1,
                ),
                ProfilePostFollowerBottomTile(text: "Followers", count: 500),
                Container(
                  height: 30,
                  color: Colors.grey,
                  width: 1,
                ),
                ProfilePostFollowerBottomTile(text: "Following", count: 450),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: buttonsText.length,
                    itemBuilder: (context, index) {
                      return sIndex == index
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  sIndex = index;
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: const Color.fromARGB(
                                          132, 120, 215, 255)),
                                  child: Center(
                                      child: Text(
                                    buttonsText[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ))),
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  sIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Center(
                                    child: Text(
                                  buttonsText[index],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              ),
                            );
                    },
                  ),
                ),
                PopupMenuButton(
                    onSelected: (value) {
                      setState(() {
                        columsCount = value;
                      });
                    },
                    menuPadding: EdgeInsets.symmetric(horizontal: 20),
                    icon: Icon(Icons.window),
                    itemBuilder: (_) {
                      return List.generate(
                          4,
                          (i) => PopupMenuItem(
                              value: i + 1,
                              child: Text("Colums     ${i + 1}")));
                    })
              ],
            ),
          ),
          Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: 13,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1,
                      crossAxisCount: columsCount),
                  itemBuilder: (_, i) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        sIndex < 4
                            ? "assets/dp${sIndex + 1}.jpg"
                            : "assets/dp1.jpg",
                        fit: BoxFit.cover,
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
