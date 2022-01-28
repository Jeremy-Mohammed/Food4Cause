import 'package:flutter/material.dart';
import 'package:food4cause/models/communities.dart';
import 'package:food4cause/models/items.dart';
import 'package:food4cause/models/parItem.dart';
import 'package:food4cause/models/volunteer_model.dart';
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

class VolunteerRequest extends StatefulWidget {
  const VolunteerRequest({Key? key}) : super(key: key);

  @override
  State<VolunteerRequest> createState() => VolunteerRequestState();
}

class VolunteerRequestState extends State<VolunteerRequest> {
  TextEditingController dateCon = new TextEditingController();
  TextEditingController timeCon = new TextEditingController();
  CommunityModel communityModel = new CommunityModel();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  DateTime? dataTime;
  String newData = "";
  //Validation for text
  bool itemBool = false;
  bool weightBool = false;
  String _timeFormated(TimeOfDay time) {
    if (time == null) return "--:---";
    return "${time.hour}:${time.minute}";
  }

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
                    Text("Date:"),
                    Form(
                        child: SizedBox(
                      width: 275,
                      child: TextField(
                        controller: dateCon,
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
                            newData =
                                DateFormat('dd-MM-yyyy').format(dataTime!);
                          });
                        },
                        decoration: InputDecoration(
                          hintText: newData.isEmpty ? "dd-MM/YYYY" : newData,
                          border: InputBorder.none,
                        ),
                      ),
                    ))
                  ],
                ),
                Row(
                  children: [
                    Text("Time:"),
                    Form(
                      child: SizedBox(
                        width: 225,
                        child: TextField(
                            controller: timeCon,
                            onTap: () {
                              TimeRangePicker.show(
                                context: context,
                                unSelectedEmpty: true,
                                startTime: TimeOfDay(
                                    hour: _startTime.hour,
                                    minute: _startTime.minute),
                                endTime: TimeOfDay(
                                    hour: _endTime.hour,
                                    minute: _endTime.minute),
                                onSubmitted: (TimeRangeValue value) {
                                  setState(() {
                                    _startTime = value.startTime!;
                                    _endTime = value.endTime!;
                                    timeCon.text = _timeFormated(_startTime) +
                                        "|" +
                                        _timeFormated(_endTime);
                                    print(timeCon.text);
                                  });
                                },
                              );
                            }),
                      ),
                    ),
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
                                Provider.of<VolunteerProvider>(context,
                                        listen: false)
                                    .addToItems(VolunteerModel(
                                        newData,
                                        _timeFormated(_startTime),
                                        _timeFormated(_endTime)));
                                dateCon.clear();
                                timeCon.clear();
                                newData = "";
                              },
                              child: Text("Request"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green[300], elevation: 0))),
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
