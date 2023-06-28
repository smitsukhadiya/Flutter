import 'package:flutter/material.dart';

class MyDesktoppage extends StatelessWidget {
  const MyDesktoppage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //title: 'DESKTOP APP',
      appBar: AppBar(
        title: Text("DESKTOP"),
        backgroundColor: Colors.black,
      ),
      body: Row(
        children: [
          Padding(padding: EdgeInsets.all(8.0),
          child:AspectRatio(
          aspectRatio: 2.6/9,
         child: Container(
            //margin: EdgeInsets.all(8),
            width: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            )
          ),
        ),
        ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 2/1.1,
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                       color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                     child:Stack(
                        children: [
                       AspectRatio(
                      aspectRatio: 2/1.1,
                       child: Image.network(
                         "https://www.androidauthority.com/wp-content/uploads/2019/08/New-Android-Logo-evolution.gif",
                              fit: BoxFit.contain,
                          ),
                      ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 11,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
                children: [
                  Padding(
                    padding:EdgeInsets.all(8.0),
                    child: AspectRatio(
                      aspectRatio: 2/0.9,
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 2/0.9,
                              child: Image.network(
                                "https://thumbs.gfycat.com/LittlePresentFreshwatereel-max-1mb.gif",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 11,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
