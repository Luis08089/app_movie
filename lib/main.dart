import 'package:flutter/material.dart';
import 'package:app_peliculas/screens/screens.dart';
import 'package:provider/provider.dart';

import 'package:app_peliculas/providers/movies_provider.dart';


void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false)
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:  'Pelìculas',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => HomeScreen(),
        'details': ( _ ) => DetailsScreen(),
      },
      theme:  ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.indigo
        )
      ),
    );
  }
}