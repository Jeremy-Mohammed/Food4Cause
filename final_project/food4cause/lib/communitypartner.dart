// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food4cause/provider/partner_model.dart';
import 'package:food4cause/widgets/community_page.dart';
import 'package:food4cause/widgets/drawerComPart.dart';
import 'package:food4cause/widgets/drawerWidget.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:food4cause/widgets/options.dart';
import 'package:food4cause/widgets/signIn.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityPartner extends StatelessWidget {
  final int index;
  CommunityPartner({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Provider.of<PartnerModel>(context, listen: false).user.signIn) {
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
        drawer: drawerComPart(),
      );
    }
    return SignIn(index: index);
  }
}
