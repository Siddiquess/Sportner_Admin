// To parse this JSON data, do
//
//     final sportsDataModel = sportsDataModelFromJson(jsonString);

import 'dart:convert';

SportsDataModel sportsDataModelFromJson(String str) =>
    SportsDataModel.fromJson(json.decode(str));

String sportsDataModelToJson(SportsDataModel data) =>
    json.encode(data.toJson());

String sportsStatusModelToJson(SportStatusModel data) =>
    json.encode(data.toJson());

class SportsDataModel {
  List<SportsData>? sportsDatas;

  SportsDataModel({
    this.sportsDatas,
  });

  factory SportsDataModel.fromJson(Map<String, dynamic> json) =>
      SportsDataModel(
        sportsDatas: json["sportsDatas"] == null
            ? []
            : List<SportsData>.from(
                json["sportsDatas"]!.map((x) => SportsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sportsDatas": sportsDatas == null
            ? []
            : List<dynamic>.from(sportsDatas!.map((x) => x.toJson())),
      };
}

class SportsData {
  String? id;
  String? sport;
  List<FacilityDetail>? facilityDetails;

  SportsData({
    this.id,
    this.sport,
    this.facilityDetails,
  });

  factory SportsData.fromJson(Map<String, dynamic> json) => SportsData(
        id: json["_id"],
        sport: json["sport"],
        facilityDetails: json["facilityDetails"] == null
            ? []
            : List<FacilityDetail>.from(json["facilityDetails"]!
                .map((x) => FacilityDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sport": sport,
        "facilityDetails": facilityDetails == null
            ? []
            : List<dynamic>.from(facilityDetails!.map((x) => x.toJson())),
      };
}

class FacilityDetail {
  String? id;
  String? facility;
  int? count;
  bool? status;

  FacilityDetail({
    this.id,
    this.facility,
    this.count,
    this.status,
  });

  factory FacilityDetail.fromJson(Map<String, dynamic> json) => FacilityDetail(
        id: json["_id"],
        facility: json["facility"],
        count: json["count"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "facility": facility,
        "count": count,
        "status": status,
      };
}

class SportStatusModel {
  String? id;
  String? facility;
  bool? status;

  SportStatusModel({
    this.id,
    this.facility,
    this.status,
  });

  factory SportStatusModel.fromJson(Map<String, dynamic> json) =>
      SportStatusModel(
        id: json["_id"],
        facility: json["facility"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "facility": facility,
        "status": status.toString(),
      };
}
