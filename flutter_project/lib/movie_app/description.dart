import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_date;

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl, fit: BoxFit.cover),
                  )),
                  Positioned(
                      bottom: 10,
                      child: Text(
                        'IMDB Rating :' + vote + ' ⭐',
                        style: const TextStyle(fontSize: 18),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(name ?? 'Not Loaded',
                  style: const TextStyle(fontSize: 24)),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Released On :' + launch_date,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height:200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(child: Text(description,style: TextStyle(fontSize: 18),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
