// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UsersAPIModel {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;
  UsersAPIModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  // UsersAPIModel(
  //     {this.id,
  //     this.name,
  //     this.username,
  //     this.email,
  //     this.address,
  //     this.phone,
  //     this.website,
  //     this.company});

  // UsersAPIModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   username = json['username'];
  //   email = json['email'];
  //   address =
  //       json['address'] != null ? new Address.fromJson(json['address']) : null;
  //   phone = json['phone'];
  //   website = json['website'];
  //   company =
  //       json['company'] != null ? new Company.fromJson(json['company']) : null;
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['username'] = this.username;
  //   data['email'] = this.email;
  //   if (this.address != null) {
  //     data['address'] = this.address!.toJson();
  //   }
  //   data['phone'] = this.phone;
  //   data['website'] = this.website;
  //   if (this.company != null) {
  //     data['company'] = this.company!.toJson();
  //   }
  //   return data;
  // }

  UsersAPIModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) {
    return UsersAPIModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address?.toMap(),
      'phone': phone,
      'website': website,
      'company': company?.toMap(),
    };
  }

  factory UsersAPIModel.fromMap(Map<String, dynamic> map) {
    return UsersAPIModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      address: map['address'] != null
          ? Address.fromMap(map['address'] as Map<String, dynamic>)
          : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      website: map['website'] != null ? map['website'] as String : null,
      company: map['company'] != null
          ? Company.fromMap(map['company'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsersAPIModel.fromJson(String source) =>
      UsersAPIModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UsersAPIModel(id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company)';
  }

  @override
  bool operator ==(covariant UsersAPIModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.username == username &&
        other.email == email &&
        other.address == address &&
        other.phone == phone &&
        other.website == website &&
        other.company == company;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        username.hashCode ^
        email.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        website.hashCode ^
        company.hashCode;
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  // Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  // Address.fromJson(Map<String, dynamic> json) {
  //   street = json['street'];
  //   suite = json['suite'];
  //   city = json['city'];
  //   zipcode = json['zipcode'];
  //   geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['street'] = this.street;
  //   data['suite'] = this.suite;
  //   data['city'] = this.city;
  //   data['zipcode'] = this.zipcode;
  //   if (this.geo != null) {
  //     data['geo'] = this.geo!.toJson();
  //   }
  //   return data;
  // }

  Address copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo,
  }) {
    return Address(
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      geo: geo ?? this.geo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo?.toMap(),
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] != null ? map['street'] as String : null,
      suite: map['suite'] != null ? map['suite'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      zipcode: map['zipcode'] != null ? map['zipcode'] as String : null,
      geo: map['geo'] != null
          ? Geo.fromMap(map['geo'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;

    return other.street == street &&
        other.suite == suite &&
        other.city == city &&
        other.zipcode == zipcode &&
        other.geo == geo;
  }

  @override
  int get hashCode {
    return street.hashCode ^
        suite.hashCode ^
        city.hashCode ^
        zipcode.hashCode ^
        geo.hashCode;
  }
}

class Geo {
  String? lat;
  String? lng;
  Geo({
    this.lat,
    this.lng,
  });

  // Geo({this.lat, this.lng});

  // Geo.fromJson(Map<String, dynamic> json) {
  //   lat = json['lat'];
  //   lng = json['lng'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['lat'] = this.lat;
  //   data['lng'] = this.lng;
  //   return data;
  // }

  Geo copyWith({
    String? lat,
    String? lng,
  }) {
    return Geo(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
    };
  }

  factory Geo.fromMap(Map<String, dynamic> map) {
    return Geo(
      lat: map['lat'] != null ? map['lat'] as String : null,
      lng: map['lng'] != null ? map['lng'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Geo.fromJson(String source) =>
      Geo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Geo(lat: $lat, lng: $lng)';

  @override
  bool operator ==(covariant Geo other) {
    if (identical(this, other)) return true;

    return other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  // Company({this.name, this.catchPhrase, this.bs});

  // Company.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   catchPhrase = json['catchPhrase'];
  //   bs = json['bs'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['catchPhrase'] = this.catchPhrase;
  //   data['bs'] = this.bs;
  //   return data;
  // }

  Company copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) {
    return Company(
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'] != null ? map['name'] as String : null,
      catchPhrase:
          map['catchPhrase'] != null ? map['catchPhrase'] as String : null,
      bs: map['bs'] != null ? map['bs'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';

  @override
  bool operator ==(covariant Company other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.catchPhrase == catchPhrase &&
        other.bs == bs;
  }

  @override
  int get hashCode => name.hashCode ^ catchPhrase.hashCode ^ bs.hashCode;
}
