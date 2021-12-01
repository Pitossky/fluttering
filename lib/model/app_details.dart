class AppDetails {
  late String name;
  late int runtime;
  MyImage? image;
  late String summary;
  Embedded? eEmbedded;

  AppDetails(
      {required this.name,
      required this.runtime,
      required this.image,
      required this.summary,
      required this.eEmbedded});

  AppDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    runtime = json['runtime'];
    image = json['image'] != null ? MyImage.fromJson(json['image']) : null;
    summary = json['summary'];
    eEmbedded =
        json['_embedded'] != null ? Embedded.fromJson(json['_embedded']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['runtime'] = runtime;
    data['image'] = image!.toJson();
    data['summary'] = summary;
    if (eEmbedded != null) {
      data['_embedded'] = eEmbedded!.toJson();
    }
    return data;
  }
}

class MyImage {
  late String medium;
  late String original;

  MyImage({required this.medium, required this.original});

  MyImage.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medium'] = medium;
    data['original'] = original;
    return data;
  }
}

class Embedded {
  late List<Episodes> episodes;

  Embedded({ required this.episodes});

  Embedded.fromJson(Map<String, dynamic> json) {
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes.add(Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['episodes'] = episodes.map((v) => v.toJson()).toList();
    return data;
  }
}

class Episodes {
  int? id;
  String? url;
  late String name;
  int? season;
  int? number;
  String? airDate;
  String? airTime;
  String? airStamp;
  int? runTime;
  MyImage? image;
  String? summary;

  Episodes({
    required this.id,
    required this.url,
    required this.name,
    required this.season,
    required this.number,
    required this.airDate,
    required this.airTime,
    required this.airStamp,
    required this.runTime,
    required this.image,
    required this.summary,
  });

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    season = json['season'];
    number = json['number'];
    airDate = json['airdate'];
    airTime = json['airtime'];
    airStamp = json['airstamp'];
    runTime = json['runtime'];
    image = json['image'] != null ? MyImage.fromJson(json['image']) : null;
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['name'] = name;
    data['season'] = season;
    data['number'] = number;
    data['airdate'] = airDate;
    data['airtime'] = airTime;
    data['airstamp'] = airStamp;
    data['runtime'] = runTime;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['summary'] = summary;
    return data;
  }
}
