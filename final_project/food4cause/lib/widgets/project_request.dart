import 'package:flutter/material.dart';
import 'package:food4cause/models/communities.dart';
import 'package:food4cause/models/items.dart';
import 'package:food4cause/models/parItem.dart';
import 'package:food4cause/models/volunteer_model.dart';
import 'package:food4cause/provider/charityProvider.dart';
import 'package:food4cause/provider/communitie_model.dart';
import 'package:food4cause/provider/partner_model.dart';
import 'package:food4cause/provider/user_model.dart';
import 'package:food4cause/provider/volunteerProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:food4cause/provider/donationModel.dart';
import 'package:food4cause/provider/user_model.dart';
import 'package:food4cause/widgets/barChartSample.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';

class ProjectRequest extends StatefulWidget {
  const ProjectRequest({Key? key}) : super(key: key);

  @override
  State<ProjectRequest> createState() => ProjectRequestState();
}

class ProjectRequestState extends State<ProjectRequest> {
  TextEditingController titleCon = new TextEditingController();
  TextEditingController detailsCon = new TextEditingController();

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text("Title"),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        width: 300,
                        height: 45,
                        child: TextField(
                          controller: titleCon,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              fontSize: 10,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 0),
                            hintText: "Drivers",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                      child: Text("Details"),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        width: 300,
                        height: 120,
                        child: TextField(
                          controller: detailsCon,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: TextStyle(
                            color: Colors.blue[300],
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              fontSize: 10,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 0),
                            hintText: "John Wave",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                    padding: EdgeInsets.only(right: 10),
                    width: 150,
                    height: 35,
                    child: ElevatedButton(
                        onPressed: () {
                          Provider.of<CharityProvider>(context, listen: false)
                              .addToPart(
                                  PartItem(titleCon.text, detailsCon.text));
                          titleCon.clear();
                          detailsCon.clear();
                        },
                        child: Text("Request"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue[300], elevation: 0))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
