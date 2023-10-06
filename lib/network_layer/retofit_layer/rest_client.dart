import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sheker/repository/model/product.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://fakestoreapi.com')
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('/products')
  Future<List<Product>> getProducts();
}
