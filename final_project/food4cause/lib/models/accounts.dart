import 'items.dart';
import 'users.dart';

class Account {
  User user;
  List<Item> items;

  Account(this.user, this.items);
}
