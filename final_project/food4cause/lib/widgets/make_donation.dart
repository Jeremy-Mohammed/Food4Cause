import 'package:flutter/material.dart';
import 'package:food4cause/widgets/donation_card.dart';
import 'package:food4cause/widgets/previous_donations.dart';

class MakeDonation extends StatelessWidget {
  const MakeDonation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        bottomOpacity: 0,
        elevation: 0,
        foregroundColor: Colors.orangeAccent[700],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
                child: Text(
              "Donations",
              style: TextStyle(fontSize: 20),
            )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(280, 0, 0, 0),
            child: Container(
              child: Text("Make a Donation"),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Container(
                  height: 2,
                  width: 255,
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  height: 2,
                  width: 110,
                  color: Colors.black,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: DonationCard(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(260, 15, 0, 0),
            child: Container(
              child: Text("Previous Donations"),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Container(
                  height: 2,
                  width: 240,
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  height: 2,
                  width: 123,
                  color: Colors.black,
                ),
              )
            ],
          ),
          PrevDonations(),
        ],
      ),
    );
  }
}
