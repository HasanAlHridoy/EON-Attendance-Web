// // To parse this JSON data, do
// //
// //     final poiDataModel = poiDataModelFromJson(jsonString);

// // List<PoiDataModel> test= poiDataModelFromJson(res.body);

// // List<PoiDataModel> poiDataModelFromJson(String str) => List<PoiDataModel>.from(json.decode(str).map((x) => PoiDataModel.fromJson(x)));

// // String poiDataModelToJson(List<PoiDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class PoiDataModel {
//   PoiDataModel({
//     required this.id,
//     required this.cid,
//     required this.poiId,
//     required this.poiType,
//     required this.union,
//     required this.thana,
//     required this.district,
//     required this.division,
//     required this.market,
//     required this.area,
//     required this.region,
//     required this.zone,
//     required this.lat,
//     required this.long,
//     required this.v,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//     required this.territory,
//   });

//   final String id;
//   String cid;
//   String poiId;
//   String poiType;
//   String union;
//   String thana;
//   String district;
//   String division;
//   String market;
//   String area;
//   String region;
//   String zone;
//   String lat;
//   String long;
//   int v;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String createdBy;
//   String territory;

//   factory PoiDataModel.fromJson(Map<String, dynamic> json) => PoiDataModel(
//         id: json["_id"],
//         cid: json["cid"],
//         poiId: json["poiId"],
//         poiType: json["poiType"] == null ? null : json["poiType"],
//         union: json["union"],
//         thana: json["thana"],
//         district: json["district"],
//         division: json["division"],
//         market: json["market"],
//         area: json["area"],
//         region: json["region"],
//         zone: json["zone"],
//         lat: json["lat"],
//         long: json["long"],
//         v: json["__v"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         createdBy: json["createdBy"],
//         territory: json["territory"] == null ? null : json["territory"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "cid": cid,
//         "poiId": poiId,
//         "poiType": poiType == null ? null : poiType,
//         "union": union,
//         "thana": thana,
//         "district": district,
//         "division": division,
//         "market": market,
//         "area": area,
//         "region": region,
//         "zone": zone,
//         "lat": lat,
//         "long": long,
//         "__v": v,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "createdBy": createdBy,
//         "territory": territory == null ? null : territory,
//       };
// }
