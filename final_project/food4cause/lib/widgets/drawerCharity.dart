import 'package:flutter/material.dart';
import 'package:food4cause/main.dart';
import 'package:food4cause/models/users.dart';
import 'package:food4cause/provider/charityProvider.dart';
import 'package:food4cause/provider/user_model.dart';
import 'package:food4cause/widgets/cheque_tab.dart';
import 'package:food4cause/widgets/community_page.dart';
import 'package:food4cause/widgets/make_charity.dart';
import 'package:food4cause/widgets/make_donation.dart';
import 'package:food4cause/widgets/map.dart';
import 'package:food4cause/widgets/projects_tab.dart';
import 'package:food4cause/widgets/settings.dart';
import 'package:food4cause/widgets/settings_chartiy.dart';
import 'package:provider/provider.dart';

class drawerCharty extends StatefulWidget {
  const drawerCharty({
    Key? key,
  }) : super(key: key);

  @override
  State<drawerCharty> createState() => _drawerWidgetState();
}

class _drawerWidgetState extends State<drawerCharty> {
  bool donTap = false;
  @override
  Widget build(BuildContext context) {
    int index = Provider.of<CharityProvider>(context, listen: false).getIndex;
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
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<CharityProvider>(
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
                    Provider.of<CharityProvider>(
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
                color: donTap ? Colors.blue[300] : Colors.grey[400]),
            title: Text(
              'Donations',
              style: TextStyle(
                  color: donTap ? Colors.blue[300] : Colors.grey[900]),
            ),
            onTap: () {
              setState(() {
                donTap = !donTap;
              });
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MakeCharity()));
            },
            trailing: Icon(
              donTap ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
              color: donTap ? Colors.blue[300] : Colors.grey[400],
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
                  context, MaterialPageRoute(builder: (context) => Map1()));
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
          ListTile(
            horizontalTitleGap: 0,
            leading: Icon(Icons.hdr_weak_rounded, color: Colors.grey[400]),
            title: Text('Projects'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProjectsTab()));
            },
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading:
                Icon(Icons.monetization_on_outlined, color: Colors.grey[400]),
            title: Text('Cheque'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChequeTab()));
            },
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Icon(Icons.settings, color: Colors.grey[400]),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingCharity()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
