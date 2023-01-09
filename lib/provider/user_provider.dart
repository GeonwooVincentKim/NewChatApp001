import 'package:flutter/cupertino.dart';
import 'package:new_ios_chatapp_0/model/data/user_data.dart';
import 'package:new_ios_chatapp_0/model/user.dart';

class UserProvider with ChangeNotifier {
  final List<User> _filteredUsers = DUMMY_USERS.toList();
  List<User> get filteredUsers => [..._filteredUsers];

  late User _getSingleUser;
  // ignore: unnecessary_null_comparison
  User? get getSingleUser => _getSingleUser != null ? User.from(_getSingleUser) : null;

  void selectUser(User user) {
    _getSingleUser = user;
    notifyListeners();
  }
}
