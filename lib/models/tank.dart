// To parse this JSON data, do
//
//     final tank = tankFromJson(jsonString);

import 'dart:convert';

List<Tank> tankFromJson(String str) =>
    List<Tank>.from(json.decode(str).map((x) => Tank.fromJson(x)));

String tankToJson(List<Tank> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tank {
  Tank({
    required this.id,
    required this.userId,
    required this.company,
    required this.height,
    required this.radius,
    required this.capacity,
  });

  int id;
  int userId;
  String company;
  double height;
  double radius;
  int capacity;

  factory Tank.fromJson(Map<String, dynamic> json) => Tank(
        id: json["id"],
        userId: json["user_id"],
        company: json["company"],
        height: json["height"].toDouble(),
        radius: json["radius"].toDouble(),
        capacity: json["capacity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "company": company,
        "height": height,
        "radius": radius,
        "capacity": capacity,
      };
}
