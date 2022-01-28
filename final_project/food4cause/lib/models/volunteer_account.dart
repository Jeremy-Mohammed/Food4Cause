import 'package:food4cause/models/users.dart';
import 'package:food4cause/models/volunteer_model.dart';

class VolunteerAccount {
  User user;
  List<VolunteerModel> dates;

  VolunteerAccount(this.user, this.dates);
}
