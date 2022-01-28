import 'package:flutter/material.dart';
import 'package:food4cause/models/communities.dart';
import 'package:food4cause/models/items.dart';
import 'package:food4cause/provider/communitie_model.dart';
import 'package:food4cause/provider/user_model.dart';
import 'package:provider/provider.dart';

class DonationCard extends StatefulWidget {
  const DonationCard({Key? key}) : super(key: key);

  @override
  State<DonationCard> createState() => _DonationCardState();
}

class _DonationCardState extends State<DonationCard> {
  List<String> items = ["L", "gal", "lbs", "kilo"];
  String dropDownValue = "L";

  TextEditingController itemCon = new TextEditingController();
  TextEditingController weightCon = new TextEditingController();
  TextEditingController expiryCon = new TextEditingController();
  TextEditingController storageCon = new TextEditingController();
  TextEditingController otherCon = new TextEditingController();
  CommunityModel communityModel = new CommunityModel();
  //Validation for text
  bool itemBool = false;
  bool weightBool = false;
  List<Communities> listComm = [];
  Communities dropDownValue1 = Communities("Start", "Ebd");
  initState() {
    super.initState();
    listComm = Provider.of<CommunityModel>(context, listen: false).commList;
    dropDownValue1 = listComm[0];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 390,
        width: 380,
        child: Card(
          shadowColor: Colors.grey[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          semanticContainer: true,
          color: Colors.grey[50],
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text("Community:"),
                    Container(
                      height: 43,
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: DropdownButton<Communities>(
                        elevation: 16,
                        style: TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.orange[800],
                        ),
                        onChanged: (Communities? newValue) {
                          setState(() {
                            dropDownValue1 = newValue!;
                            print(dropDownValue1.name);
                          });
                        },
                        value: dropDownValue1,
                        items: listComm.map<DropdownMenuItem<Communities>>(
                            (Communities value) {
                          return DropdownMenuItem<Communities>(
                            value: value,
                            child: Text(value.name),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Item:"),
                    Form(
                        child: SizedBox(
                            width: 275,
                            child: TextFormField(
                              controller: itemCon,
                              onFieldSubmitted: (_) {
                                setState(() {
                                  if (itemCon.text == null ||
                                      !itemCon.text
                                          .contains(RegExp('[A-Za-z]'))) {
                                    itemBool = true;
                                  }
                                });
                              },
                            )))
                  ],
                ),
                Row(
                  children: [
                    Text("Weight:"),
                    Form(
                        child: SizedBox(
                            width: 260,
                            child: TextFormField(
                              controller: weightCon,
                              onFieldSubmitted: (_) {
                                setState(() {
                                  if (weightCon.text == null ||
                                      weightCon.text
                                          .contains(RegExp('[A-Za-z]'))) {
                                    weightBool = true;
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                errorText: weightBool
                                    ? "Numbers only / Fill in blank"
                                    : null,
                              ),
                            )))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    children: [
                      Text("Choose:"),
                      Container(
                        height: 43,
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: DropdownButton<String>(
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.orange[800],
                          ),
                          onTap: () {},
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                              print(dropDownValue);
                            });
                          },
                          value: dropDownValue,
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("Expiry:"),
                    Form(
                        child: SizedBox(
                            width: 265,
                            child: TextField(
                              controller: expiryCon,
                            )))
                  ],
                ),
                Row(
                  children: [
                    Text("Storage Method:"),
                    Form(
                        child: SizedBox(
                            width: 205,
                            child: TextField(
                              controller: storageCon,
                            )))
                  ],
                ),
                Row(
                  children: [
                    Text("Other Details:"),
                    Form(
                        child: SizedBox(
                            width: 225,
                            child: TextField(
                              controller: otherCon,
                            )))
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: Container(
                      padding: EdgeInsets.only(right: 10),
                      width: 350,
                      height: 35,
                      child: ElevatedButton(
                          onPressed: () {
                            double weight1 = double.parse(weightCon.text);
                            Provider.of<UserModel>(context, listen: false)
                                .addToItems(Item(
                                    itemCon.text,
                                    weight1,
                                    dropDownValue,
                                    expiryCon.text,
                                    storageCon.text,
                                    otherCon.text));
                            itemCon.clear();
                            weightCon.clear();
                            expiryCon.clear();
                            storageCon.clear();
                            otherCon.clear();
                          },
                          child: Text("Donate"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orangeAccent[700],
                              elevation: 0))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
