import 'package:flutter/material.dart';
import 'package:flutter_practical/movie_app/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Trending Movie', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            Description(
                              name: trending[index]['title'],
                              bannerurl: 'https://image.tmdb.org/t/p/w500' + trending[index]['backdrop_path'],
                              description:trending[index]['overview'],
                              launch_date:trending[index]['release_date'],
                              posterurl:'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path'],
                              vote:trending[index]['vote_average'].toString(),
                            ),));
                  },
                  child:trending[index]['title']!=null ? Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path']),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          child: Text(trending[index]['title'] ?? 'Loading'),
                        )
                      ],
                    ),
                  ) : Container(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
