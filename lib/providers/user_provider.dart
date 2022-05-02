import 'package:flutter/foundation.dart';
import 'package:future_jobs/models/user_model.dart';

class UserProvider with ChangeNotifier {
  

  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? newUser){
    _user = newUser;
    notifyListeners();
  }
}