import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var flowers = ["Rose", "Tulips", "Lilies", "Daisy", "Iris"];
    var flowerUrl = [
      "https://cdn.pixabay.com/photo/2013/06/25/22/09/rose-141314_1280.jpg",
      "https://cdn.pixabay.com/photo/2013/05/04/09/46/spring-108810_1280.jpg",
      "https://cdn.pixabay.com/photo/2018/06/16/15/36/water-lily-3478924_1280.jpg",
      "https://cdn.pixabay.com/photo/2012/09/22/12/33/aster-tongolensis-57764__340.jpg",
      "https://cdn.pixabay.com/photo/2015/05/26/13/57/flower-784688__340.jpg"
    ];
    var status = ["sold", "available", "sold", "available", "sold"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Florist"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: flowers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(flowerUrl[index]),
                      ),
                      title: Text(flowers[index]),
                      subtitle: Text(status[index]),
                    );
                  }))
        ],
      ),
    );
  }
}
