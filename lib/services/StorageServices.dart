import 'package:api_example/TimeStorage.dart';
import 'package:api_example/model/Airlines.dart';
import 'package:hive_flutter/adapters.dart';

class StorageServices {
  // final airlinebox = Hive.box("airlines");
  // final timebox = Hive.box("time");

  void openBox(String name) async {
    bool isOpen = Hive.isBoxOpen(name);
    late Box box;
    if (isOpen) {
      // DO NOTHING
      // box = Hive.box(name);
    } else {
      await Hive.openBox(name);
      // box = Hive.box(name);
    }
    // return box;
  }

  void storeAirline(Airlines Airlines, int key) {
    // airlinebox.put(key, Airlines);
    openBox("airlines");
    var box = Hive.box("airlines");
    box.put(key, Airlines);
  }

  Airlines? getAirline(int key) {
    openBox("airlines");
    var box = Hive.box("airlines");

    Airlines value = box.get(key);
    return value;
  }

  void storeTime(TimeStorage timeStorage, String key) {
    openBox("time");
    var box = Hive.box("time");
    box.put(key, timeStorage);
  }

  DateTime? getTime(String key) {
    try {
      openBox("time");
      var box = Hive.box("time");

      TimeStorage currentTime = box.get(key);
      return currentTime.dateTime;
    } catch (e) {
      return null;
    }
  }
}
