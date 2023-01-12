import 'dart:convert';

Clip? clipFromJson(String str) => Clip.fromJson(json.decode(str));

String clipToJson(Clip? data) => json.encode(data!.toJson());

class Clip {
  Clip({
    this.clipId,
    this.clipName,
    this.clipUrl,
    this.clipThumb,
    this.marGroup,
    this.clipDate,
    this.clipTitle,
  });

  int? clipId;
  String? clipName;
  String? clipUrl;
  String? clipThumb;
  String? marGroup;
  DateTime? clipDate;
  String? clipTitle;

  factory Clip.fromJson(Map<String, dynamic> json) => Clip(
        clipId: json["clipId"],
        clipName: json["clipName"],
        clipUrl: json["clipURL"],
        clipThumb: json["clipThumb"],
        marGroup: json["marGroup"],
        clipDate: DateTime.parse(json["clipDate"]),
        clipTitle: json["clipTitle"],
      );

  Map<String, dynamic> toJson() => {
        "clipId": clipId,
        "clipName": clipName,
        "clipURL": clipUrl,
        "clipThumb": clipThumb,
        "marGroup": marGroup,
        "clipDate": clipDate?.toIso8601String(),
        "clipTitle": clipTitle,
      };
}
