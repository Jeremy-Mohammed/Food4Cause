import 'package:food4cause/models/parItem.dart';

import 'items.dart';
import 'users.dart';

class CharityAccount {
  User user;
  List<Item> items;
  List<PartItem> partItems;

  CharityAccount(this.user, this.items, this.partItems);
}
