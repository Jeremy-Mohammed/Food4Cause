import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food4cause/provider/charityProvider.dart';
import 'package:food4cause/provider/communitie_model.dart';
import 'package:food4cause/provider/donationModel.dart';
import 'package:food4cause/provider/partner_model.dart';
import 'package:food4cause/provider/user_model.dart';
import 'package:food4cause/provider/volunteerProvider.dart';
import 'package:food4cause/widgets/elevButton.dart';
import 'package:food4cause/widgets/options.dart';
import 'about.dart';
import 'foodPartner.dart';
import 'charityPartner.dart';
import 'communityPartner.dart';
import 'donate.dart';
import 'volunteer.dart';
import 'package:provider/provider.dart';

//Log out button where settings is
//FoodPartner needs donations
//Community Partner instead of donation page put request
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<DonationModel>(create: (_) => DonationModel()),
      ChangeNotifierProvider<UserModel>(create: (_) => UserModel()),
      ChangeNotifierProvider<CommunityModel>(create: (_) => CommunityModel()),
      ChangeNotifierProvider<PartnerModel>(create: (_) => PartnerModel()),
      ChangeNotifierProvider<VolunteerProvider>(
          create: (_) => VolunteerProvider()),
      ChangeNotifierProvider<CharityProvider>(create: (_) => CharityProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food4Cause',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Food4Cause'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 700,
      width: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //The buttons with gaps in between
          const Icon(Icons.local_restaurant, size: 60),
          const SizedBox(height: 20),

          Text("Food4Cause",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey[700])),
          const SizedBox(height: 20),
          Container(
            height: 550,
            width: 360,
            child: GridView.builder(
                primary: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 0,
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                ),
                itemCount: option.length,
                itemBuilder: (BuildContext context, int index) {
                  return elevButton(
                      text: option[index]['name'],
                      color: option[index]['color'],
                      pageName: option[index]['page'],
                      context: context,
                      index: index);
                }),
          )
        ],
      ),
    ));
  }
}
