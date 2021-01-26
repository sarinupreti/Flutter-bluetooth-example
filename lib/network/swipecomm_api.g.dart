// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swipecomm_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _SwipeCommApi implements SwipeCommApi {
  _SwipeCommApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://demo.swipecomm.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<Products>> getProducts(page, perPage) async {
    ArgumentError.checkNotNull(page, 'page');
    ArgumentError.checkNotNull(perPage, 'perPage');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': perPage
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('wp-json/wc/v3/products',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Products.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Products> createProduct() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'wp-json/wc/v3/products',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Products.fromJson(_result.data);
    return value;
  }

  @override
  Future<Products> deleteProduct(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'wp-json/wc/v3/products/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Products.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<Products>> getDraftProducts(page, status, perPage) async {
    ArgumentError.checkNotNull(page, 'page');
    ArgumentError.checkNotNull(status, 'status');
    ArgumentError.checkNotNull(perPage, 'perPage');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'status': status,
      r'per_page': perPage
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('wp-json/wc/v3/products',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Products.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Products>> searchProductsByName(search) async {
    ArgumentError.checkNotNull(search, 'search');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'search': search};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('wp-json/wc/v3/products',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Products.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Products>> searchProductsBySKU(sku) async {
    ArgumentError.checkNotNull(sku, 'sku');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'sku': sku};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('wp-json/wc/v3/products',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Products.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Order>> getAllOrders() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('wp-json/wc/v3/orders',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Order.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Order> updateOrder(id, body) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.request<Map<String, dynamic>>(
        'wp-json/wc/v3/orders/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Order.fromJson(_result.data);
    return value;
  }
}
