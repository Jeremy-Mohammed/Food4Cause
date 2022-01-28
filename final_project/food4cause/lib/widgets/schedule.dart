import 'package:flutter/material.dart';
import 'package:food4cause/models/communities.dart';
import 'package:food4cause/provider/communitie_model.dart';
import 'package:food4cause/provider/volunteerProvider.dart';
import 'package:food4cause/widgets/scheduletab.dart';
import 'package:provider/provider.dart';

class Schedule extends StatelessWidget {
  Schedule({Key? key}) : super(key: key);

  TextEditingController nameCon = new TextEditingController();
  TextEditingController addCon = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    int indexofUser = Provider.of<VolunteerProvider>(context).getIndex;
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Center(
                child: Text(
              "Schedule",
              style: TextStyle(fontSize: 25, letterSpacing: 2),
            )),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 30, 0, 0),
                  child: Container(
                    child: Text("Date"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(100, 30, 0, 0),
                  child: Container(
                    child: Text("Start:"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(100, 30, 0, 0),
                  child: Container(
                    child: Text("End:"),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Container(
                  height: 2,
                  width: 360,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          listCon(indexofUser)
        ],
      ),
    );
  }

  Container listCon(int indexofUser) {
    return Container(
        width: 380,
        height: 350,
        child: Consumer<VolunteerProvider>(
          builder: (context, acc, _) {
            return MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                itemCount: acc.accounts[indexofUser].dates.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Start Time:" +
                                acc.accounts[indexofUser].dates[index].starTime,
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        trailing: Text(
                          "End Time:" +
                              acc.accounts[indexofUser].dates[index].endTime,
                        ),
                        leading: Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child: Text(
                              acc.accounts[indexofUser].dates[index].date,
                              style: TextStyle(fontSize: 13)),
                        ),
                      ),
                      Container(
                          height: 0,
                          child: Divider(
                            endIndent: 0,
                            indent: 20,
                          )),
                    ],
                  );
                },
              ),
            );
          },
        ));
  }
}
