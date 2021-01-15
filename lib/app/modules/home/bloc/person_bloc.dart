import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxbloc/app/models/person_response.dart';
import 'package:rxbloc/app/repositores/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class PersonBloc implements Disposable {
  final MovieRepository _repository = MovieRepository();

  final BehaviorSubject<PersonResponse> _personSubject =
      BehaviorSubject<PersonResponse>();

  getPerson() async {
    PersonResponse response = await _repository.getPersons();
    _personSubject.sink.add(response);
  }

  @override
  void dispose() {
    _personSubject.close();
  }

  BehaviorSubject<PersonResponse> get personSubject => _personSubject;
}

final personBloc = PersonBloc();
