import 'package:flutter/material.dart';
import 'package:food4cause/models/communities.dart';
import 'package:food4cause/models/food_partner_model.dart';
import 'package:food4cause/provider/communitie_model.dart';
import 'package:provider/provider.dart';

class drawerFoodPartner extends StatelessWidget {
  drawerFoodPartner({Key? key}) : super(key: key);

  TextEditingController nameCon = new TextEditingController();
  TextEditingController addCon = new TextEditingController();
  List<FoodPartnerModel> partners = [
    FoodPartnerModel("Marvel PartnerShip", "12 Thorus ave"),
    FoodPartnerModel("Warner PartnerShip", "13 Thorus ave"),
    FoodPartnerModel("Weekend PartnerShip", "14 Thorus ave"),
    FoodPartnerModel("Spotify PartnerShip", "15 Thorus ave"),
  ];
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
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Center(
                    child: Text(
                  "Food Partners",
                  style: TextStyle(fontSize: 23, color: Colors.grey),
                )),
              ),
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
      child: ListView.builder(
        itemCount: partners.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                leading: Icon(Icons.location_on),
                title: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    partners[index].name,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                trailing: Text(
                  partners[index].address,
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
      ),
    );
  }
}
