import 'package:flutter/material.dart';
import 'package:food4cause/models/communities.dart';

class CommunityModel extends ChangeNotifier {
  List<Communities> commList = [
    Communities("Christian Life Centre", "1030 Ravenscroft Road, Ajax"),
    Communities("1 Hope International Foundation", "13 Atkinson Court, Ajax"),
    Communities("Salvation Army", "55 Emperor Street, Ajax"),
    Communities("Abundant Life Gospel Centre", "17 Erie Street, Oshawa"),
  ];
  List<Communities> commList2 = [
    Communities("Jeremy Community", "1030 Ravenscroft Road, Ajax"),
    Communities("Brandon Community", "13 Atkinson Court, Ajax"),
    Communities("Fahad Community", "55 Emperor Street, Ajax"),
    Communities("Wabz Community", "17 Erie Street, Oshawa"),
  ];

  void addComm(Communities comm) {
    commList.add(comm);
    notifyListeners();
  }
}
