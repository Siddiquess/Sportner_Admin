// To parse this JSON data, do
//
//     final venueDataModel = venueDataModelFromJson(jsonString);

import 'dart:convert';

VenueDataModel venueDataModelFromJson(String str) => VenueDataModel.fromJson(json.decode(str));

String venueDataModelToJson(VenueDataModel data) => json.encode(data.toJson());

class VenueDataModel {
    List<Response>? response;

    VenueDataModel({
        this.response,
    });

    factory VenueDataModel.fromJson(Map<String, dynamic> json) => VenueDataModel(
        response: json["response"] == null ? [] : List<Response>.from(json["response"]!.map((x) => Response.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x.toJson())),
    };
}

class Response {
    String? id;
    VmId? vmId;
    String? venueName;
    int? mobile;
    String? district;
    String? place;
    int? actualPrice;
    int? discountPercentage;
    String? description;
    String? image;
    String? document;
    List<Slot>? slots;
    List<SportFacility>? sportFacility;
    double? lat;
    double? lng;
    bool? isBlocked;
    bool? vmIsBlocked;
    bool? approved;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Response({
        this.id,
        this.vmId,
        this.venueName,
        this.mobile,
        this.district,
        this.place,
        this.actualPrice,
        this.discountPercentage,
        this.description,
        this.image,
        this.document,
        this.slots,
        this.sportFacility,
        this.lat,
        this.lng,
        this.isBlocked,
        this.vmIsBlocked,
        this.approved,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["_id"],
        vmId: json["vmId"] == null ? null : VmId.fromJson(json["vmId"]),
        venueName: json["venueName"],
        mobile: json["mobile"],
        district: json["district"],
        place: json["place"],
        actualPrice: json["actualPrice"],
        discountPercentage: json["discountPercentage"],
        description: json["description"],
        image: json["image"],
        document: json["document"],
        slots: json["slots"] == null ? [] : List<Slot>.from(json["slots"]!.map((x) => Slot.fromJson(x))),
        sportFacility: json["sportFacility"] == null ? [] : List<SportFacility>.from(json["sportFacility"]!.map((x) => SportFacility.fromJson(x))),
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        isBlocked: json["isBlocked"],
        vmIsBlocked: json["vmIsBlocked"],
        approved: json["approved"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "vmId": vmId?.toJson(),
        "venueName": venueName,
        "mobile": mobile,
        "district": district,
        "place": place,
        "actualPrice": actualPrice,
        "discountPercentage": discountPercentage,
        "description": description,
        "image": image,
        "document": document,
        "slots": slots == null ? [] : List<dynamic>.from(slots!.map((x) => x.toJson())),
        "sportFacility": sportFacility == null ? [] : List<dynamic>.from(sportFacility!.map((x) => x.toJson())),
        "lat": lat,
        "lng": lng,
        "isBlocked": isBlocked,
        "vmIsBlocked": vmIsBlocked,
        "approved": approved,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Slot {
    String? day;
    List<String>? slots;

    Slot({
        this.day,
        this.slots,
    });

    factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        day: json["day"],
        slots: json["slots"] == null ? [] : List<String>.from(json["slots"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "slots": slots == null ? [] : List<dynamic>.from(slots!.map((x) => x)),
    };
}

class SportFacility {
    String? sportId;
    String? sport;
    String? facility;
    String? id;

    SportFacility({
        this.sportId,
        this.sport,
        this.facility,
        this.id,
    });

    factory SportFacility.fromJson(Map<String, dynamic> json) => SportFacility(
        sportId: json["sportId"],
        sport: json["sport"],
        facility: json["facility"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "sportId": sportId,
        "sport": sport,
        "facility": facility,
        "_id": id,
    };
}

class VmId {
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

    VmId({
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

    factory VmId.fromJson(Map<String, dynamic> json) => VmId(
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
