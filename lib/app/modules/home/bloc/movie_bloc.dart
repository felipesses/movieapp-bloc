import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxbloc/app/models/movie_response.dart';
import 'package:rxbloc/app/repositores/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc implements Disposable {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _movieSubject =
      BehaviorSubject<MovieResponse>();

  getMovies() async {
    MovieResponse response = await _repository.getMovies();
    _movieSubject.sink.add(response);
  }

  @override
  void dispose() {
    _movieSubject.close();
  }

  BehaviorSubject<MovieResponse> get movieSubject => _movieSubject;
}

final moviesBloc = MovieBloc();
