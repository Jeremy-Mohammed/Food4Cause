// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food4cause/provider/charityProvider.dart';
import 'package:food4cause/widgets/drawerCharity.dart';
import 'package:food4cause/widgets/options.dart';
import 'package:food4cause/widgets/signIn.dart';
import 'package:provider/provider.dart';

class CharityPartner extends StatelessWidget {
  final int index;
  const CharityPartner({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Provider.of<CharityProvider>(context, listen: false).user.signIn) {
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
        drawer: drawerCharty(),
      );
    }
    return SignIn(index: index);
  }
}
