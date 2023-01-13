import 'package:app_peliculas/providers/movies_provider.dart';
import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_peliculas/search/search_delegate.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:  Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), 
            icon:  Icon(Icons.search_outlined))
        ]
      ),
     body: SingleChildScrollView(
      child: Column(
      children: [
        CardSwiper(movies: moviesProvider.onDisplayMovies),
        MovieSlider(
          movies: moviesProvider.popularMovies, 
          tittle: 'Populares', 
          onNextPage: () => moviesProvider.getPopularMovies()),
      ]
     )
     )
    );
  }
}
