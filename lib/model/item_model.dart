// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  final Posts posts;

  ItemModel({
    required this.posts,
  });

  ItemModel copyWith({
    Posts? posts,
  }) =>
      ItemModel(
        posts: posts ?? this.posts,
      );

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        posts: Posts.fromJson(json["posts"]),
      );

  Map<String, dynamic> toJson() => {
        "posts": posts.toJson(),
      };
}

class Posts {
  final dynamic currentPage;
  final List<Datum> data;
  final dynamic firstPageUrl;
  final dynamic from;
  final dynamic lastPage;
  final dynamic lastPageUrl;
  final List<Link> links;
  final dynamic nextPageUrl;
  final dynamic path;
  final dynamic perPage;
  final dynamic prevPageUrl;
  final dynamic to;
  final dynamic total;

  Posts({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  Posts copyWith({
    dynamic currentPage,
    List<Datum>? data,
    dynamic firstPageUrl,
    dynamic from,
    dynamic lastPage,
    dynamic lastPageUrl,
    List<Link>? links,
    dynamic nextPageUrl,
    dynamic path,
    dynamic perPage,
    dynamic prevPageUrl,
    dynamic to,
    dynamic total,
  }) =>
      Posts(
        currentPage: currentPage ?? this.currentPage,
        data: data ?? this.data,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        links: links ?? this.links,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  final dynamic id;
  final dynamic name;
  final dynamic desc;
  final dynamic image;
  final dynamic youtubeLink;
  final dynamic status;
  final dynamic createdAt;
  final dynamic updatedAt;

  Datum({
    required this.id,
    required this.name,
    required this.desc,
    required this.image,
    required this.youtubeLink,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  Datum copyWith({
    dynamic id,
    dynamic name,
    dynamic desc,
    dynamic image,
    dynamic youtubeLink,
    dynamic status,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      Datum(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        image: image ?? this.image,
        youtubeLink: youtubeLink ?? this.youtubeLink,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        image: json["image"],
        youtubeLink: json["youtube_link"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "image": image,
        "youtube_link": youtubeLink,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Link {
  final dynamic url;
  final dynamic label;
  final dynamic active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  Link copyWith({
    dynamic url,
    dynamic label,
    dynamic active,
  }) =>
      Link(
        url: url ?? this.url,
        label: label ?? this.label,
        active: active ?? this.active,
      );

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
