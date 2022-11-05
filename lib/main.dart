import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db/core/services/services_locator.dart';
import 'package:the_movie_db/core/utils/bloc_observer.dart';
import 'package:the_movie_db/movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();

  BlocOverrides.runZoned(() => runApp(const MyApp()), blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Movie DB',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const MoviesScreen(),
    );
  }
}