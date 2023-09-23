import 'dart:io';


import 'package:app_idosos/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

class DbStore {
  static final DbStore _singleton = DbStore._internal();
  static Store? _store;


  factory DbStore() {
    return _singleton;
  }

  DbStore._internal();

  Future<Store> get() async {
    if (_store == null) {
      Directory dir = await getApplicationDocumentsDirectory();
      if(Store.isOpen(dir.path + '/objectbox')){
        _store = Store.attach(getObjectBoxModel(), dir.path + '/objectbox');
      }else{
        _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
      }



    }




    return _store!;
  }
}
