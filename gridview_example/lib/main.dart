import 'package:flutter/material.dart';
import 'package:gridview_example/MovieDetail.dart';
import 'Movie.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

 //bir Future method tanımlayıp içine verileri attık
  //İçine Movie Sınıfından veriler attık
  Future<List<Movie>> movies() async{
    var movieList = <Movie>[];

    movieList = [
      Movie(movie_id: 1,movie_name: "Bati Cephesi",movie_imdb: 9.3, movie_image_name: "batı.jpeg"),
      Movie(movie_id: 2,movie_name: "The Batman",movie_imdb: 9.5, movie_image_name: "batman.jpeg"),
      Movie(movie_id: 3,movie_name: "Interstealler",movie_imdb: 9.8, movie_image_name: "interstealler.jpeg"),
      Movie(movie_id: 4,movie_name: "Pianist",movie_imdb: 8.7, movie_image_name: "pianist.jpeg"),
      Movie(movie_id: 5,movie_name: "Seven",movie_imdb: 8.3, movie_image_name: "seven.jpeg"),
      Movie(movie_id: 6,movie_name: "Tenet",movie_imdb: 8.0, movie_image_name: "tenet.jpeg"),
    ];
    return movieList;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body:FutureBuilder<List<Movie>>(
        future: movies(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var getMovieList = snapshot.data;

            return GridView.builder(
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/4,
             ),
              itemCount: getMovieList!.length,
              itemBuilder: (context,indeks){
               var movie = getMovieList[indeks];

               return GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetail(movie: movie)));
                 },
                 child: Card(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Image.asset("images/${movie.movie_image_name}"),
                       ),
                       Text("${movie.movie_name}",
                             style:const TextStyle(fontSize: 15,
                             fontWeight: FontWeight.bold),),
                       Text("${movie.movie_imdb}",style: const TextStyle(
                         fontSize: 15,fontWeight: FontWeight.bold
                       ),)
                     ],
                   ),
                 ),
               );
              },
            );

          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
