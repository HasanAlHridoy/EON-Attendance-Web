// To parse this JSON data, do
//
//     final attendanceDataModel = attendanceDataModelFromJson(jsonString);

import 'dart:convert';

List<AttendanceDataModel> attendanceDataModelFromJson(String str) =>
    List<AttendanceDataModel>.from(
        json.decode(str).map((x) => AttendanceDataModel.fromJson(x)));

String attendanceDataModelToJson(List<AttendanceDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AttendanceDataModel {
  AttendanceDataModel({
    required this.id,
    required this.cid,
    required this.employeeId,
    required this.attendanceDate,
    required this.attendanceDateTime,
    required this.employeeName,
    required this.mobile,
    required this.distance,
    required this.lat,
    required this.long,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String cid;
  String employeeId;
  String attendanceDate;
  DateTime attendanceDateTime;
  String employeeName;
  String mobile;
  dynamic distance;
  String lat;
  String long;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory AttendanceDataModel.fromJson(Map<String, dynamic> json) =>
      AttendanceDataModel(
        id: json["_id"],
        cid: json["cid"],
        employeeId: json["employeeId"],
        attendanceDate: json["attendanceDate"],
        attendanceDateTime: DateTime.parse(json["attendanceDateTime"]),
        employeeName: json["employeeName"],
        mobile: json["mobile"],
        distance: json["distance"],
        lat: json["lat"],
        long: json["long"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "cid": cid,
        "employeeId": employeeId,
        "attendanceDate": attendanceDate,
        "attendanceDateTime": attendanceDateTime.toIso8601String(),
        "employeeName": employeeName,
        "mobile": mobile,
        "distance": distance,
        "lat": lat,
        "long": long,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
