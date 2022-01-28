import 'package:email_validator/email_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food4cause/charityPartner.dart';
import 'package:food4cause/communitypartner.dart';
import 'package:food4cause/foodPartner.dart';
import 'package:food4cause/models/users.dart';
import 'package:food4cause/provider/charityProvider.dart';
import 'package:food4cause/provider/communitie_model.dart';
import 'package:food4cause/provider/partner_model.dart';
import 'package:food4cause/provider/user_model.dart';
import 'package:food4cause/provider/volunteerProvider.dart';
import 'package:food4cause/volunteer.dart';
import 'package:food4cause/widgets/options.dart';
import 'package:food4cause/widgets/signUp.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  final int index;
  const SignIn({Key? key, required this.index}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool tapped = false;
  //Controllers
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  bool isEmail(String em) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(em);
  }

  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            child: option[widget.index]['icon'],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(option[widget.index]['name'],
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                    letterSpacing: 1.5)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 200, 0),
            child: Text("Sign In",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 25)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 90, 0),
            child: Text("Hi there! Nice to see you again.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 250, 0),
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
                  FocusScope.of(context).unfocus();
                });
              },
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                errorText: isValid ? null : "Enter Valid Email Address",
                hintText: 'example@gmail.com',
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
              controller: passCon,
              obscureText: tapped ? false : true,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      tapped = !tapped;
                      print("tapped");
                    });
                  },
                  child: Icon(
                    tapped
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye,
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: 45,
              width: 290,
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ElevatedButton(
                  onPressed: () {
                    if (emailCon.text.isEmpty || !isEmail(emailCon.text)) {
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
                          Provider.of<UserModel>(context, listen: false).signIn(
                              User(emailCon.text, passCon.text, "", true));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FoodPartner(index: widget.index)));
                          break;
                        case 2:
                          Provider.of<PartnerModel>(context, listen: false)
                              .signIn(
                                  User(emailCon.text, passCon.text, "", true));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CommunityPartner(index: widget.index)));
                          break;
                        case 3:
                          Provider.of<VolunteerProvider>(context, listen: false)
                              .signIn(
                                  User(emailCon.text, passCon.text, "", true));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Volunteer(index: widget.index)));
                          break;
                        case 4:
                          Provider.of<CharityProvider>(context, listen: false)
                              .signIn(
                                  User(emailCon.text, passCon.text, "", true));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CharityPartner(index: widget.index)));
                          break;

                        default:
                      }
                    }
                  },
                  child: Text("Sign In"),
                  style: ElevatedButton.styleFrom(
                      primary: option[widget.index]['color'], elevation: 2))),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
            child: Text("or use one of your social profiles",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                    fontSize: 10)),
          ),
          googleFacebook(),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Text("Forget Password ?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                          fontSize: 12)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignUp(index: widget.index)));
                    },
                    child: Text("Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: option[widget.index]['color'],
                            fontSize: 12)),
                  ),
                ),
              ],
            ),
          )
        ],
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
