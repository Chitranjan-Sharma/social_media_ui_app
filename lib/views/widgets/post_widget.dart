import 'package:flutter/material.dart';
import 'package:social_media_ui_app/utils/color_constants.dart';
import 'package:social_media_ui_app/utils/dummy_data.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool likePost = false;
  bool savePost = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstants.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/dp2.jpg"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            "User name",
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "Time",
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          savePost = !savePost;
                        });
                      },
                      icon: Icon(
                        Icons.bookmark,
                        color: savePost ? ColorConstants.blueDark : Colors.grey,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Flexible(
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/dp3.jpg",
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorConstants.lightBlack,
                      ),
                      child: Text(
                        dummyText,
                        maxLines: 3,
                        style: TextStyle(
                            color: ColorConstants.white,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        fit: StackFit.expand,
                        children: List.generate(5, (i) {
                          return Positioned(
                              left: i * 15,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      sheetAnimationStyle: AnimationStyle(
                                          curve: Curves.bounceIn,
                                          duration:
                                              Duration(milliseconds: 300)),
                                      backgroundColor: ColorConstants.white,
                                      context: context,
                                      showDragHandle: true,
                                      builder: (builder) {
                                        return SingleChildScrollView(
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Post liked by",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Column(
                                                children: List.generate(
                                                    10,
                                                    (i) => ListTile(
                                                          onTap: () {},
                                                          trailing: TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                "FOLLOW",
                                                                style: TextStyle(
                                                                    color: ColorConstants
                                                                        .blueDark,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )),
                                                          title: Text(
                                                            "User name",
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          subtitle: Text(
                                                              "Time liked"),
                                                          leading: CircleAvatar(
                                                            backgroundImage:
                                                                AssetImage(
                                                                    "assets/dp1.jpg"),
                                                          ),
                                                        )),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(style: BorderStyle.none),
                                      borderRadius: BorderRadius.circular(50)),
                                  elevation: 10,
                                  child: i < 4
                                      ? CircleAvatar(
                                          radius: 20,
                                          backgroundImage: AssetImage(
                                              "assets/dp${i + 1}.jpg"),
                                        )
                                      : CircleAvatar(
                                          backgroundColor: ColorConstants.white,
                                          radius: 20,
                                          child: Text(
                                            "10+",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: ColorConstants.black),
                                          ),
                                        ),
                                ),
                              ));
                        })),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              likePost = !likePost;
                            });
                          },
                          icon: Icon(
                            Icons.thumb_up,
                            color: likePost
                                ? ColorConstants.blueDark
                                : Colors.grey,
                          )),
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                sheetAnimationStyle: AnimationStyle(
                                    curve: Curves.bounceIn,
                                    duration: Duration(milliseconds: 300)),
                                backgroundColor: ColorConstants.white,
                                context: context,
                                builder: (builder) {
                                  return StatefulBuilder(
                                    builder: (BuildContext context,
                                        void Function(void Function())
                                            setState) {
                                      TextEditingController commentController =
                                          TextEditingController();
                                      return SafeArea(
                                        child: Container(
                                            padding: EdgeInsets.all(20),
                                            width: double.infinity,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 3),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Row(
                                                children: [
                                                  Flexible(
                                                    child: TextField(
                                                      controller:
                                                          commentController,
                                                      maxLines: 1,
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              "Type comment...",
                                                          border:
                                                              InputBorder.none),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        if (commentController
                                                            .text
                                                            .trim()
                                                            .isNotEmpty) {
                                                          print(
                                                              commentController
                                                                  .text);
                                                          commentController
                                                              .clear();
                                                        }
                                                      },
                                                      icon: Icon(
                                                        Icons.send,
                                                        color: ColorConstants
                                                            .blueDark,
                                                      ))
                                                ],
                                              ),
                                            )),
                                      );
                                    },
                                  );
                                });
                          },
                          icon: Icon(
                            Icons.comment,
                            color: Colors.grey,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            color: ColorConstants.blueDark,
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
