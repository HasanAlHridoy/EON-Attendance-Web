// To parse this JSON data, do
//
//     final employeeDataModel = employeeDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<EmployeeDataModel> employeeDataModelFromJson(String str) =>
    List<EmployeeDataModel>.from(
        json.decode(str).map((x) => EmployeeDataModel.fromJson(x)));

String employeeDataModelToJson(List<EmployeeDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeDataModel {
  EmployeeDataModel({
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
    required this.territory,
    required this.area,
    required this.region,
    required this.zone,
    required this.loginCount,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
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
  String territory;
  String area;
  String region;
  String zone;
  int loginCount;
  int v;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;

  factory EmployeeDataModel.fromJson(Map<String, dynamic> json) =>
      EmployeeDataModel(
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
        territory: json["territory"],
        area: json["area"],
        region: json["region"],
        zone: json["zone"],
        loginCount: json["loginCount"],
        v: json["__v"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
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
        "territory": territory,
        "area": area,
        "region": region,
        "zone": zone,
        "loginCount": loginCount,
        "__v": v,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdBy": createdBy,
      };
}

// // To parse this JSON data, do
// //
// //     final employeeDataModel = employeeDataModelFromJson(jsonString);

// import 'dart:convert';

// List<EmployeeDataModel> employeeDataModelFromJson(String str) =>
//     List<EmployeeDataModel>.from(
//         json.decode(str).map((x) => EmployeeDataModel.fromJson(x)));

// String employeeDataModelToJson(List<EmployeeDataModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class EmployeeDataModel {
//   EmployeeDataModel({
//     required this.id,
//     required this.cid,
//     required this.employeeId,
//     required this.employeeName,
//     required this.designation,
//     required this.password,
//     required this.mobile,
//     required this.email,
//     required this.restrictPoiUser,
//     required this.market,
//     required this.area,
//     required this.region,
//     required this.zone,
//     required this.loginCount,
//     required this.v,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//     required this.territory,
//     required this.updatedBy,
//   });

//   String id;
//   String cid;
//   String employeeId;
//   String employeeName;
//   String designation;
//   String password;
//   String mobile;
//   String email;
//   bool restrictPoiUser;
//   String market;
//   String area;
//   String region;
//   String zone;
//   int loginCount;
//   int v;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String createdBy;
//   String territory;
//   String updatedBy;

//   factory EmployeeDataModel.fromJson(Map<String, dynamic> json) =>
//       EmployeeDataModel(
//         id: json["_id"],
//         cid: json["cid"],
//         employeeId: json["employeeId"],
//         employeeName: json["employeeName"],
//         designation: json["designation"],
//         password: json["password"],
//         mobile: json["mobile"],
//         email: json["email"],
//         restrictPoiUser: json["restrictPoiUser"],
//         market: json["market"],
//         area: json["area"],
//         region: json["region"],
//         zone: json["zone"],
//         loginCount: json["loginCount"],
//         v: json["__v"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         createdBy: json["createdBy"],
//         territory: json["territory"],
//         updatedBy: json["updatedBy"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "cid": cid,
//         "employeeId": employeeId,
//         "employeeName": employeeName,
//         "designation": designation,
//         "password": password,
//         "mobile": mobile,
//         "email": email,
//         "restrictPoiUser": restrictPoiUser,
//         "market": market,
//         "area": area,
//         "region": region,
//         "zone": zone,
//         "loginCount": loginCount,
//         "__v": v,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "createdBy": createdBy,
//         "territory": territory,
//         "updatedBy": updatedBy,
//       };
// }
