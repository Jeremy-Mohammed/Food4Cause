import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food4cause/provider/donationModel.dart';
import 'package:food4cause/widgets/credit_card.dart';
import 'package:provider/provider.dart';

class Donate extends StatefulWidget {
  final int index;
  Donate({Key? key, required this.index}) : super(key: key);

  int total = 0;
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  final DonationModel donations = DonationModel();
  final otherController = TextEditingController();
  var val1 = "";

  var _focusNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 60, 0, 20),
                    child: Text(
                      "Donate",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1),
                    ),
                  ),
                  clickableDon(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Container(
                      height: 50,
                      width: 325,
                      child: Row(
                        children: [
                          Container(
                            height: 45,
                            width: 80,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.redAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            child: Center(
                              child: Text(
                                'Other:',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.red[300],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6))),
                              width: 235,
                              height: 45,
                              child: TextField(
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                controller: otherController,
                                onSubmitted: (val) {
                                  if (otherController.text.isNotEmpty) {
                                    Provider.of<DonationModel>(context,
                                            listen: false)
                                        .addToDonations(
                                            int.parse(otherController.text));
                                  } else {
                                    Provider.of<DonationModel>(context,
                                            listen: false)
                                        .setDonation();
                                  }
                                },
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  hintText: "\$",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CreditCard(),
                ],
              ),
            ),
          ),
        ));
  }

  Container clickableDon() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      width: 390,
      child: Row(
        children: [
          topDon(
            amount: 25,
            donations: donations,
          ),
          topDon(
            amount: 50,
            donations: donations,
          ),
          topDon(
            amount: 75,
            donations: donations,
          ),
          topDon(
            amount: 100,
            donations: donations,
          ),
        ],
      ),
    );
  }
}

class topDon extends StatefulWidget {
  final int amount;
  final DonationModel donations;
  topDon({
    Key? key,
    required this.amount,
    required this.donations,
  }) : super(key: key);

  @override
  _topDonState createState() => _topDonState();
}

class _topDonState extends State<topDon> {
  bool tapped = false;

  void changeTap() {
    setState(() {
      tapped = !tapped;
      if (tapped == false) {
        if (widget.donations.getDonations >= 0) {
          Provider.of<DonationModel>(context, listen: false)
              .removeDonation(widget.amount);
        }
      } else {
        Provider.of<DonationModel>(context, listen: false)
            .addToDonations(widget.amount);
      }
    });
    print("Total:" + widget.donations.getDonations.toString());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeTap,
      child: Padding(
        padding: EdgeInsets.only(right: 2),
        child: Container(
          height: 45,
          width: 80,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: tapped ? Colors.black : Colors.redAccent,
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Center(
            child: Text(
              '\$${widget.amount}',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
