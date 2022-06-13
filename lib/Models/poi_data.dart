// class PoiDataModel {
//   String? sId;
//   String? cid;
//   String? poiId;
//   String? poiType;
//   String? union;
//   String? thana;
//   String? district;
//   String? division;
//   String? market;
//   String? territory;
//   String? area;
//   String? region;
//   String? zone;
//   String? lat;
//   String? long;
//   int? iV;
//   String? createdAt;
//   String? updatedAt;
//   String? createdBy;

//   PoiDataModel(
//       {this.sId,
//       this.cid,
//       this.poiId,
//       this.poiType,
//       this.union,
//       this.thana,
//       this.district,
//       this.division,
//       this.market,
//       this.territory,
//       this.area,
//       this.region,
//       this.zone,
//       this.lat,
//       this.long,
//       this.iV,
//       this.createdAt,
//       this.updatedAt,
//       this.createdBy});

//   PoiDataModel.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     cid = json['cid'];
//     poiId = json['poiId'];
//     poiType = json['poiType'];
//     union = json['union'];
//     thana = json['thana'];
//     district = json['district'];
//     division = json['division'];
//     market = json['market'];
//     territory = json['territory'];
//     area = json['area'];
//     region = json['region'];
//     zone = json['zone'];
//     lat = json['lat'];
//     long = json['long'];
//     iV = json['__v'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     createdBy = json['createdBy'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['cid'] = this.cid;
//     data['poiId'] = this.poiId;
//     data['poiType'] = this.poiType;
//     data['union'] = this.union;
//     data['thana'] = this.thana;
//     data['district'] = this.district;
//     data['division'] = this.division;
//     data['market'] = this.market;
//     data['territory'] = this.territory;
//     data['area'] = this.area;
//     data['region'] = this.region;
//     data['zone'] = this.zone;
//     data['lat'] = this.lat;
//     data['long'] = this.long;
//     data['__v'] = this.iV;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['createdBy'] = this.createdBy;
//     return data;
//   }
// }
// To parse this JSON data, do
//
//     final poiDataModel = poiDataModelFromJson(jsonString);
import 'dart:convert';

List<PoiDataModel> poiDataModelFromJson(String str) => List<PoiDataModel>.from(
    json.decode(str).map((x) => PoiDataModel.fromJson(x)));

String poiDataModelToJson(List<PoiDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PoiDataModel {
  PoiDataModel({
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

  factory PoiDataModel.fromJson(Map<String, dynamic> json) => PoiDataModel(
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
