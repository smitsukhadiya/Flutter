import 'package:flutter/material.dart';

class TopRated extends StatelessWidget {
  final List topRated;

  TopRated({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('TopRated Movie', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: topRated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      topRated[index]['poster_path']),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          child: Text(topRated[index]['title'] ?? 'Loading'),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
