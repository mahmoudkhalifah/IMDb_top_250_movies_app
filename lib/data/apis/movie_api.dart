import 'package:dio/dio.dart';
import 'package:imdb/constants/strings.dart';

class MovieAPI {
  late Dio dio;

  MovieAPI() {
    BaseOptions options = BaseOptions(baseUrl: Strings.baseUrl,sendTimeout: 60*1000,receiveTimeout: 60*1000,connectTimeout: 60*1000);
    dio = Dio(options);
  }

  Future<List<dynamic>> getTopRatedMovies() async {
    try {
      Response response = await dio.get(Strings.topRatedMovies);
      return response.data["items"];
    } catch (e) {
      return [];
    }
  }
}