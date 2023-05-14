import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Movie.dart';



class MovieDetail extends StatefulWidget {
   MovieDetail({super.key , required this.movie});

  Movie movie;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.movie.movie_name}"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.movie.movie_image_name}"),
            Text("${widget.movie.movie_name}",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text("${widget.movie.movie_imdb}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
          ],
        ),

      )
    );
  }
}
