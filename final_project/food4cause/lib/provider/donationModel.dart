import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonationModel extends ChangeNotifier {
  int donations = 0;

  int get getDonations => donations;

  void addToDonations(int amount) {
    donations = donations + amount;
    notifyListeners();
  }

  void removeDonation(int amount) {
    if (donations <= 0) {
      donations = 0;
    } else {
      donations -= amount;
    }

    notifyListeners();
  }

  void setDonation() {
    donations = 0;
    notifyListeners();
  }
}
