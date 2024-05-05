import 'package:flutter/material.dart';

class LikeProviderLct extends ChangeNotifier {
  List<int> listLikeLct = [];

  void onLike(int id) {
    if (listLikeLct.contains(id)) {
      listLikeLct.remove(id);
    } else {
      listLikeLct.add(id);
    }
    notifyListeners();
  }
}
