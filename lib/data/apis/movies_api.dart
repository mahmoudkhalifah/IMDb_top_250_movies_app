import 'package:dio/dio.dart';
import 'package:imdb/constants/strings.dart';

class MoviesAPI {
  late Dio dio;

  MoviesAPI() {
    BaseOptions options = BaseOptions(
        baseUrl: APIStrings.baseUrl,
        sendTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
        connectTimeout: 60 * 1000);
    dio = Dio(options);
  }

  Future<List<dynamic>> getTopRatedMovies() async {
    try {
      Response response = await dio.get(APIStrings.topRatedMovies);
      return response.data["items"];
    } catch (e) {
      return [];
    }
  }
}
