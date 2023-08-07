import 'dart:convert';

OverallData overallDataFromJson(String str) =>
    OverallData.fromJson(json.decode(str));

String overallDataToJson(OverallData data) => json.encode(data.toJson());

class OverallData {
  String? object;
  List<Result>? results;
  String? nextCursor;
  bool? hasMore;
  ObjectEnum? type;
  Block? block;

  OverallData({
    this.object,
    this.results,
    this.nextCursor,
    this.hasMore,
    this.type,
    this.block,
  });

  factory OverallData.fromJson(Map<String, dynamic> json) => OverallData(
        object: json["object"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        nextCursor: json["next_cursor"],
        hasMore: json["has_more"],
        type: objectEnumValues.map[json["type"]],
        block: json["block"] == null ? null : Block.fromJson(json["block"]),
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "next_cursor": nextCursor,
        "has_more": hasMore,
        "type": objectEnumValues.reverse[type],
        "block": block?.toJson(),
      };
}

class Block {
  Block();

  factory Block.fromJson(Map<String, dynamic> json) => Block();

  Map<String, dynamic> toJson() => {};
}

class Result {
  ObjectEnum? object;
  String? id;
  Parent? parent;
  DateTime? createdTime;
  DateTime? lastEditedTime;
  TedBy? createdBy;
  TedBy? lastEditedBy;
  bool? hasChildren;
  bool? archived;
  PurpleType? type;
  Paragraph? paragraph;
  Image? image;

  Result({
    this.object,
    this.id,
    this.parent,
    this.createdTime,
    this.lastEditedTime,
    this.createdBy,
    this.lastEditedBy,
    this.hasChildren,
    this.archived,
    this.type,
    this.paragraph,
    this.image,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        object: objectEnumValues.map[json["object"]]!,
        id: json["id"],
        parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
        createdTime: json["created_time"] == null
            ? null
            : DateTime.parse(json["created_time"]),
        lastEditedTime: json["last_edited_time"] == null
            ? null
            : DateTime.parse(json["last_edited_time"]),
        createdBy: json["created_by"] == null
            ? null
            : TedBy.fromJson(json["created_by"]),
        lastEditedBy: json["last_edited_by"] == null
            ? null
            : TedBy.fromJson(json["last_edited_by"]),
        hasChildren: json["has_children"],
        archived: json["archived"],
        type: purpleTypeValues.map[json["type"]]!,
        paragraph: json["paragraph"] == null
            ? null
            : Paragraph.fromJson(json["paragraph"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "object": objectEnumValues.reverse[object],
        "id": id,
        "parent": parent?.toJson(),
        "created_time": createdTime?.toIso8601String(),
        "last_edited_time": lastEditedTime?.toIso8601String(),
        "created_by": createdBy?.toJson(),
        "last_edited_by": lastEditedBy?.toJson(),
        "has_children": hasChildren,
        "archived": archived,
        "type": purpleTypeValues.reverse[type],
        "paragraph": paragraph?.toJson(),
        "image": image?.toJson(),
      };
}

class TedBy {
  Object? object;
  String? id;

  TedBy({
    this.object,
    this.id,
  });

  factory TedBy.fromJson(Map<String, dynamic> json) => TedBy(
        object: objectValues.map[json["object"]]!,
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "object": objectValues.reverse[object],
        "id": id,
      };
}

enum Object { USER }

final objectValues = EnumValues({"user": Object.USER});

class Image {
  List<dynamic>? caption;
  String? type;
  FileClass? file;

  Image({
    this.caption,
    this.type,
    this.file,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        caption: json["caption"] == null
            ? []
            : List<dynamic>.from(json["caption"]!.map((x) => x)),
        type: json["type"],
        file: json["file"] == null ? null : FileClass.fromJson(json["file"]),
      );

  Map<String, dynamic> toJson() => {
        "caption":
            caption == null ? [] : List<dynamic>.from(caption!.map((x) => x)),
        "type": type,
        "file": file?.toJson(),
      };
}

class FileClass {
  String? url;
  DateTime? expiryTime;

  FileClass({
    this.url,
    this.expiryTime,
  });

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        url: json["url"],
        expiryTime: json["expiry_time"] == null
            ? null
            : DateTime.parse(json["expiry_time"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "expiry_time": expiryTime?.toIso8601String(),
      };
}

enum ObjectEnum { BLOCK }

final objectEnumValues = EnumValues({"block": ObjectEnum.BLOCK});

class Paragraph {
  List<RichText>? richText;
  String? color;

  Paragraph({
    this.richText,
    this.color,
  });

  factory Paragraph.fromJson(Map<String, dynamic> json) => Paragraph(
        richText: json["rich_text"] == null
            ? []
            : List<RichText>.from(
                json["rich_text"]!.map((x) => RichText.fromJson(x))),
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "rich_text": richText == null
            ? []
            : List<dynamic>.from(richText!.map((x) => x.toJson())),
        "color": color,
      };
}

class RichText {
  String? type;
  Text? text;
  Annotations? annotations;
  String? plainText;
  dynamic href;

  RichText({
    this.type,
    this.text,
    this.annotations,
    this.plainText,
    this.href,
  });

  factory RichText.fromJson(Map<String, dynamic> json) => RichText(
        type: json["type"],
        text: json["text"] == null ? null : Text.fromJson(json["text"]),
        annotations: json["annotations"] == null
            ? null
            : Annotations.fromJson(json["annotations"]),
        plainText: json["plain_text"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "text": text?.toJson(),
        "annotations": annotations?.toJson(),
        "plain_text": plainText,
        "href": href,
      };
}

class Annotations {
  bool? bold;
  bool? italic;
  bool? strikethrough;
  bool? underline;
  bool? code;
  String? color;

  Annotations({
    this.bold,
    this.italic,
    this.strikethrough,
    this.underline,
    this.code,
    this.color,
  });

  factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
        bold: json["bold"],
        italic: json["italic"],
        strikethrough: json["strikethrough"],
        underline: json["underline"],
        code: json["code"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "bold": bold,
        "italic": italic,
        "strikethrough": strikethrough,
        "underline": underline,
        "code": code,
        "color": color,
      };
}

class Text {
  String? content;
  dynamic link;

  Text({
    this.content,
    this.link,
  });

  factory Text.fromJson(Map<String, dynamic> json) => Text(
        content: json["content"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "link": link,
      };
}

class Parent {
  ParentType? type;
  String? pageId;

  Parent({
    this.type,
    this.pageId,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        type: parentTypeValues.map[json["type"]]!,
        pageId: json["page_id"],
      );

  Map<String, dynamic> toJson() => {
        "type": parentTypeValues.reverse[type],
        "page_id": pageId,
      };
}

enum ParentType { PAGE_ID }

final parentTypeValues = EnumValues({"page_id": ParentType.PAGE_ID});

enum PurpleType { IMAGE, PARAGRAPH }

final purpleTypeValues =
    EnumValues({"image": PurpleType.IMAGE, "paragraph": PurpleType.PARAGRAPH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
