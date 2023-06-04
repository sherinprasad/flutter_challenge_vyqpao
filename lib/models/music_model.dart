class MusicModel {
  Feed feed;

  MusicModel({
    this.feed,
  });

  factory MusicModel.fromJson(Map<String, dynamic> json) => MusicModel(
        feed: Feed.fromJson(json["feed"]),
      );
}

class Feed {
  Author author;
  List<Entry> entry;
  Icon updated;
  Icon rights;
  Icon title;
  Icon icon;
  List<Link> link;
  Icon id;

  Feed({
    this.author,
    this.entry,
    this.updated,
    this.rights,
    this.title,
    this.icon,
    this.link,
    this.id,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        author: Author.fromJson(json["author"]),
        entry: List<Entry>.from(json["entry"].map((x) => Entry.fromJson(x))),
        updated: Icon.fromJson(json["updated"]),
        rights: Icon.fromJson(json["rights"]),
        title: Icon.fromJson(json["title"]),
        icon: Icon.fromJson(json["icon"]),
        link: List<Link>.from(json["link"].map((x) => Link.fromJson(x))),
        id: Icon.fromJson(json["id"]),
      );
}

class Author {
  Icon name;
  Icon uri;

  Author({
    this.name,
    this.uri,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: Icon.fromJson(json["name"]),
        uri: Icon.fromJson(json["uri"]),
      );
}

class Icon {
  String label;

  Icon({
    this.label,
  });

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        label: json["label"],
      );
}

class Entry {
  Icon imName;
  List<ImImage> imImage;
  Icon imItemCount;
  ImPrice imPrice;
  EntryImContentType imContentType;
  Icon rights;
  Icon title;
  Link link;
  Id id;
  ImArtist imArtist;
  Category category;
  ImReleaseDate imReleaseDate;

  Entry({
    this.imName,
    this.imImage,
    this.imItemCount,
    this.imPrice,
    this.imContentType,
    this.rights,
    this.title,
    this.link,
    this.id,
    this.imArtist,
    this.category,
    this.imReleaseDate,
  });

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        imName: Icon.fromJson(json["im:name"]),
        imImage: List<ImImage>.from(
            json["im:image"].map((x) => ImImage.fromJson(x))),
        imItemCount: Icon.fromJson(json["im:itemCount"]),
        imPrice: ImPrice.fromJson(json["im:price"]),
        imContentType: EntryImContentType.fromJson(json["im:contentType"]),
        rights: Icon.fromJson(json["rights"]),
        title: Icon.fromJson(json["title"]),
        link: Link.fromJson(json["link"]),
        id: Id.fromJson(json["id"]),
        imArtist: ImArtist.fromJson(json["im:artist"]),
        category: Category.fromJson(json["category"]),
        imReleaseDate: ImReleaseDate.fromJson(json["im:releaseDate"]),
      );
}

class Category {
  CategoryAttributes attributes;

  Category({
    this.attributes,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        attributes: CategoryAttributes.fromJson(json["attributes"]),
      );
}

class CategoryAttributes {
  String imId;
  String term;
  String scheme;
  String label;

  CategoryAttributes({
    this.imId,
    this.term,
    this.scheme,
    this.label,
  });

  factory CategoryAttributes.fromJson(Map<String, dynamic> json) =>
      CategoryAttributes(
        imId: json["im:id"],
        term: json["term"],
        scheme: json["scheme"],
        label: json["label"],
      );
}

class Id {
  String label;
  IdAttributes attributes;

  Id({
    this.label,
    this.attributes,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        label: json["label"],
        attributes: IdAttributes.fromJson(json["attributes"]),
      );
}

class IdAttributes {
  String imId;

  IdAttributes({
    this.imId,
  });

  factory IdAttributes.fromJson(Map<String, dynamic> json) => IdAttributes(
        imId: json["im:id"],
      );
}

class ImArtist {
  String label;
  ImArtistAttributes attributes;

  ImArtist({
    this.label,
    this.attributes,
  });

  factory ImArtist.fromJson(Map<String, dynamic> json) => ImArtist(
        label: json["label"],
        attributes: ImArtistAttributes.fromJson(json["attributes"]),
      );
}

class ImArtistAttributes {
  String href;

  ImArtistAttributes({
    this.href,
  });

  factory ImArtistAttributes.fromJson(Map<String, dynamic> json) =>
      ImArtistAttributes(
        href: json["href"],
      );
}

class EntryImContentType {
  ImContentTypeImContentType imContentType;
  ImContentTypeAttributes attributes;

  EntryImContentType({
    this.imContentType,
    this.attributes,
  });

  factory EntryImContentType.fromJson(Map<String, dynamic> json) =>
      EntryImContentType(
        imContentType:
            ImContentTypeImContentType.fromJson(json["im:contentType"]),
        attributes: ImContentTypeAttributes.fromJson(json["attributes"]),
      );
}

class ImContentTypeAttributes {
  String term;
  String label;

  ImContentTypeAttributes({
    this.term,
    this.label,
  });

  factory ImContentTypeAttributes.fromJson(Map<String, dynamic> json) =>
      ImContentTypeAttributes(
        term: json["term"],
        label: json["label"],
      );
}

class ImContentTypeImContentType {
  ImContentTypeAttributes attributes;

  ImContentTypeImContentType({
    this.attributes,
  });

  factory ImContentTypeImContentType.fromJson(Map<String, dynamic> json) =>
      ImContentTypeImContentType(
        attributes: ImContentTypeAttributes.fromJson(json["attributes"]),
      );
}

class ImImage {
  String label;
  ImImageAttributes attributes;

  ImImage({
    this.label,
    this.attributes,
  });

  factory ImImage.fromJson(Map<String, dynamic> json) => ImImage(
        label: json["label"],
        attributes: ImImageAttributes.fromJson(json["attributes"]),
      );
}

class ImImageAttributes {
  String height;

  ImImageAttributes({
    this.height,
  });

  factory ImImageAttributes.fromJson(Map<String, dynamic> json) =>
      ImImageAttributes(
        height: json["height"],
      );
}

class ImPrice {
  String label;
  ImPriceAttributes attributes;

  ImPrice({
    this.label,
    this.attributes,
  });

  factory ImPrice.fromJson(Map<String, dynamic> json) => ImPrice(
        label: json["label"],
        attributes: ImPriceAttributes.fromJson(json["attributes"]),
      );
}

class ImPriceAttributes {
  String amount;
  String currency;

  ImPriceAttributes({
    this.amount,
    this.currency,
  });

  factory ImPriceAttributes.fromJson(Map<String, dynamic> json) =>
      ImPriceAttributes(
        amount: json["amount"],
        currency: json["currency"],
      );
}

class ImReleaseDate {
  DateTime label;
  Icon attributes;

  ImReleaseDate({
    this.label,
    this.attributes,
  });

  factory ImReleaseDate.fromJson(Map<String, dynamic> json) => ImReleaseDate(
        label: DateTime.parse(json["label"]),
        attributes: Icon.fromJson(json["attributes"]),
      );
}

class Link {
  LinkAttributes attributes;

  Link({
    this.attributes,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        attributes: LinkAttributes.fromJson(json["attributes"]),
      );
}

class LinkAttributes {
  String href;

  LinkAttributes({
    this.href,
  });

  factory LinkAttributes.fromJson(Map<String, dynamic> json) => LinkAttributes(
        href: json["href"],
      );
}
