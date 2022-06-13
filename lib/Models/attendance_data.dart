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
    required this.poiId,
    required this.userId,
    required this.attendanceDateTime,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.cid,
    required this.employeeId,
    required this.employeeName,
    required this.mobile,
    required this.distance,
    required this.lat,
    required this.long,
    required this.attendanceDate,
  });

  String id;
  List poiId;
  List userId;
  DateTime attendanceDateTime;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String cid;
  String employeeId;
  String employeeName;
  String mobile;
  double distance;
  String lat;
  String long;
  DateTime attendanceDate;

  factory AttendanceDataModel.fromJson(Map<String, dynamic> json) =>
      AttendanceDataModel(
        id: json["_id"],
        poiId: json["poiId"],
        userId: json["userId"],
        attendanceDateTime: DateTime.parse(json["attendanceDateTime"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        cid: json["cid"],
        employeeId: json["employeeId"],
        employeeName: json["employeeName"],
        mobile: json["mobile"],
        distance: json["distance"],
        lat: json["lat"],
        long: json["long"],
        attendanceDate: json["attendanceDate"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "poiId": poiId,
        "userId": userId,
        "attendanceDateTime": attendanceDateTime.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "cid": cid,
        "employeeId": employeeId,
        "employeeName": employeeName,
        "mobile": mobile,
        "distance": distance,
        "lat": lat,
        "long": long,
        "attendanceDate": attendanceDate,
      };
}
