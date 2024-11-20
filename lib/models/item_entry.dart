// To parse this JSON data, do
//
//     final itemEntry = itemEntryFromJson(jsonString);

import 'dart:convert';

List<ItemEntry> itemEntryFromJson(String str) => List<ItemEntry>.from(json.decode(str).map((x) => ItemEntry.fromJson(x)));

String itemEntryToJson(List<ItemEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemEntry {
    String model;
    String pk;
    Fields fields;

    ItemEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory ItemEntry.fromJson(Map<String, dynamic> json) => ItemEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    String description;
    int price;
    int user;

    Fields({
        required this.name,
        required this.description,
        required this.price,
        required this.user,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
        "user": user,
    };
}
