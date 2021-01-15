import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:rxbloc/app/models/person_model.dart';
import 'package:rxbloc/app/models/person_response.dart';
import 'package:rxbloc/app/modules/home/bloc/person_bloc.dart';

class PersonWidget extends StatefulWidget {
  @override
  _PersonWidgetState createState() => _PersonWidgetState();
}

class _PersonWidgetState extends State<PersonWidget> {
  final personBloc = PersonBloc();

  @override
  void initState() {
    super.initState();
    personBloc.getPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "TRENDING PERSONS ON THIS WEEK",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        StreamBuilder<PersonResponse>(
          stream: personBloc.personSubject.stream,
          builder: (context, AsyncSnapshot<PersonResponse> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return Center(
                  child: Text(snapshot.data.error),
                );
              }
              List<PersonModel> persons = snapshot.data.persons;

              return Container(
                height: 116.0,
                padding: EdgeInsets.only(left: 10.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: persons.length,
                  itemBuilder: (_, index) {
                    PersonModel model = persons[index];

                    return Container(
                      padding: EdgeInsets.only(top: 10.0, right: 8.0),
                      width: 100.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            model.profileImg == null
                                ? Hero(
                                    tag: model.id,
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Icon(
                                        EvaIcons.umbrella,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : Hero(
                                    tag: model.id,
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w300/${model.profileImg}",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              model.name,
                              maxLines: 2,
                              style: TextStyle(
                                height: 1.4,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 9.0,
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              "Trending for " + model.known,
                              maxLines: 2,
                              style: TextStyle(
                                height: 1.4,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 7.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ],
    );
  }
}
