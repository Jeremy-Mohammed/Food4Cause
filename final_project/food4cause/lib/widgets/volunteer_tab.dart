import 'package:flutter/material.dart';
import 'package:food4cause/widgets/prev_request.dart';
import 'package:food4cause/widgets/request_card.dart';
import 'package:food4cause/widgets/volunteer_request.dart';

class VolunteerTab extends StatelessWidget {
  VolunteerTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        bottomOpacity: 0,
        elevation: 0,
        foregroundColor: Colors.green[300],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
                child: Text(
              "Volunteer",
              style: TextStyle(fontSize: 20),
            )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(275, 0, 0, 0),
            child: Container(
              child: Text("Volunteer Request"),
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
                  color: Colors.green[300],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: VolunteerRequest(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(260, 15, 0, 0),
            child: Container(
              child: Text("Previous Request"),
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
                  color: Colors.green[300],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
