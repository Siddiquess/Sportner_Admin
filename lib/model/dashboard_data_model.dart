// To parse this JSON data, do
//
//     final dashBoardDataModel = dashBoardDataModelFromJson(jsonString);

import 'dart:convert';

DashBoardDataModel dashBoardDataModelFromJson(String str) => DashBoardDataModel.fromJson(json.decode(str));

String dashBoardDataModelToJson(DashBoardDataModel data) => json.encode(data.toJson());

class DashBoardDataModel {
    DashBoardDataModel({
        this.bookingsCount,
        this.usersCount,
        this.vmsCount,
        this.turfsCount,
        this.sportsCount,
        this.pendingTurfs,
    });

    int? bookingsCount;
    int? usersCount;
    int? vmsCount;
    int? turfsCount;
    int? sportsCount;
    List<dynamic>? pendingTurfs;

    factory DashBoardDataModel.fromJson(Map<String, dynamic> json) => DashBoardDataModel(
        bookingsCount: json["bookingsCount"],
        usersCount: json["usersCount"],
        vmsCount: json["vmsCount"],
        turfsCount: json["turfsCount"],
        sportsCount: json["sportsCount"],
        pendingTurfs: json["pendingTurfs"] == null ? [] : List<dynamic>.from(json["pendingTurfs"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "bookingsCount": bookingsCount,
        "usersCount": usersCount,
        "vmsCount": vmsCount,
        "turfsCount": turfsCount,
        "sportsCount": sportsCount,
        "pendingTurfs": pendingTurfs == null ? [] : List<dynamic>.from(pendingTurfs!.map((x) => x)),
    };
}
