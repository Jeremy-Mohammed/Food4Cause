import 'package:flutter/material.dart';
import 'package:food4cause/provider/user_model.dart';
import 'package:food4cause/provider/volunteerProvider.dart';
import 'package:food4cause/widgets/drawerVolunteer.dart';
import 'package:food4cause/widgets/make_request.dart';
import 'package:food4cause/widgets/options.dart';
import 'package:food4cause/widgets/signIn.dart';
import 'package:food4cause/widgets/volunteer_tab.dart';
import 'package:provider/provider.dart';

class Volunteer extends StatelessWidget {
  final int index;
  const Volunteer({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Provider.of<VolunteerProvider>(context, listen: false).user.signIn) {
      return Scaffold(
        backgroundColor: option[index]['color'],
        appBar: AppBar(
          backgroundColor: option[index]['color'],
          elevation: 0,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(child: option2[index]['icon']),
                Text(
                  option[index]['name'],
                  style: TextStyle(fontSize: 40),
                ),
              ],
            )),
          ),
        ),
        drawer: drawerVolunteer(),
      );
    }
    return SignIn(index: index);
  }
}
