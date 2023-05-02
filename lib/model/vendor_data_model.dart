// To parse this JSON data, do
//
//     final vendorDataModel = vendorDataModelFromJson(jsonString);

import 'dart:convert';

VendorDataModel vendorDataModelFromJson(String str) => VendorDataModel.fromJson(json.decode(str));

String vendorDataModelToJson(VendorDataModel data) => json.encode(data.toJson());

class VendorDataModel {
    List<VmsData>? vmsDatas;

    VendorDataModel({
        this.vmsDatas,
    });

    factory VendorDataModel.fromJson(Map<String, dynamic> json) => VendorDataModel(
        vmsDatas: json["vmsDatas"] == null ? [] : List<VmsData>.from(json["vmsDatas"]!.map((x) => VmsData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "vmsDatas": vmsDatas == null ? [] : List<dynamic>.from(vmsDatas!.map((x) => x.toJson())),
    };
}

class VmsData {
    String? id;
    String? name;
    String? mobile;
    String? password;
    String? image;
    String? status;
    String? reason;
    bool? blockStatus;
    bool? rejectUpdate;
    int? v;

    VmsData({
        this.id,
        this.name,
        this.mobile,
        this.password,
        this.image,
        this.status,
        this.reason,
        this.blockStatus,
        this.rejectUpdate,
        this.v,
    });

    factory VmsData.fromJson(Map<String, dynamic> json) => VmsData(
        id: json["_id"],
        name: json["name"],
        mobile: json["mobile"],
        password: json["password"],
        image: json["image"],
        status: json["status"],
        reason: json["reason"],
        blockStatus: json["blockStatus"],
        rejectUpdate: json["rejectUpdate"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "mobile": mobile,
        "password": password,
        "image": image,
        "status": status,
        "reason": reason,
        "blockStatus": blockStatus,
        "rejectUpdate": rejectUpdate,
        "__v": v,
    };
}

VendorStatusModel vendorStatusModelFromJson(String str) => VendorStatusModel.fromJson(json.decode(str));

String vendorStatusModelToJson(VendorStatusModel data) => json.encode(data.toJson());

class VendorStatusModel {
    String? vmId;
    String? status;
    String? reason;

    VendorStatusModel({
        this.vmId,
        this.status,
        this.reason,
    });

    factory VendorStatusModel.fromJson(Map<String, dynamic> json) => VendorStatusModel(
        vmId: json["vmId"],
        status: json["status"],
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "vmId": vmId,
        "status": status,
        "reason": reason,
    };
}

