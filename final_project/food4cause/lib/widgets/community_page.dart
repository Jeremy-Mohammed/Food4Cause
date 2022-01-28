import 'package:flutter/material.dart';
import 'package:food4cause/models/communities.dart';
import 'package:food4cause/provider/communitie_model.dart';
import 'package:provider/provider.dart';

class CommunityPage extends StatelessWidget {
  CommunityPage({Key? key}) : super(key: key);

  TextEditingController nameCon = new TextEditingController();
  TextEditingController addCon = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(100, 15, 0, 0),
                    child: Container(
                      child: Text("Name"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(160, 15, 0, 0),
                    child: Container(
                      child: Text("Address"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(80, 10, 0, 0),
                    child: Container(
                      height: 2,
                      width: 80,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(110, 10, 0, 0),
                    child: Container(
                      height: 2,
                      width: 100,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              listViewNameAdd(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
                child: Text("Community Name"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  width: 350,
                  height: 45,
                  child: TextField(
                    controller: nameCon,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 10,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      hintText: "Brandon Community",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 5),
                child: Text("Address"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  width: 350,
                  height: 45,
                  child: TextField(
                    controller: addCon,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 10,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      hintText: "12 IDK Street",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Container(
                      width: 100,
                      height: 35,
                      child: ElevatedButton(
                          onPressed: () {
                            Provider.of<CommunityModel>(context, listen: false)
                                .addComm(
                                    Communities(nameCon.text, addCon.text));
                          },
                          child: Text("Submit"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey, elevation: 0))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container listViewNameAdd() {
    return Container(
        width: 380,
        height: 300,
        child: Consumer<CommunityModel>(
          builder: (context, comm, _) {
            return ListView.builder(
              itemCount: comm.commList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          comm.commList2[index].name,
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      trailing: Text(
                        comm.commList[index].address,
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
        ));
  }
}
