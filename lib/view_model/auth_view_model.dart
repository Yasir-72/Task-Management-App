import 'package:flutter/material.dart';

import '../respository/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // Future<void> loginApi(dynamic data, BuildContext context) async {
  //   setLoading(true);
  //   _myRepo.loginApi(data).then((value) {
  //     setLoading(false);
  //     Utils.snackBar('Login Successfully', context);
  //     Navigator.pushNamed(context, RoutesName.home);
  //   }).onError((error, stackTrace) {
  //     setLoading(false);
  //     Utils.flushBarErrorMessage(error.toString(), context);
  //   });
  // }
}
