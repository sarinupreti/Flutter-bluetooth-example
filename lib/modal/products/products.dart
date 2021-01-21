import 'package:bell_delivery_hub/data/hive/hive_const.dart';
import 'package:bell_delivery_hub/modal/products/product_category.dart';
import 'package:bell_delivery_hub/modal/products/product_default_attribute.dart';
import 'package:bell_delivery_hub/modal/products/product_dimension.dart';
import 'package:bell_delivery_hub/modal/products/product_download.dart';
import 'package:bell_delivery_hub/modal/products/product_image.dart';
import 'package:bell_delivery_hub/modal/products/product_item_attribute.dart';
import 'package:bell_delivery_hub/modal/products/product_item_tag.dart';
import 'package:bell_delivery_hub/modal/products/product_meta_data.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'products.g.dart';

@HiveType(typeId: HIVE_PRODUCTS_TYPE_ID)
@JsonSerializable()
// ignore: must_be_immutable
class Products extends HiveObject implements Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String slug;
  @HiveField(3)
  final String permalink;
  @HiveField(4)
  final String type;
  @HiveField(5)
  final String status;
  @HiveField(6)
  final bool featured;
  @HiveField(7)
  final String catalogVisibility;
  @HiveField(8)
  final String description;
  @HiveField(9)
  final String shortDescription;
  @HiveField(10)
  final String sku;
  @HiveField(11)
  final String price;
  @HiveField(12)
  final String regularPrice;
  @HiveField(13)
  final String salePrice;
  @HiveField(14)
  final String priceHtml;
  @HiveField(15)
  final bool onSale;
  @HiveField(16)
  final bool purchasable;
  @HiveField(17)
  final int totalSales;
  @HiveField(18)
  final bool virtual;
  @HiveField(19)
  final bool downloadable;
  @HiveField(20)
  final List<ProductDownload> downloads;
  @HiveField(21)
  final int downloadLimit;
  @HiveField(22)
  final int downloadExpiry;
  @HiveField(23)
  final String externalUrl;
  @HiveField(24)
  final String buttonText;
  @HiveField(25)
  final String taxStatus;
  @HiveField(26)
  final String taxClass;
  @HiveField(27)
  final bool manageStock;
  @HiveField(28)
  // ignore: non_constant_identifier_names
  final int stock_quantity;
  @HiveField(29)
  // ignore: non_constant_identifier_names
  final String stock_status;
  @HiveField(30)
  final String backorders;
  @HiveField(31)
  final bool backordersAllowed;
  @HiveField(32)
  final bool backordered;
  @HiveField(33)
  final bool soldIndividually;
  @HiveField(34)
  final String weight;
  @HiveField(35)
  final ProductDimension dimensions;
  @HiveField(36)
  final bool shippingRequired;
  @HiveField(37)
  final bool shippingTaxable;
  @HiveField(38)
  final String shippingClass;
  @HiveField(39)
  final int shippingClassId;
  @HiveField(40)
  final bool reviewsAllowed;
  @HiveField(41)
  final String averageRating;
  @HiveField(42)
  final int ratingCount;
  @HiveField(43)
  final List<int> relatedIds;
  @HiveField(44)
  final List<int> upsellIds;
  @HiveField(45)
  final List<int> crossSellIds;
  @HiveField(46)
  final int parentId;
  @HiveField(47)
  final String purchaseNote;
  @HiveField(48)
  final List<ProductCategory> categories;
  @HiveField(49)
  final List<ProductItemTag> tags;
  @HiveField(50)
  final List<ProductImage> images;
  @HiveField(51)
  final List<ProductItemAttribute> attributes;
  @HiveField(52)
  final List<ProductDefaultAttribute> defaultAttributes;
  @HiveField(53)
  final List<int> variations;
  @HiveField(54)
  final List<int> groupedProducts;
  @HiveField(55)
  final int menuOrder;
  @HiveField(56)
  final List<MetaData> metaData;
  @HiveField(57)
  Products(
      {this.id,
      this.name,
      this.slug,
      this.permalink,
      this.type,
      this.status,
      this.featured,
      this.catalogVisibility,
      this.description,
      this.shortDescription,
      this.sku,
      this.price,
      this.regularPrice,
      this.salePrice,
      this.priceHtml,
      this.onSale,
      this.purchasable,
      this.totalSales,
      this.virtual,
      this.downloadable,
      this.downloads,
      this.downloadLimit,
      this.downloadExpiry,
      this.externalUrl,
      this.buttonText,
      this.taxStatus,
      this.taxClass,
      this.manageStock,
      // ignore: non_constant_identifier_names
      this.stock_quantity,
      // ignore: non_constant_identifier_names
      this.stock_status,
      this.backorders,
      this.backordersAllowed,
      this.backordered,
      this.soldIndividually,
      this.weight,
      this.dimensions,
      this.shippingRequired,
      this.shippingTaxable,
      this.shippingClass,
      this.shippingClassId,
      this.reviewsAllowed,
      this.averageRating,
      this.ratingCount,
      this.relatedIds,
      this.upsellIds,
      this.crossSellIds,
      this.parentId,
      this.purchaseNote,
      this.categories,
      this.tags,
      this.images,
      this.attributes,
      this.defaultAttributes,
      this.variations,
      this.groupedProducts,
      this.menuOrder,
      this.metaData});

  static const fromJson = _$ProductsFromJson;

  Map<String, dynamic> toJson() => _$ProductsToJson(this);

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}
