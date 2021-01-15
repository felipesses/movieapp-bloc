import 'package:rxbloc/app/models/person_model.dart';

class PersonResponse {
  final List<PersonModel> persons;
  final String error;

  PersonResponse(this.persons, this.error);

  PersonResponse.fromJson(Map<String, dynamic> json)
      : persons = (json["results"] as List)
            .map((i) => new PersonModel.fromJson(i))
            .toList(),
        error = "";

  PersonResponse.withError(String errorValue)
      : persons = List(),
        error = errorValue;
}
