import 'package:food4cause/models/parItem.dart';
import 'package:food4cause/models/users.dart';

class Partner {
  User user;
  List<PartItem> items;
  int counter;
  Partner(this.user, this.items, this.counter);
}
