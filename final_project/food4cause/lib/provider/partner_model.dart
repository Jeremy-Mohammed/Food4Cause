import 'package:flutter/cupertino.dart';
import 'package:food4cause/models/parItem.dart';
import 'package:food4cause/models/partner.dart';
import 'package:food4cause/models/users.dart';
import 'package:food4cause/widgets/signIn.dart';

class PartnerModel extends ChangeNotifier {
  User user = User("", "", "", false);
  List<User> listOfUsers = [
    User("brand@gmail.com", "pass", "Brandon Deoram ", false)
  ];
  List<String> emails = ["brand@gmail.com"];
  List<Partner> accounts = [
    Partner(User("brand@gmail.com", "pass", "Brandon Deoram", false),
        [PartItem("Guac", "Lots")], 0)
  ];
  String username = "";

  User get getUser => user;
  List<Partner> get getAccounts => accounts;
  String get getUserName => username;

  void addUserName(String name) {
    username = name;
    int index = getIndex;
    accounts[index].user.username = name;
    notifyListeners();
  }

  void signOut() {
    int index = getIndex;
    user.signIn = false;
    accounts[index].user.signIn = false;
    notifyListeners();
  }

  void addToUser(User newUser) {
    user = newUser;
    emails.add(newUser.emailAddress);
    accounts.add(Partner(newUser, [], 0));
    // print(accounts[1].user.emailAddress);
    notifyListeners();
  }

  void signIn(User oldUser) {
    user = oldUser;
    print(user.emailAddress);
    notifyListeners();
  }

  void addToItems(PartItem item) {
    int index = emails.indexOf(user.emailAddress);
    print("ACCOUNT:${accounts[index].user.emailAddress}");
    print("Current:${user.emailAddress}");
    if (accounts[index].user.emailAddress == user.emailAddress) {
      accounts[index].items.add(item);
    } else {
      print("SOMETHING WRONG");
    }
    notifyListeners();
  }

  void printItems() {
    int index = listOfUsers.indexOf(user);
    print(accounts[index].items);
  }

  int get getIndex {
    print("Current User: ${user.emailAddress}");
    return emails.indexOf(user.emailAddress);
  }

  void addCounter() {
    int index = getIndex;
    print("INDEX:${index} USER:${user.emailAddress}");
    accounts[index].counter = 1;
    notifyListeners();
  }
}
