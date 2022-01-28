import 'package:flutter/material.dart';
import 'package:food4cause/provider/charityProvider.dart';
import 'package:food4cause/widgets/prev_request.dart';
import 'package:food4cause/widgets/project_request.dart';
import 'package:food4cause/widgets/request_card.dart';
import 'package:food4cause/widgets/volunteer_request.dart';
import 'package:provider/provider.dart';

class ProjectsTab extends StatelessWidget {
  ProjectsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int indexofUser = Provider.of<CharityProvider>(context).getIndex;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        bottomOpacity: 0,
        elevation: 0,
        foregroundColor: Colors.blue[300],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
                child: Text(
              "Projects",
              style: TextStyle(fontSize: 20),
            )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(275, 0, 0, 0),
            child: Container(
              child: Text("Sumbit a Project"),
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
            child: ProjectRequest(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(260, 15, 0, 0),
            child: Container(
              child: Text("Previous Projects"),
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
          Container(
              width: 380,
              height: 100,
              child: Consumer<CharityProvider>(
                builder: (context, acc, _) {
                  return ListView.builder(
                    itemCount: acc.accounts[indexofUser].partItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                            trailing: Text(
                              acc.accounts[indexofUser].partItems[index].item,
                              style: TextStyle(color: Colors.grey),
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
                  );
                },
              ))
        ],
      ),
    );
  }
}
