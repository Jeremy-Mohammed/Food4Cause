// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food4cause/provider/user_model.dart';
import 'package:food4cause/widgets/drawerWidget.dart';
import 'package:food4cause/widgets/make_donation.dart';
import 'package:food4cause/widgets/options.dart';
import 'package:food4cause/widgets/signIn.dart';
import 'package:provider/provider.dart';

class FoodPartner extends StatelessWidget {
  final int index;

  FoodPartner({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Provider.of<UserModel>(context, listen: false).user.signIn) {
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
        drawer: drawerWidget(),
      );
    }
    return SignIn(index: index);
  }
}
