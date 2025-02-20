import 'package:flutter/material.dart';

import '../../../utils/color_constants.dart';

class CreatePostTab extends StatefulWidget {
  const CreatePostTab({
    super.key,
  });

  @override
  State<CreatePostTab> createState() => _CreatePostTabState();
}

class _CreatePostTabState extends State<CreatePostTab> {
  final TextEditingController _contentTextController = TextEditingController();
  bool imageSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Create New Post",
            style: TextStyle(
                fontSize: 18,
                color: ColorConstants.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageSelected
                ? Container(
                    padding: EdgeInsets.all(20),
                    height: 250,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/dp3.jpg",
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 80,
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorConstants.lightBlack,
                            ),
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                child: Text(
                                  _contentTextController.text.toString(),
                                  style: TextStyle(
                                      color: ColorConstants.white,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(73, 255, 255, 255),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            height: 20,
                            width: double.infinity,
                            child: Center(
                                child: Text(
                              "Preview",
                              style: TextStyle(
                                  color: ColorConstants.black,
                                  fontWeight: FontWeight.bold),
                            )))
                      ],
                    ),
                  )
                : SizedBox(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: _contentTextController,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "Content...", border: InputBorder.none),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      imageSelected = !imageSelected;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 2, color: ColorConstants.blueDark)),
                    child: Center(
                        child: Text(
                      "SELECT IMAGE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.blueDark),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorConstants.blueDark),
                    child: Center(
                        child: Text(
                      "SHARE POST",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.white),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
