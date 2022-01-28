import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  final fieldText = TextEditingController();

  void clearText() {}

  final int index;
  AboutUs({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: [
              Image(
                  image: NetworkImage(
                      "https://blog.vancity.com/wp-content/uploads/2016/12/GiveHands-iStock-Blog-1280x620-1280x620.jpg")),
              Positioned(
                  bottom: -100,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6dOJL4Aj41WXbR4ua-o2oGLHS5DcxnG7n8w&usqp=CAU"),
                  )),
            ],
          ),
          SizedBox(
            height: 90,
          ),
          ListTile(
            title: Text(
              "About Us",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                  "Food4Cause is an international charitable Organization dedicated to helping anyone living with food insecurity."
                  " We Support a large network of government associations, affiliate food banks, food agencies, and farmers that work at the community"
                  " level to relieve hunger. Our work is focused on finding wherever there is an excess amount of food and provide that with other resources"
                  " to those in need. We aim to stop food waste and food hunger.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 5.0),
            child: Text(
              "━━━━ Mission Statement ━━━━",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
                "Food4Cause PROVIDES INTERNATIONAL COMMUNICATION TO RELIEVE HUNGER TODAY AND PREVENT HUNGER FOR TOMORROW IN COLLABRATION WITH"
                " OTHER CHARITIES",
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.italic)),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 5.0),
            child: Text(
              "━━━━ Vision Statment ━━━━",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
                "WE ARE AN INNOVATIVE PARTNER CREATED TO PROVIDE NECESSITY WHEREVER THERE IS HARDSHIP",
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.italic)),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 5.0),
            child: Text(
              "━━━━ Core Statment ━━━━",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Service:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(" We reach out to support others.",
                        style: TextStyle(fontStyle: FontStyle.italic)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dignity:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Flexible(
                      child: Text(
                          " We respect, value, and recognize everyone's worth",
                          style: TextStyle(fontStyle: FontStyle.italic)),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Stewardship:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Flexible(
                      child: Text(
                          " We responsibly manage the resources entrusted to us",
                          style: TextStyle(fontStyle: FontStyle.italic)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            color: Colors.grey[200],
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("Give Us Feedback",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Type Here', focusColor: Colors.green),
                    controller: fieldText,
                  ),
                  //Hola
                  ElevatedButton(
                      onPressed: () {
                        fieldText.clear();
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Feedback Submitted"),
                              );
                            });
                      },
                      child: Icon(Icons.send))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// "Dignity: We respect, value, and recognizing everyon's worth\n\n"
//             "Stewardship: We responsibly manage the resources entrusted to us", 