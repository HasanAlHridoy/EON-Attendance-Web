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
    required this.poiId,
    required this.userId,
    required this.employeeId,
    required this.attendanceDate,
    required this.attendanceDateTime,
    required this.employeeName,
    required this.mobile,
    required this.distance,
    required this.lat,
    required this.long,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String cid;
  List<PoiId> poiId;
  List<UserId> userId;
  String employeeId;
  DateTime attendanceDate;
  DateTime attendanceDateTime;
  String employeeName;
  String mobile;
  dynamic distance;
  String lat;
  String long;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory AttendanceDataModel.fromJson(Map<String, dynamic> json) =>
      AttendanceDataModel(
        id: json["_id"],
        cid: json["cid"],
        poiId: List<PoiId>.from(json["poiId"].map((x) => PoiId.fromJson(x))),
        userId:
            List<UserId>.from(json["userId"].map((x) => UserId.fromJson(x))),
        employeeId: json["employeeId"],
        attendanceDate: DateTime.parse(json["attendanceDate"]),
        attendanceDateTime: DateTime.parse(json["attendanceDateTime"]),
        employeeName: json["employeeName"],
        mobile: json["mobile"],
        distance: json["distance"],
        lat: json["lat"],
        long: json["long"],
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "cid": cid,
        "poiId": List<dynamic>.from(poiId.map((x) => x.toJson())),
        "userId": List<dynamic>.from(userId.map((x) => x.toJson())),
        "employeeId": employeeId,
        "attendanceDate": attendanceDate.toIso8601String(),
        "attendanceDateTime": attendanceDateTime.toIso8601String(),
        "employeeName": employeeName,
        "mobile": mobile,
        "distance": distance,
        "lat": lat,
        "long": long,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class PoiId {
  PoiId({
    required this.id,
    required this.cid,
    required this.poiId,
    required this.poiType,
    required this.union,
    required this.thana,
    required this.district,
    required this.division,
    required this.market,
    required this.territory,
    required this.area,
    required this.region,
    required this.zone,
    required this.lat,
    required this.long,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
  });

  String id;
  String cid;
  String poiId;
  String poiType;
  String union;
  String thana;
  String district;
  String division;
  String market;
  String territory;
  String area;
  String region;
  String zone;
  String lat;
  String long;
  int v;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;

  factory PoiId.fromJson(Map<String, dynamic> json) => PoiId(
        id: json["_id"],
        cid: json["cid"],
        poiId: json["poiId"],
        poiType: json["poiType"],
        union: json["union"],
        thana: json["thana"],
        district: json["district"],
        division: json["division"],
        market: json["market"],
        territory: json["territory"],
        area: json["area"],
        region: json["region"],
        zone: json["zone"],
        lat: json["lat"],
        long: json["long"],
        v: json["__v"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "cid": cid,
        "poiId": poiId,
        "poiType": poiType,
        "union": union,
        "thana": thana,
        "district": district,
        "division": division,
        "market": market,
        "territory": territory,
        "area": area,
        "region": region,
        "zone": zone,
        "lat": lat,
        "long": long,
        "__v": v,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdBy": createdBy,
      };
}

class UserId {
  UserId({
    required this.id,
    required this.cid,
    required this.employeeId,
    required this.employeeName,
    required this.designation,
    required this.password,
    required this.mobile,
    required this.email,
    required this.restrictPoiUser,
    required this.market,
    required this.area,
    required this.region,
    required this.zone,
    required this.loginCount,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.territory,
    required this.updatedBy,
  });

  String id;
  String cid;
  String employeeId;
  String employeeName;
  String designation;
  String password;
  String mobile;
  String email;
  bool restrictPoiUser;
  String market;
  String area;
  String region;
  String zone;
  int loginCount;
  int v;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;
  String territory;
  String updatedBy;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        cid: json["cid"],
        employeeId: json["employeeId"],
        employeeName: json["employeeName"],
        designation: json["designation"],
        password: json["password"],
        mobile: json["mobile"],
        email: json["email"],
        restrictPoiUser: json["restrictPoiUser"],
        market: json["market"],
        area: json["area"],
        region: json["region"],
        zone: json["zone"],
        loginCount: json["loginCount"],
        v: json["__v"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        territory: json["territory"],
        updatedBy: json["updatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "cid": cid,
        "employeeId": employeeId,
        "employeeName": employeeName,
        "designation": designation,
        "password": password,
        "mobile": mobile,
        "email": email,
        "restrictPoiUser": restrictPoiUser,
        "market": market,
        "area": area,
        "region": region,
        "zone": zone,
        "loginCount": loginCount,
        "__v": v,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdBy": createdBy,
        "territory": territory,
        "updatedBy": updatedBy,
      };
}


// // To parse this JSON data, do
// //
// //     final attendanceDataModel = attendanceDataModelFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// List<AttendanceDataModel> attendanceDataModelFromJson(String str) =>
//     List<AttendanceDataModel>.from(
//         json.decode(str).map((x) => AttendanceDataModel.fromJson(x)));

// String attendanceDataModelToJson(List<AttendanceDataModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class AttendanceDataModel {
//   AttendanceDataModel({
//     required this.id,
//     required this.cid,
//     required this.employeeId,
//     required this.attendanceDate,
//     required this.attendanceDateTime,
//     required this.employeeName,
//     required this.mobile,
//     required this.distance,
//     required this.lat,
//     required this.long,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });

//   String id;
//   String cid;
//   String employeeId;
//   DateTime attendanceDate;
//   DateTime attendanceDateTime;
//   String employeeName;
//   String mobile;
//   double distance;
//   String lat;
//   String long;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;

//   factory AttendanceDataModel.fromJson(Map<String, dynamic> json) =>
//       AttendanceDataModel(
//         id: json["_id"],
//         cid: json["cid"],
//         employeeId: json["employeeId"],
//         attendanceDate: DateTime.parse(json["attendanceDate"]),
//         attendanceDateTime: DateTime.parse(json["attendanceDateTime"]),
//         employeeName: json["employeeName"],
//         mobile: json["mobile"],
//         distance: json["distance"].toDouble(),
//         lat: json["lat"],
//         long: json["long"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "cid": cid,
//         "employeeId": employeeId,
//         "attendanceDate": attendanceDate.toIso8601String(),
//         "attendanceDateTime": attendanceDateTime.toIso8601String(),
//         "employeeName": employeeName,
//         "mobile": mobile,
//         "distance": distance,
//         "lat": lat,
//         "long": long,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//       };
// }
