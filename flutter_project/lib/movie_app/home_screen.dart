import 'package:flutter/material.dart';
import 'package:flutter_practical/movie_app/toprated.dart';
import 'package:flutter_practical/movie_app/trending.dart';
import 'package:flutter_practical/movie_app/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingMovie = [];
  List topRatedMovie = [];
  List tv = [];
  final String apiKey = '1dd1743250978a4a7f7e1f5772258711';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZGQxNzQzMjUwOTc4YTRhN2Y3ZTFmNTc3MjI1ODcxMSIsInN1YiI6IjY0ZjU5OWI1ZjI5ZDY2MDBlMzQ0MGNkOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9FQfBUSiqF9bQZg-ecE01OrTRZ3Wq6Ubk3XV6Kec5P0';

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ),
        ApiKeys(apiKey, readAccessToken));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
    print('Result $trendingResult');
    setState(() {
      trendingMovie = trendingResult['results'];
      topRatedMovie = topRatedResult['results'];
      tv = tvResult['results'];
    });
  }

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Movie App 💖'),
      ),
      body: ListView(
          children: [
            TV(tv: tv),
            TopRated(topRated: topRatedMovie),
          TrendingMovies(trending : trendingMovie),
          ],
      ),
    );
  }
}
