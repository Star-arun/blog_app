// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

class Temperatures {
    dynamic object;
    List<Result>? results;
    dynamic nextCursor;
    dynamic hasMore;
    ObjectEnum? type;
    Block? block;

    Temperatures({
        this.object,
        this.results,
        this.nextCursor,
        this.hasMore,
        this.type,
        this.block,
    });

    factory Temperatures.fromRawJson(String str) => Temperatures.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Temperatures.fromJson(Map<String, dynamic> json) => Temperatures(
        object: json["object"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextCursor: json["next_cursor"],
        hasMore: json["has_more"],
        type: objectEnumValues.map[json["type"]],
        block: Block.fromJson(json["block"]),
    );

    Map<String, dynamic> toJson() => {
        "object": object,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "next_cursor": nextCursor,
        "has_more": hasMore,
        "type": objectEnumValues.reverse[type],
        "block": block!.toJson(),
    };
}

class Block {
    Block();

    factory Block.fromRawJson(String str) => Block.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Block.fromJson(Map<String, dynamic> json) => Block(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Result {
    ObjectEnum? object;
    dynamic id;
    Parent? parent;
    DateTime? createdTime;
    DateTime? lastEditedTime;
    TedBy? createdBy;
    TedBy? lastEditedBy;
    dynamic hasChildren;
    dynamic archived;
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

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        object: objectEnumValues.map[json["object"]],
        id: json["id"],
        parent: Parent.fromJson(json["parent"]),
        createdTime: DateTime.parse(json["created_time"]),
        lastEditedTime: DateTime.parse(json["last_edited_time"]),
        createdBy: TedBy.fromJson(json["created_by"]),
        lastEditedBy: TedBy.fromJson(json["last_edited_by"]),
        hasChildren: json["has_children"],
        archived: json["archived"],
        type: purpleTypeValues.map[json["type"]],
        paragraph: Paragraph.fromJson(json["paragraph"]),
        image: Image.fromJson(json["image"]),
    );

    Map<String, dynamic> toJson() => {
        "object": objectEnumValues.reverse[object],
        "id": id,
        "parent": parent!.toJson(),
        "created_time": createdTime!.toIso8601String(),
        "last_edited_time": lastEditedTime!.toIso8601String(),
        "created_by": createdBy!.toJson(),
        "last_edited_by": lastEditedBy!.toJson(),
        "has_children": hasChildren,
        "archived": archived,
        "type": purpleTypeValues.reverse[type],
        "paragraph": paragraph!.toJson(),
        "image": image!.toJson(),
    };
}

class TedBy {
    Object? object;
    dynamic id;

    TedBy({
        this.object,
        this.id,
    });

    factory TedBy.fromRawJson(String str) => TedBy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TedBy.fromJson(Map<String, dynamic> json) => TedBy(
        object: objectValues.map[json["object"]],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "object": objectValues.reverse[object],
        "id": id,
    };
}

enum Object {
    USER
}

final objectValues = EnumValues({
    "user": Object.USER
});

class Image {
    List<dynamic>? caption;
    dynamic type;
    FileClass? file;

    Image({
        this.caption,
        this.type,
        this.file,
    });

    factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        caption: List<dynamic>.from(json["caption"].map((x) => x)),
        type: json["type"],
        file: FileClass.fromJson(json["file"]),
    );

    Map<String, dynamic> toJson() => {
        "caption": List<dynamic>.from(caption!.map((x) => x)),
        "type": type,
        "file": file!.toJson(),
    };
}

class FileClass {
    dynamic url;
    DateTime? expiryTime;

    FileClass({
        this.url,
        this.expiryTime,
    });

    factory FileClass.fromRawJson(String str) => FileClass.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        url: json["url"],
        expiryTime: DateTime.parse(json["expiry_time"]),
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "expiry_time": expiryTime!.toIso8601String(),
    };
}

enum ObjectEnum {
    BLOCK
}

final objectEnumValues = EnumValues({
    "block": ObjectEnum.BLOCK
});

class Paragraph {
    List<RichText>? richText;
    Color? color;

    Paragraph({
        this.richText,
        this.color,
    });

    factory Paragraph.fromRawJson(String str) => Paragraph.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Paragraph.fromJson(Map<String, dynamic> json) => Paragraph(
        richText: List<RichText>.from(json["rich_text"].map((x) => RichText.fromJson(x))),
        color: colorValues.map[json["color"]],
    );

    Map<String, dynamic> toJson() => {
        "rich_text": List<dynamic>.from(richText!.map((x) => x.toJson())),
        "color": colorValues.reverse[color],
    };
}

enum Color {
    DEFAULT
}

final colorValues = EnumValues({
    "default": Color.DEFAULT
});

class RichText {
    RichTextType? type;
    Text? text;
    Annotations? annotations;
    dynamic plainText;
    dynamic href;

    RichText({
        this.type,
        this.text,
        this.annotations,
        this.plainText,
        this.href,
    });

    factory RichText.fromRawJson(String str) => RichText.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RichText.fromJson(Map<String, dynamic> json) => RichText(
        type: richTextTypeValues.map[json["type"]],
        text: Text.fromJson(json["text"]),
        annotations: Annotations.fromJson(json["annotations"]),
        plainText: json["plain_text"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "type": richTextTypeValues.reverse[type],
        "text": text!.toJson(),
        "annotations": annotations!.toJson(),
        "plain_text": plainText,
        "href": href,
    };
}

class Annotations {
    dynamic bold;
    dynamic italic;
    dynamic strikethrough;
    dynamic underline;
    dynamic code;
    Color? color;

    Annotations({
        this.bold,
        this.italic,
        this.strikethrough,
        this.underline,
        this.code,
        this.color,
    });

    factory Annotations.fromRawJson(String str) => Annotations.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
        bold: json["bold"],
        italic: json["italic"],
        strikethrough: json["strikethrough"],
        underline: json["underline"],
        code: json["code"],
        color: colorValues.map[json["color"]],
    );

    Map<String, dynamic> toJson() => {
        "bold": bold,
        "italic": italic,
        "strikethrough": strikethrough,
        "underline": underline,
        "code": code,
        "color": colorValues.reverse[color],
    };
}

class Text {
    dynamic content;
    dynamic link;

    Text({
        this.content,
        this.link,
    });

    factory Text.fromRawJson(String str) => Text.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Text.fromJson(Map<String, dynamic> json) => Text(
        content: json["content"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "content": content,
        "link": link,
    };
}

enum RichTextType {
    TEXT
}

final richTextTypeValues = EnumValues({
    "text": RichTextType.TEXT
});

class Parent {
    ParentType? type;
    dynamic pageId;

    Parent({
        this.type,
        this.pageId,
    });

    factory Parent.fromRawJson(String str) => Parent.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        type: parentTypeValues.map[json["type"]],
        pageId: json["page_id"],
    );

    Map<String, dynamic> toJson() => {
        "type": parentTypeValues.reverse[type],
        "page_id": pageId,
    };
}

enum ParentType {
    PAGE_ID
}

final parentTypeValues = EnumValues({
    "page_id": ParentType.PAGE_ID
});

enum PurpleType {
    IMAGE,
    PARAGRAPH
}

final purpleTypeValues = EnumValues({
    "image": PurpleType.IMAGE,
    "paragraph": PurpleType.PARAGRAPH
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
