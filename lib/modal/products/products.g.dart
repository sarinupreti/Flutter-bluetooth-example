// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsAdapter extends TypeAdapter<Products> {
  @override
  final int typeId = 1;

  @override
  Products read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Products(
      id: fields[0] as int,
      name: fields[1] as String,
      slug: fields[2] as String,
      permalink: fields[3] as String,
      type: fields[4] as String,
      status: fields[5] as String,
      featured: fields[6] as bool,
      catalogVisibility: fields[7] as String,
      description: fields[8] as String,
      shortDescription: fields[9] as String,
      sku: fields[10] as String,
      price: fields[11] as String,
      regularPrice: fields[12] as String,
      salePrice: fields[13] as String,
      priceHtml: fields[14] as String,
      onSale: fields[15] as bool,
      purchasable: fields[16] as bool,
      totalSales: fields[17] as int,
      virtual: fields[18] as bool,
      downloadable: fields[19] as bool,
      downloads: (fields[20] as List)?.cast<ProductDownload>(),
      downloadLimit: fields[21] as int,
      downloadExpiry: fields[22] as int,
      externalUrl: fields[23] as String,
      buttonText: fields[24] as String,
      taxStatus: fields[25] as String,
      taxClass: fields[26] as String,
      manageStock: fields[27] as bool,
      stock_quantity: fields[28] as int,
      stock_status: fields[29] as String,
      backorders: fields[30] as String,
      backordersAllowed: fields[31] as bool,
      backordered: fields[32] as bool,
      soldIndividually: fields[33] as bool,
      weight: fields[34] as String,
      dimensions: fields[35] as ProductDimension,
      shippingRequired: fields[36] as bool,
      shippingTaxable: fields[37] as bool,
      shippingClass: fields[38] as String,
      shippingClassId: fields[39] as int,
      reviewsAllowed: fields[40] as bool,
      averageRating: fields[41] as String,
      ratingCount: fields[42] as int,
      relatedIds: (fields[43] as List)?.cast<int>(),
      upsellIds: (fields[44] as List)?.cast<int>(),
      crossSellIds: (fields[45] as List)?.cast<int>(),
      parentId: fields[46] as int,
      purchaseNote: fields[47] as String,
      categories: (fields[48] as List)?.cast<ProductCategory>(),
      tags: (fields[49] as List)?.cast<ProductItemTag>(),
      images: (fields[50] as List)?.cast<ProductImage>(),
      attributes: (fields[51] as List)?.cast<ProductItemAttribute>(),
      defaultAttributes: (fields[52] as List)?.cast<ProductDefaultAttribute>(),
      variations: (fields[53] as List)?.cast<int>(),
      groupedProducts: (fields[54] as List)?.cast<int>(),
      menuOrder: fields[55] as int,
      metaData: (fields[56] as List)?.cast<MetaData>(),
    );
  }

  @override
  void write(BinaryWriter writer, Products obj) {
    writer
      ..writeByte(57)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.permalink)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.featured)
      ..writeByte(7)
      ..write(obj.catalogVisibility)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.shortDescription)
      ..writeByte(10)
      ..write(obj.sku)
      ..writeByte(11)
      ..write(obj.price)
      ..writeByte(12)
      ..write(obj.regularPrice)
      ..writeByte(13)
      ..write(obj.salePrice)
      ..writeByte(14)
      ..write(obj.priceHtml)
      ..writeByte(15)
      ..write(obj.onSale)
      ..writeByte(16)
      ..write(obj.purchasable)
      ..writeByte(17)
      ..write(obj.totalSales)
      ..writeByte(18)
      ..write(obj.virtual)
      ..writeByte(19)
      ..write(obj.downloadable)
      ..writeByte(20)
      ..write(obj.downloads)
      ..writeByte(21)
      ..write(obj.downloadLimit)
      ..writeByte(22)
      ..write(obj.downloadExpiry)
      ..writeByte(23)
      ..write(obj.externalUrl)
      ..writeByte(24)
      ..write(obj.buttonText)
      ..writeByte(25)
      ..write(obj.taxStatus)
      ..writeByte(26)
      ..write(obj.taxClass)
      ..writeByte(27)
      ..write(obj.manageStock)
      ..writeByte(28)
      ..write(obj.stock_quantity)
      ..writeByte(29)
      ..write(obj.stock_status)
      ..writeByte(30)
      ..write(obj.backorders)
      ..writeByte(31)
      ..write(obj.backordersAllowed)
      ..writeByte(32)
      ..write(obj.backordered)
      ..writeByte(33)
      ..write(obj.soldIndividually)
      ..writeByte(34)
      ..write(obj.weight)
      ..writeByte(35)
      ..write(obj.dimensions)
      ..writeByte(36)
      ..write(obj.shippingRequired)
      ..writeByte(37)
      ..write(obj.shippingTaxable)
      ..writeByte(38)
      ..write(obj.shippingClass)
      ..writeByte(39)
      ..write(obj.shippingClassId)
      ..writeByte(40)
      ..write(obj.reviewsAllowed)
      ..writeByte(41)
      ..write(obj.averageRating)
      ..writeByte(42)
      ..write(obj.ratingCount)
      ..writeByte(43)
      ..write(obj.relatedIds)
      ..writeByte(44)
      ..write(obj.upsellIds)
      ..writeByte(45)
      ..write(obj.crossSellIds)
      ..writeByte(46)
      ..write(obj.parentId)
      ..writeByte(47)
      ..write(obj.purchaseNote)
      ..writeByte(48)
      ..write(obj.categories)
      ..writeByte(49)
      ..write(obj.tags)
      ..writeByte(50)
      ..write(obj.images)
      ..writeByte(51)
      ..write(obj.attributes)
      ..writeByte(52)
      ..write(obj.defaultAttributes)
      ..writeByte(53)
      ..write(obj.variations)
      ..writeByte(54)
      ..write(obj.groupedProducts)
      ..writeByte(55)
      ..write(obj.menuOrder)
      ..writeByte(56)
      ..write(obj.metaData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) {
  return Products(
    id: json['id'] as int,
    name: json['name'] as String,
    slug: json['slug'] as String,
    permalink: json['permalink'] as String,
    type: json['type'] as String,
    status: json['status'] as String,
    featured: json['featured'] as bool,
    catalogVisibility: json['catalogVisibility'] as String,
    description: json['description'] as String,
    shortDescription: json['shortDescription'] as String,
    sku: json['sku'] as String,
    price: json['price'] as String,
    regularPrice: json['regularPrice'] as String,
    salePrice: json['salePrice'] as String,
    priceHtml: json['priceHtml'] as String,
    onSale: json['onSale'] as bool,
    purchasable: json['purchasable'] as bool,
    totalSales: json['totalSales'] as int,
    virtual: json['virtual'] as bool,
    downloadable: json['downloadable'] as bool,
    downloads: (json['downloads'] as List)
        ?.map((e) => e == null
            ? null
            : ProductDownload.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    downloadLimit: json['downloadLimit'] as int,
    downloadExpiry: json['downloadExpiry'] as int,
    externalUrl: json['externalUrl'] as String,
    buttonText: json['buttonText'] as String,
    taxStatus: json['taxStatus'] as String,
    taxClass: json['taxClass'] as String,
    manageStock: json['manageStock'] as bool,
    stock_quantity: json['stock_quantity'] as int,
    stock_status: json['stock_status'] as String,
    backorders: json['backorders'] as String,
    backordersAllowed: json['backordersAllowed'] as bool,
    backordered: json['backordered'] as bool,
    soldIndividually: json['soldIndividually'] as bool,
    weight: json['weight'] as String,
    dimensions: json['dimensions'] == null
        ? null
        : ProductDimension.fromJson(json['dimensions'] as Map<String, dynamic>),
    shippingRequired: json['shippingRequired'] as bool,
    shippingTaxable: json['shippingTaxable'] as bool,
    shippingClass: json['shippingClass'] as String,
    shippingClassId: json['shippingClassId'] as int,
    reviewsAllowed: json['reviewsAllowed'] as bool,
    averageRating: json['averageRating'] as String,
    ratingCount: json['ratingCount'] as int,
    relatedIds: (json['relatedIds'] as List)?.map((e) => e as int)?.toList(),
    upsellIds: (json['upsellIds'] as List)?.map((e) => e as int)?.toList(),
    crossSellIds:
        (json['crossSellIds'] as List)?.map((e) => e as int)?.toList(),
    parentId: json['parentId'] as int,
    purchaseNote: json['purchaseNote'] as String,
    categories: (json['categories'] as List)
        ?.map((e) => e == null
            ? null
            : ProductCategory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as List)
        ?.map((e) => e == null
            ? null
            : ProductItemTag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ProductImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    attributes: (json['attributes'] as List)
        ?.map((e) => e == null
            ? null
            : ProductItemAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    defaultAttributes: (json['defaultAttributes'] as List)
        ?.map((e) => e == null
            ? null
            : ProductDefaultAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    variations: (json['variations'] as List)?.map((e) => e as int)?.toList(),
    groupedProducts:
        (json['groupedProducts'] as List)?.map((e) => e as int)?.toList(),
    menuOrder: json['menuOrder'] as int,
    metaData: (json['metaData'] as List)
        ?.map((e) =>
            e == null ? null : MetaData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'permalink': instance.permalink,
      'type': instance.type,
      'status': instance.status,
      'featured': instance.featured,
      'catalogVisibility': instance.catalogVisibility,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'sku': instance.sku,
      'price': instance.price,
      'regularPrice': instance.regularPrice,
      'salePrice': instance.salePrice,
      'priceHtml': instance.priceHtml,
      'onSale': instance.onSale,
      'purchasable': instance.purchasable,
      'totalSales': instance.totalSales,
      'virtual': instance.virtual,
      'downloadable': instance.downloadable,
      'downloads': instance.downloads,
      'downloadLimit': instance.downloadLimit,
      'downloadExpiry': instance.downloadExpiry,
      'externalUrl': instance.externalUrl,
      'buttonText': instance.buttonText,
      'taxStatus': instance.taxStatus,
      'taxClass': instance.taxClass,
      'manageStock': instance.manageStock,
      'stock_quantity': instance.stock_quantity,
      'stock_status': instance.stock_status,
      'backorders': instance.backorders,
      'backordersAllowed': instance.backordersAllowed,
      'backordered': instance.backordered,
      'soldIndividually': instance.soldIndividually,
      'weight': instance.weight,
      'dimensions': instance.dimensions,
      'shippingRequired': instance.shippingRequired,
      'shippingTaxable': instance.shippingTaxable,
      'shippingClass': instance.shippingClass,
      'shippingClassId': instance.shippingClassId,
      'reviewsAllowed': instance.reviewsAllowed,
      'averageRating': instance.averageRating,
      'ratingCount': instance.ratingCount,
      'relatedIds': instance.relatedIds,
      'upsellIds': instance.upsellIds,
      'crossSellIds': instance.crossSellIds,
      'parentId': instance.parentId,
      'purchaseNote': instance.purchaseNote,
      'categories': instance.categories,
      'tags': instance.tags,
      'images': instance.images,
      'attributes': instance.attributes,
      'defaultAttributes': instance.defaultAttributes,
      'variations': instance.variations,
      'groupedProducts': instance.groupedProducts,
      'menuOrder': instance.menuOrder,
      'metaData': instance.metaData,
    };
