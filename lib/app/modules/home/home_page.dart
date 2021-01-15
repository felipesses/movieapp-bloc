import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rxbloc/app/models/movie_model.dart';
import 'package:rxbloc/app/models/movie_response.dart';
import 'package:rxbloc/app/modules/home/bloc/movie_bloc.dart';
import 'package:rxbloc/app/modules/home/shared/widgets/movie_widget.dart';
import 'package:rxbloc/app/modules/home/shared/widgets/person_widget.dart';

import 'bloc/person_bloc.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Color(0xFF151C26),
      body: ListView(
        children: [
          MovieWidget(),
          PersonWidget(),
        ],
      ),
    );
  }
}
