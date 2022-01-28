import 'package:flutter/material.dart';
import 'package:food4cause/provider/donationModel.dart';
import 'package:food4cause/provider/user_model.dart';
import 'package:food4cause/widgets/barChartSample.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';

class CreditCard extends StatefulWidget {
  CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  final nameController = TextEditingController();
  final cardNumCon = TextEditingController();
  final expiryCon = TextEditingController();
  final secCon = TextEditingController();
  final zipCon = TextEditingController();
  DateTime? dataTime;
  String newData = "";

  bool hasNumName = false;
  bool cardNumAllNum = true;
  Widget build(BuildContext context) {
    void checkIfNumber(TextEditingController nameController) {
      if (!nameController.text.contains(RegExp(r'[a-zA-Z]+'))) {
        print("hasNUMBERS");
        setState(() {
          hasNumName = true;
        });
      } else {
        setState(() {
          hasNumName = false;
        });
      }
    }

    void checkEmpty() {
      bool isEmpty = false;

      List<TextEditingController> controllers = [
        nameController,
        cardNumCon,
        secCon,
        zipCon
      ];
      for (int i = 0; i < controllers.length; i++) {
        if (controllers[i].text.isEmpty) {
          isEmpty = true;
        }
      }
      if (isEmpty) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Fill In all Fields"),
                content: Text("Thank you"),
              );
            });
      } else if (Provider.of<DonationModel>(context, listen: false).donations ==
          0) {
        final scaffold = ScaffoldMessenger.of(context);
        scaffold.showSnackBar(SnackBar(
          content: Text(
            " Cant Donate 0",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.teal[300],
        ));
      } else {
        final scaffold = ScaffoldMessenger.of(context);
        scaffold.showSnackBar(SnackBar(
          content: Text(
            "Payment Succesful",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.teal[300],
        ));

        Provider.of<DonationModel>(context, listen: false).setDonation();
      }
    }

    void dispose() {
      nameController.dispose();
      cardNumCon.dispose();
      super.dispose();
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 5),
            child: Text("Name on card "),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              width: 300,
              height: 45,
              child: TextField(
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                controller: nameController,
                onSubmitted: (val) {
                  checkIfNumber(nameController);
                },
                decoration: InputDecoration(
                  errorStyle: TextStyle(
                    fontSize: 10,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                  errorText: hasNumName ? "Letters only " : null,
                  hintText: "John Wave",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
            child: Text("Card Number "),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              width: 300,
              height: 45,
              child: TextField(
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                controller: cardNumCon,
                onSubmitted: (_) {
                  if (cardNumCon.text.contains(RegExp(r'[a-zA-Z]+'))) {
                    print("hasLetters");
                    setState(() {
                      cardNumAllNum = false;
                    });
                  } else {
                    setState(() {
                      cardNumAllNum = true;
                    });
                  }
                },
                decoration: InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: 10,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    filled: true,
                    fillColor: Colors.teal[50],
                    hintText: "4242 |",
                    border: InputBorder.none,
                    errorText: cardNumAllNum ? null : "Only Numberrs"),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
                    child: Text("Expiry Date "),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 10, 20, 5),
                    child: Text("Security code"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      width: 150,
                      height: 45,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        onTap: () async {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          dataTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2055),
                          );
                          setState(() {
                            newData = DateFormat('MM-yyyy').format(dataTime!);
                          });
                        },
                        decoration: InputDecoration(
                          hintText: newData.isEmpty ? "MM/YYYY" : newData,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6))),
                      width: 150,
                      height: 45,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        controller: secCon,
                        onSubmitted: (_) {},
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
                child: Text("ZIP/Postal code"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  width: 300,
                  height: 45,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    controller: zipCon,
                    onSubmitted: (_) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              TotalDonWidget(checkEmpty),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Container(
                    height: 200, width: 350, child: const BarChartSample1()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TotalDonWidget extends StatelessWidget {
  final void Function() checkEmpty;
  TotalDonWidget(this.checkEmpty, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
      child: FlatButton(
          onPressed: this.checkEmpty,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.teal[200],
                borderRadius: BorderRadius.all(Radius.circular(6))),
            height: 40,
            width: 301,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
                Consumer<DonationModel>(
                  builder: (context, donation, _) {
                    print("Donation Consumer:${donation.getDonations}");
                    return Text(
                      "Pay \$${donation.getDonations.toDouble()}",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
