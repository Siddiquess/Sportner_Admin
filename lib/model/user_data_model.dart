// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
    List<UserData>? userDatas;

    UserDataModel({
        this.userDatas,
    });

    factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        userDatas: json["userDatas"] == null ? [] : List<UserData>.from(json["userDatas"]!.map((x) => UserData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userDatas": userDatas == null ? [] : List<dynamic>.from(userDatas!.map((x) => x.toJson())),
    };
}

class UserData {
    int? wallet;
    String? id;
    String? name;
    String? mobile;
    String? password;
    bool? blockStatus;
    int? v;
    String? email;

    UserData({
        this.wallet,
        this.id,
        this.name,
        this.mobile,
        this.password,
        this.blockStatus,
        this.v,
        this.email,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        wallet: json["wallet"],
        id: json["_id"],
        name: json["name"],
        mobile: json["mobile"],
        password: json["password"],
        blockStatus: json["blockStatus"],
        v: json["__v"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "wallet": wallet,
        "_id": id,
        "name": name,
        "mobile": mobile,
        "password": password,
        "blockStatus": blockStatus,
        "__v": v,
        "email": email,
    };
}
