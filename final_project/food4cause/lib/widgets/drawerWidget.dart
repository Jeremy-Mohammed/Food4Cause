import 'package:flutter/material.dart';
import 'package:food4cause/main.dart';
import 'package:food4cause/models/users.dart';
import 'package:food4cause/provider/user_model.dart';
import 'package:food4cause/widgets/community_page.dart';
import 'package:food4cause/widgets/make_donation.dart';
import 'package:food4cause/widgets/map.dart';
import 'package:food4cause/widgets/map2.dart';
import 'package:food4cause/widgets/settings.dart';
import 'package:provider/provider.dart';

class drawerWidget extends StatefulWidget {
  const drawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<drawerWidget> createState() => _drawerWidgetState();
}

class _drawerWidgetState extends State<drawerWidget> {
  bool donTap = false;
  @override
  Widget build(BuildContext context) {
    int index = Provider.of<UserModel>(context, listen: false).getIndex;
    return Drawer(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 260, 0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.cancel,
                  color: Colors.grey[700],
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Container(
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<UserModel>(
                    builder: (context, user, _) {
                      return Text(
                        user.accounts[index].user.username.isEmpty
                            ? "UserName"
                            : user.accounts[index].user.username,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 15),
                      );
                    },
                  ),
                  Text(
                    Provider.of<UserModel>(
                      context,
                      listen: false,
                    ).getUser.emailAddress,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                        letterSpacing: 1.5),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: Icon(
              Icons.home,
              color: Colors.grey[400],
            ),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MyHomePage(title: 'Food4Cause')));
            },
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: Icon(Icons.card_giftcard,
                color: donTap ? Colors.amberAccent[700] : Colors.grey[400]),
            title: Text(
              'Donations',
              style: TextStyle(
                  color: donTap ? Colors.amberAccent[700] : Colors.grey[900]),
            ),
            onTap: () {
              setState(() {
                donTap = true;
              });
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MakeDonation()));
            },
            trailing: Icon(
              donTap ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
              color: donTap ? Colors.amberAccent[700] : Colors.grey[400],
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading:
                Icon(Icons.person_pin_circle_sharp, color: Colors.grey[400]),
            title: Text(
              'Map',
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Map2()));
            },
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: Icon(Icons.favorite, color: Colors.grey[400]),
            title: Text('Communities'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CommunityPage()));
            },
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Padding(
            padding: EdgeInsets.only(top: 120),
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Icon(Icons.settings, color: Colors.grey[400]),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Setting()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
