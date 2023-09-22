import 'package:flutter/material.dart';

class TV extends StatelessWidget {
  final List tv;

  TV({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Popular Tv Shows', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10,),
          Container(
            height: 200,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          height: 140,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      tv[index]['backdrop_path']),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          child: Text(tv[index]['original_name'] ?? 'Loading'),
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
