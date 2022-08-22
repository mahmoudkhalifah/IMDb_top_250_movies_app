import 'package:dio/dio.dart';
import 'package:imdb/constants/strings.dart';

class SearchAPI {
  late Dio dio;

  SearchAPI() {
    BaseOptions options = BaseOptions(
        baseUrl: APIStrings.baseUrl,
        sendTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
        connectTimeout: 60 * 1000);
    dio = Dio(options);
  }

  Future<List<dynamic>> search(String query) async {
    try {
      Response response = await dio.get(APIStrings.search + "/" + query);
      return response.data["results"];
    } catch (e) {
      return [];
    }
  }

}