import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food4cause/charityPartner.dart';
import 'package:food4cause/communitypartner.dart';
import 'package:food4cause/foodPartner.dart';
import 'package:food4cause/models/users.dart';
import 'package:food4cause/provider/charityProvider.dart';
import 'package:food4cause/provider/partner_model.dart';
import 'package:food4cause/provider/user_model.dart';
import 'package:food4cause/provider/volunteerProvider.dart';
import 'package:food4cause/volunteer.dart';
import 'package:food4cause/widgets/options.dart';
import 'package:food4cause/widgets/signIn.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  final int index;
  const SignUp({Key? key, required this.index}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool tapped = false;
  //Controllers
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();

  //Provider
  final UserModel donations = UserModel();
  bool isEmail(String em) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(em);
  }

  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 200, 0),
              child: Text("Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                      fontSize: 25)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 250, 0),
              child: Text("Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: option[widget.index]['color'],
                    fontSize: 13,
                  )),
            ),
            Container(
              width: 284,
              child: TextFormField(
                controller: emailCon,
                onEditingComplete: () {
                  setState(() {
                    isValid = EmailValidator.validate(emailCon.text);
                  });
                },
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  errorText: isValid ? null : "Enter Valid Email Address",
                  hintText: 'Your email address',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 225, 0),
              child: Text("Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: option[widget.index]['color'],
                    fontSize: 13,
                  )),
            ),
            Container(
              height: 60,
              width: 284,
              child: TextFormField(
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                decoration: InputDecoration(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text("or use one of your social profiles",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                      fontSize: 10)),
            ),
            googleFacebook(),
            Container(
              height: 40,
              padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          tapped = !tapped;
                        });
                      },
                      icon: tapped
                          ? Icon(Icons.check_box_rounded)
                          : Icon(Icons.check_box_outline_blank),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                    child: Text("I agree to the",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 12)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                    child: Text(" Terms of Servies",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: option[widget.index]['color'])),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                    child: Text(" and",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 12)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 120, 5),
              child: Text(" Privacy Policy",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: option[widget.index]['color'])),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                  height: 50,
                  width: 290,
                  padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        //If tapped is == to true
                        if (tapped == true) {
                          if (emailCon.text.isEmpty ||
                              !isEmail(emailCon.text)) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Fill in Fields/Invalid Input"),
                                  );
                                });
                          } else {
                            switch (widget.index) {
                              case 1:
                                Provider.of<UserModel>(context, listen: false)
                                    .addToUser(User(
                                        emailCon.text, passCon.text, "", true));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FoodPartner(index: widget.index)));
                                break;
                              case 2:
                                Provider.of<PartnerModel>(context,
                                        listen: false)
                                    .addToUser(User(
                                        emailCon.text, passCon.text, "", true));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CommunityPartner(
                                            index: widget.index)));
                                break;
                              case 3:
                                Provider.of<VolunteerProvider>(context,
                                        listen: false)
                                    .addToUser(User(
                                        emailCon.text, passCon.text, "", true));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Volunteer(index: widget.index)));
                                break;
                              case 4:
                                Provider.of<CharityProvider>(context,
                                        listen: false)
                                    .addToUser(User(
                                        emailCon.text, passCon.text, "", true));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CharityPartner(
                                            index: widget.index)));
                                break;

                              default:
                            }
                          }
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Check the box"),
                                  content:
                                      Text("Agree to the terms and services"),
                                );
                              });
                        }
                      },
                      child: Text("Continue"),
                      style: ElevatedButton.styleFrom(
                          primary: option[widget.index]['color'],
                          elevation: 2))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Text("Have an Account ?",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 12)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignIn(index: widget.index)));
                    },
                    child: Text("Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: option[widget.index]['color'],
                            fontSize: 12)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row googleFacebook() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 45,
            width: 105,
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      height: 40,
                      width: 30,
                      child: Image.network(
                        "https://i1.wp.com/www.androidawareness.com/wp-content/uploads/2018/10/google-icon.png?fit=500%2C500",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text('Google', style: TextStyle(fontSize: 13)),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey[350], elevation: 2))),
        SizedBox(
          width: 10,
        ),
        Container(
            height: 45,
            width: 108,
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      height: 20,
                      width: 20,
                      child: Image.network(
                        "https://files.softicons.com/download/social-media-icons/simple-icons-by-dan-leech/png/256x256/facebook.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text('Facebook', style: TextStyle(fontSize: 12)),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(66, 103, 178, 20), elevation: 2))),
      ],
    );
  }
}
