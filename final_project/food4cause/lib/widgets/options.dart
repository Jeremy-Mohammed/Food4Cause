import 'package:flutter/material.dart';
import 'package:food4cause/about.dart';
import 'package:food4cause/charityPartner.dart';
import 'package:food4cause/communitypartner.dart';
import 'package:food4cause/donate.dart';
import 'package:food4cause/foodPartner.dart';
import 'package:food4cause/provider/communitie_model.dart';
import 'package:food4cause/provider/user_model.dart';
import 'package:food4cause/volunteer.dart';

List<Map> option = [
  {
    "name": "Donate",
    "color": Colors.red[400],
    "page": Donate(index: 0),
    "icon": Icon(
      Icons.attach_money,
      size: 50,
    ),
  },
  {
    "name": "Food Partner",
    "color": Colors.orangeAccent[700],
    "page": FoodPartner(index: 1),
    "icon": Icon(
      Icons.food_bank_outlined,
      size: 50,
    ),
  },
  {
    "name": "Community Partner",
    "color": Colors.yellow[700],
    "page": CommunityPartner(index: 2),
    "icon": Icon(
      Icons.people_alt,
      size: 50,
    ),
  },
  {
    "name": "Volunteer",
    "color": Colors.green[300],
    "page": Volunteer(index: 3),
    "icon": Icon(
      Icons.emoji_people,
      size: 50,
    ),
  },
  {
    "name": "Charity Partner",
    "color": Colors.blue[300],
    "page": CharityPartner(index: 4),
    "icon": Icon(
      Icons.nature_people_rounded,
      size: 50,
    ),
  },
  {
    "name": "About Us",
    "color": Colors.blue[900],
    "page": AboutUs(index: 5),
    "icon": Icon(
      Icons.accessibility_new_outlined,
      size: 50,
    ),
  },
];
List<Map> option2 = [
  {
    "name": "Donate",
    "color": Colors.red[400],
    "page": Donate(index: 0),
    "icon": Icon(
      Icons.attach_money,
      size: 100,
    ),
  },
  {
    "name": "Food Partner",
    "color": Colors.orangeAccent[700],
    "page": FoodPartner(index: 1),
    "icon": Icon(
      Icons.food_bank_outlined,
      size: 50,
    ),
  },
  {
    "name": "Community Partner",
    "color": Colors.yellow[700],
    "page": CommunityPartner(index: 2),
    "icon": Icon(
      Icons.people_alt,
      size: 200,
    ),
  },
  {
    "name": "Volunteer",
    "color": Colors.green[300],
    "page": Volunteer(index: 3),
    "icon": Icon(
      Icons.emoji_people,
      size: 50,
    ),
  },
  {
    "name": "Charity Partner",
    "color": Colors.blue[300],
    "page": CharityPartner(index: 4),
    "icon": Icon(
      Icons.nature_people_rounded,
      size: 50,
    ),
  },
  {
    "name": "About Us",
    "color": Colors.blue[900],
    "page": AboutUs(index: 5),
    "icon": Icon(
      Icons.accessibility_new_outlined,
      size: 50,
    ),
  },
];
