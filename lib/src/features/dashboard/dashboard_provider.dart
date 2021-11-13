import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/src/models/fav_pub_model.dart';

class DashboardProvider extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  DashboardProvider() {
    getProjects();
    getFavPackages();
  }

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List _projects = [];
  List get projects => _projects;

  Future getProjects() async {
    await firestore.collection('projects').limit(1).get().then((value) async {
      if (value.size != 0) {
        QuerySnapshot snap = await firestore
            .collection('projects')
            .orderBy('completed_at', descending: true)
            .get();
        List d = snap.docs;
        _projects.clear();
        d.forEach((element) {
          _projects.add(element);
        });
      } else {
        _projects.clear();
      }
      _isLoading = false;
      notifyListeners();
    });
  }

  List _packages = [];
  List get packages => _packages;

  Future getFavPackages() async {
    await firestore.collection('packages').limit(1).get().then((value) async {
      if (value.size != 0) {
        DocumentSnapshot snap =
            await firestore.collection('packages').doc('fav').get();
        var d = snap.data() as Map;
        List list = d['pub'];
        _packages.clear();
        _packages.addAll(FavPub.toList(list));
      } else {
        _packages.clear();
      }
      notifyListeners();
    });
  }
}
