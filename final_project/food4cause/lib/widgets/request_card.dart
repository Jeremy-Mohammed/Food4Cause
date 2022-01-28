import 'package:flutter/material.dart';
import 'package:food4cause/models/communities.dart';
import 'package:food4cause/models/items.dart';
import 'package:food4cause/models/parItem.dart';
import 'package:food4cause/provider/communitie_model.dart';
import 'package:food4cause/provider/partner_model.dart';
import 'package:food4cause/provider/user_model.dart';
import 'package:provider/provider.dart';

class RequestCard extends StatefulWidget {
  const RequestCard({Key? key}) : super(key: key);

  @override
  State<RequestCard> createState() => RequestCardState();
}

class RequestCardState extends State<RequestCard> {
  TextEditingController itemCon = new TextEditingController();
  TextEditingController otherCon = new TextEditingController();
  CommunityModel communityModel = new CommunityModel();
  //Validation for text
  bool itemBool = false;
  bool weightBool = false;
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 180,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.only(right: 10),
                          width: 150,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                Provider.of<PartnerModel>(context,
                                        listen: false)
                                    .addToItems(
                                        PartItem(itemCon.text, otherCon.text));
                                itemCon.clear();
                                otherCon.clear();
                              },
                              child: Text("Request"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.yellow[700], elevation: 0))),
                      Container(
                          padding: EdgeInsets.only(right: 10),
                          width: 150,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                int index = Provider.of<PartnerModel>(context,
                                        listen: false)
                                    .getIndex;
                                if (Provider.of<PartnerModel>(context,
                                            listen: false)
                                        .accounts[index]
                                        .counter ==
                                    0) {
                                  Provider.of<PartnerModel>(context,
                                          listen: false)
                                      .addToItems(
                                          PartItem("Request", "Anything"));
                                  Provider.of<PartnerModel>(context,
                                          listen: false)
                                      .addCounter();
                                } else {
                                  final scaffold =
                                      ScaffoldMessenger.of(context);
                                  scaffold.showSnackBar(SnackBar(
                                    content: Text(
                                      "Already Clicked it Once",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.yellow[700],
                                  ));
                                }

                                itemCon.clear();
                                otherCon.clear();
                              },
                              child: Text("Request \nAnything"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.yellow[700], elevation: 0))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
