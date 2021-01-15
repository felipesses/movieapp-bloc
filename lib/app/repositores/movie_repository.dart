import 'package:dio/dio.dart';
import 'package:rxbloc/app/models/genre_response.dart';
import 'package:rxbloc/app/models/movie_response.dart';
import 'package:rxbloc/app/models/person_response.dart';
import 'package:rxbloc/app/utils/constants.dart';

class MovieRepository {
  final Dio _dio = Dio();

  Future<MovieResponse> getMovies() async {
    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: movieParams);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: movieParams);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres() async {
    try {
      Response response =
          await _dio.get(getGenresUrl, queryParameters: genreParams);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return GenreResponse.withError("$error");
    }
  }

  Future<PersonResponse> getPersons() async {
    try {
      Response response =
          await _dio.get(getPersonsUrl, queryParameters: personParams);
      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return PersonResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
      "with_genres": id
    };
    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }
}
