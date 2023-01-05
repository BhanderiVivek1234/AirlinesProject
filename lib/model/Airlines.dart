import 'package:hive/hive.dart';

part 'Airlines.g.dart';

@HiveType(typeId: 0)
class Airlines {
  int? id;
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? country;
  @HiveField(2)
  String? logo;
  String? slogan;
  String? headquaters;
  String? website;
  String? established;
  String? error;

  Airlines({
    this.id,
    required this.name,
    this.country,
    this.logo,
    this.slogan,
    this.headquaters,
    this.website,
    this.established,
  });

  @override
  int get hashCode => this.name.hashCode;

  @override
  bool operator ==(Object other) => other is Airlines && other.name == name;

  Airlines.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        country = json["country"],
        logo = json["logo"],
        established = json["established"],
        slogan = json["slogan"],
        headquaters = json["head_quaters"],
        website = json["website"];

  Airlines.withError(String err) : error = err;
}
