// To parse this JSON data, do
//
//     final bookingDataModel = bookingDataModelFromJson(jsonString);

import 'dart:convert';

List<BookingDataModel> bookingDataModelFromJson(String str) => List<BookingDataModel>.from(json.decode(str).map((x) => BookingDataModel.fromJson(x)));

String bookingDataModelToJson(List<BookingDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookingDataModel {
    String? refund;
    String? id;
    UserId? userId;
    TurfId? turfId;
    String? slotTime;
    String? sport;
    String? facility;
    String? slotDate;
    int? price;
    String? paymentType;
    int? v;
    DateTime? createdAt;

    BookingDataModel({
        this.refund,
        this.id,
        this.userId,
        this.turfId,
        this.slotTime,
        this.sport,
        this.facility,
        this.slotDate,
        this.price,
        this.paymentType,
        this.v,
        this.createdAt,
    });

    factory BookingDataModel.fromJson(Map<String, dynamic> json) => BookingDataModel(
        refund: json["refund"],
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        turfId: json["turfId"] == null ? null : TurfId.fromJson(json["turfId"]),
        slotTime: json["slotTime"],
        sport: json["sport"],
        facility: json["facility"],
        slotDate: json["slotDate"],
        price: json["price"],
        paymentType: json["paymentType"],
        v: json["__v"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "refund": refund,
        "_id": id,
        "userId": userId?.toJson(),
        "turfId": turfId?.toJson(),
        "slotTime": slotTime,
        "sport": sport,
        "facility": facility,
        "slotDate": slotDate,
        "price": price,
        "paymentType": paymentType,
        "__v": v,
        "created_at": createdAt?.toIso8601String(),
    };
}

class TurfId {
    String? id;
    String? vmId;
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

    TurfId({
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

    factory TurfId.fromJson(Map<String, dynamic> json) => TurfId(
        id: json["_id"],
        vmId: json["vmId"],
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
        "vmId": vmId,
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

class UserId {
    int? wallet;
    String? id;
    String? name;
    String? mobile;
    String? password;
    bool? blockStatus;
    int? v;

    UserId({
        this.wallet,
        this.id,
        this.name,
        this.mobile,
        this.password,
        this.blockStatus,
        this.v,
    });

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        wallet: json["wallet"],
        id: json["_id"],
        name: json["name"],
        mobile: json["mobile"],
        password: json["password"],
        blockStatus: json["blockStatus"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "wallet": wallet,
        "_id": id,
        "name": name,
        "mobile": mobile,
        "password": password,
        "blockStatus": blockStatus,
        "__v": v,
    };
}
