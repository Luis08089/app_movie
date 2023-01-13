import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieSlider extends StatefulWidget {

  final List<Movie> movies;
  final String? tittle;
  final Function onNextPage;

  const MovieSlider({
    Key? key, required this.movies, required this.onNextPage, this.tittle
  });

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() { 
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500){
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //TODO Si no hay titulo, no deben de mostrar este widget
          if(this.widget.tittle != null)
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(this.widget.tittle!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ),
          
          const SizedBox(height: 5),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (_, int index) => _MoviePoster(widget.movies[index], '${widget.tittle}-${index}-${widget.movies[index].id}')
              ),
          )
        ]
      )
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie movie;
  final String heroId;

  const _MoviePoster(this.movie, this.heroId);
  
  @override
  Widget build(BuildContext context) {
    movie.heroId = heroId;

    return Container(
                  width: 130,
                  height: 190,
                  margin:  const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
                        child: Hero(
                          tag: movie.heroId!,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage(
                              placeholder: AssetImage('assets/no-image.jpg'), 
                              image: NetworkImage(movie.fullPosterImg),
                              width: 130,
                              height: 190,
                              fit: BoxFit.cover,
                              ),
                          ),
                        ),
                      ),
                        
                         const SizedBox(height: 5),

                         Text(
                          maxLines: 2,
                          movie.title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          )
                    ],
                  )
                );
  }
}