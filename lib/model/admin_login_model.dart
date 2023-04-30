// To parse this JSON data, do
//
//     final adminLoginModel = adminLoginModelFromJson(jsonString);

import 'dart:convert';

AdminLoginModel adminLoginModelFromJson(String str) => AdminLoginModel.fromJson(json.decode(str));

String adminLoginModelToJson(AdminLoginModel data) => json.encode(data.toJson());

class AdminLoginModel {
    AdminLoginModel({
        this.name,
        this.password,
        this.accessToken,
    });

    String? name;
    String? password;
    String? accessToken;

    factory AdminLoginModel.fromJson(Map<String, dynamic> json) => AdminLoginModel(
        name: json["name"],
        password: json["password"],
        accessToken: json["accessToken"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
    };
}
