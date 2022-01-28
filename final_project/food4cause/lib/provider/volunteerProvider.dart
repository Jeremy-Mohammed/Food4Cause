import 'package:flutter/cupertino.dart';
import 'package:food4cause/models/parItem.dart';
import 'package:food4cause/models/partner.dart';
import 'package:food4cause/models/users.dart';
import 'package:food4cause/models/volunteer_account.dart';
import 'package:food4cause/models/volunteer_model.dart';
import 'package:food4cause/widgets/signIn.dart';

class VolunteerProvider extends ChangeNotifier {
  User user = User("", "", "", false);
  List<User> listOfUsers = [
    User("brand@gmail.com", "pass", "Brandon Deoram ", false)
  ];
  List<String> emails = ["brand@gmail.com"];
  List<VolunteerAccount> accounts = [
    VolunteerAccount(User("brand@gmail.com", "pass", "Brandon Deoram", false),
        [VolunteerModel("18-10-2021", "10:14", "14:00")])
  ];
  String username = "";

  User get getUser => user;
  List<VolunteerAccount> get getAccounts => accounts;
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
    accounts.add(VolunteerAccount(newUser, []));
    notifyListeners();
  }

  void signIn(User oldUser) {
    user = oldUser;
    print(user.emailAddress);
    notifyListeners();
  }

  void addToItems(VolunteerModel item) {
    int index = emails.indexOf(user.emailAddress);
    if (accounts[index].user.emailAddress == user.emailAddress) {
      accounts[index].dates.add(item);
    } else {
      print("SOMETHING WRONG");
    }
    notifyListeners();
  }

  void printItems() {
    int index = listOfUsers.indexOf(user);
    print(accounts[index].dates);
  }

  int get getIndex {
    print("Current User: ${user.emailAddress}");
    return emails.indexOf(user.emailAddress);
  }
}
