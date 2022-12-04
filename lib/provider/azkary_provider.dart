import 'package:flutter/cupertino.dart';

import '../db/controller/ziker_controller.dart';
import '../model/zekery.dart';

class AzkaryProvider extends ChangeNotifier {

  int sumNum =0;

  bool loading = false;
  List<AzkaryModel> azkary = <AzkaryModel>[];

  final AzkaryController _azkaryController = AzkaryController();


  void sumIncrement(){
    sumNum++;
    notifyListeners();
  }

  void read() async {
    loading = true;
    print('true');
    azkary = await _azkaryController.read();
    loading = false;
    print('false');
    print(azkary.length);
    notifyListeners();
  }

  Future<bool> create({required AzkaryModel azkaryModel}) async {
    int newRowId = await _azkaryController.create(azkaryModel);
    if (newRowId != 0) {
      azkaryModel.id = newRowId;
      azkary.add(azkaryModel);
      notifyListeners();
    }
    return newRowId != 0;
  }

  Future<bool> delete(/*int id*/ int index) async {
    bool deleted = await _azkaryController.delete(azkary[index].id);
    if (deleted) {
      azkary.removeAt(index);
      notifyListeners();
      //*************
      // azkary.indexWhere((element) => element.id ==id);
      // notifyListeners();
      // ******************
      // int index = azkary.indexWhere((element) => element.id ==id);
      // if(index!=-1){
      //   azkary.removeAt(index);
      //   notifyListeners();
      // }
    }
    return deleted;
  }
}
