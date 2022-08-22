import 'package:dio/dio.dart';
import 'package:imdb/constants/strings.dart';

class TVsAPI {
  late Dio dio;

  TVsAPI() {
    BaseOptions options = BaseOptions(
        baseUrl: APIStrings.baseUrl,
        sendTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
        connectTimeout: 60 * 1000);
    dio = Dio(options);
  }

  Future<List<dynamic>> getTopRatedTVs() async {
    try {
      Response response = await dio.get(APIStrings.topRatedTVs);
      return response.data["items"];
    } catch (e) {
      return [];
    }
  }
}
