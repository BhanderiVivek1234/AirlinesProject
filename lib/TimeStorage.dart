import 'package:hive/hive.dart';

part 'TimeStorage.g.dart';

@HiveType(typeId: 1)
class TimeStorage extends HiveObject {
  TimeStorage(this.dateTime);
  @HiveField(0)
  DateTime dateTime;
}
