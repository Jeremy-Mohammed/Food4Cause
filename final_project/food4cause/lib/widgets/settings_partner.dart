import 'package:flutter/material.dart';
import 'package:food4cause/foodPartner.dart';
import 'package:food4cause/main.dart';
import 'package:food4cause/provider/partner_model.dart';
import 'package:food4cause/provider/user_model.dart';
import 'package:provider/provider.dart';

class SettingParter extends StatefulWidget {
  SettingParter({Key? key}) : super(key: key);

  @override
  State<SettingParter> createState() => _SettingState();
}

class _SettingState extends State<SettingParter> {
  final userCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int index = Provider.of<PartnerModel>(context, listen: false).getIndex;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        titleTextStyle:
            TextStyle(color: Colors.black, fontSize: 20, letterSpacing: 2),
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            Provider.of<PartnerModel>(context, listen: false)
                                    .accounts[index]
                                    .user
                                    .username
                                    .isEmpty
                                ? "UserName"
                                : Provider.of<PartnerModel>(context,
                                        listen: false)
                                    .accounts[index]
                                    .user
                                    .username,
                            style: TextStyle(fontSize: 20)),
                        Text(
                          Provider.of<PartnerModel>(context, listen: false)
                              .user
                              .emailAddress,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://static.thenounproject.com/png/576092-200.png',
                      ),
                      backgroundColor: Colors.grey[300],
                      maxRadius: 40,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: Text("Username"),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                width: 300,
                height: 45,
                child: TextField(
                  controller: userCon,
                  onSubmitted: (val) {
                    setState(() {
                      Provider.of<PartnerModel>(context, listen: false)
                          .addUserName(userCon.text);
                    });
                    userCon.clear();
                  },
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: "John Wave",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Container(
                  height: 220,
                  width: 400,
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          ListTile(
                            title: Text(
                              "Notifications",
                              style: TextStyle(fontSize: 16),
                            ),
                            trailing: Icon(Icons.notifications_active),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Container(
                                height: 0,
                                child: Divider(
                                  endIndent: 0,
                                  indent: 10,
                                )),
                          ),
                          ListTile(
                            title: Text(
                              "Sounds",
                              style: TextStyle(fontSize: 16),
                            ),
                            trailing: Icon(Icons.volume_off),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Container(
                                height: 0,
                                child: Divider(
                                  endIndent: 0,
                                  indent: 10,
                                )),
                          ),
                          ListTile(
                            title: Text(
                              "Invite friends",
                              style: TextStyle(fontSize: 16),
                            ),
                            trailing: Icon(Icons.share),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Container(
                                height: 0,
                                child: Divider(
                                  endIndent: 0,
                                  indent: 10,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Center(
                  child: Container(
                    width: 250,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.black),
                        onPressed: () {
                          setState(() {
                            Provider.of<PartnerModel>(context, listen: false)
                                .signOut();
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyHomePage(title: 'Food4Cause')));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Logout"), Icon(Icons.logout)],
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
