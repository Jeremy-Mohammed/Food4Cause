import 'package:flutter/material.dart';
import 'package:food4cause/models/items.dart';
import 'package:food4cause/provider/charityProvider.dart';
import 'package:food4cause/provider/user_model.dart';
import 'package:provider/provider.dart';

class PrevCharity extends StatelessWidget {
  const PrevCharity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool empty = Provider.of<CharityProvider>(context).accounts[0].items.length == 0;
    int indexofUser = Provider.of<CharityProvider>(context).getIndex;
    print("Index : $indexofUser");
    return Container(
        width: 380,
        height: 100,
        child: Consumer<CharityProvider>(
          builder: (context, acc, _) {
            return ListView.builder(
              itemCount: acc.accounts[indexofUser].items.length,
              itemBuilder: (BuildContext context, int index) {
                print(acc.accounts[indexofUser].items[index].item);
                return Column(
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text(
                          acc.accounts[indexofUser].items[index].item,
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      trailing: Text(
                        "${acc.accounts[indexofUser].items[index].weight.toInt()} ${acc.accounts[indexofUser].items[index].metric}",
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
