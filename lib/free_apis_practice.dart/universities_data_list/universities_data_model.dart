// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UniversitiesDataModel {
  List<String>? webPages;
  String? alphaTwoCode;
  List<String>? domains;
  String? name;
  Null? stateProvince;
  String? country;
  UniversitiesDataModel({
    this.webPages,
    this.alphaTwoCode,
    this.domains,
    this.name,
    this.stateProvince,
    this.country,
  });

  // UniversitiesDataModel(
  //     {this.webPages,
  //     this.alphaTwoCode,
  //     this.domains,
  //     this.name,
  //     this.stateProvince,
  //     this.country});

  // UniversitiesDataModel.fromJson(Map<String, dynamic> json) {
  //   webPages = json['web_pages'].cast<String>();
  //   alphaTwoCode = json['alpha_two_code'];
  //   domains = json['domains'].cast<String>();
  //   name = json['name'];
  //   stateProvince = json['state-province'];
  //   country = json['country'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['web_pages'] = this.webPages;
  //   data['alpha_two_code'] = this.alphaTwoCode;
  //   data['domains'] = this.domains;
  //   data['name'] = this.name;
  //   data['state-province'] = this.stateProvince;
  //   data['country'] = this.country;
  //   return data;
  // }

  UniversitiesDataModel copyWith({
    List<String>? webPages,
    String? alphaTwoCode,
    List<String>? domains,
    String? name,
    Null? stateProvince,
    String? country,
  }) {
    return UniversitiesDataModel(
      webPages: webPages ?? this.webPages,
      alphaTwoCode: alphaTwoCode ?? this.alphaTwoCode,
      domains: domains ?? this.domains,
      name: name ?? this.name,
      stateProvince: stateProvince ?? this.stateProvince,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'webPages': webPages,
      'alphaTwoCode': alphaTwoCode,
      'domains': domains,
      'name': name,
      'stateProvince': stateProvince?.toMap,
      'country': country,
    };
  }

//   factory UniversitiesDataModel.fromMap(Map<String, dynamic> map) {
//     return UniversitiesDataModel(
//       webPages: map['webPages'] != null ? List<String>.from(map['webPages']) : null,
//       alphaTwoCode: map['alphaTwoCode'],
//       domains: map['domains'] != null ? List<String>.from(map['domains']) : null,
//       name: map['name'],
//       stateProvince: map['stateProvince'],
//       country: map['country'],
//     );
//   }
// }

  factory UniversitiesDataModel.fromMap(Map<String, dynamic> map) {
    return UniversitiesDataModel(
      webPages: map['webPages'] != null
          ? List<String>.from((map['webPages'] as List<String>))
          : null,
      alphaTwoCode:
          map['alphaTwoCode'] != null ? map['alphaTwoCode'] as String : null,
      domains: map['domains'] != null
          ? List<String>.from((map['domains'] as List<String>))
          : null,
      name: map['name'] != null ? map['name'] as String : null,
      stateProvince: map['stateProvince'] != null ? map['stateProvince'] : null,
      country: map['country'] != null ? map['country'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UniversitiesDataModel.fromJson(String source) =>
      UniversitiesDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UniversitiesDataModel(webPages: $webPages, alphaTwoCode: $alphaTwoCode, domains: $domains, name: $name, stateProvince: $stateProvince, country: $country)';
  }

  @override
  bool operator ==(covariant UniversitiesDataModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.webPages, webPages) &&
        other.alphaTwoCode == alphaTwoCode &&
        listEquals(other.domains, domains) &&
        other.name == name &&
        other.stateProvince == stateProvince &&
        other.country == country;
  }

  @override
  int get hashCode {
    return webPages.hashCode ^
        alphaTwoCode.hashCode ^
        domains.hashCode ^
        name.hashCode ^
        stateProvince.hashCode ^
        country.hashCode;
  }
}
