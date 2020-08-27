import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<DocBody>> fetchData(http.Client client) async {
  final id = "cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0";
  final response = await client.get('http://api.unsplash.com/photos/?client_id=$id');
  return compute(parseData, response.body);
}

List<DocBody> parseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<DocBody>((json) => DocBody.fromJson(json)).toList();
}

class DocBody {
  Urls urls;
  Sponsorship sponsorship;
  Sponsor user;

  DocBody({this.urls, this.sponsorship,});

  DocBody.fromJson(Map<String, dynamic> json) {
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    sponsorship = json['sponsorship'] != null
        ? new Sponsorship.fromJson(json['sponsorship'])
        : null;
    user = json['user'] != null ? new Sponsor.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.urls != null) {
      data['urls'] = this.urls.toJson();
    }
    if (this.sponsorship != null) {
      data['sponsorship'] = this.sponsorship.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  Urls({this.raw, this.full, this.regular, this.small, this.thumb});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['full'] = this.full;
    data['regular'] = this.regular;
    data['small'] = this.small;
    data['thumb'] = this.thumb;
    return data;
  }
}

class Sponsorship {
  Sponsor sponsor;

  Sponsorship({this.sponsor});

  Sponsorship.fromJson(Map<String, dynamic> json) {
    sponsor = json['sponsor'] != null ? new Sponsor.fromJson(json['sponsor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sponsor != null) {
      data['sponsor'] = this.sponsor.toJson();
    }
    return data;
  }
}

class Sponsor {

  String username;
  ProfileImage profileImage;

  Sponsor({this.username, this.profileImage});

  Sponsor.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    profileImage = json['profile_image'] != null
        ? new ProfileImage.fromJson(json['profile_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    if (this.profileImage != null) {
      data['profile_image'] = this.profileImage.toJson();
    }
    return data;
  }
}

class ProfileImage {
  String small;
  String medium;
  String large;

  ProfileImage({this.small, this.medium, this.large});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['large'] = this.large;
    return data;
  }
}