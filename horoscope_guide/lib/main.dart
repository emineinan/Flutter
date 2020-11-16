import 'package:flutter/material.dart';
import 'package:horoscope_guide/horoscope_detail.dart';
import 'package:horoscope_guide/horoscope_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/horoscopeListi",
      routes: {
        "/": (context) => HoroscopeList(),
        "/burcListesi": (context) => HoroscopeList(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElements = settings.name.split("/");
        if (pathElements[1] == 'horoscopeDetail') {
          return MaterialPageRoute(
              builder: (context) =>
                  HoroscopeDetail(int.parse(pathElements[2])));
        }
        return null;
      },
      title: "Horoscope Guide",
    );
  }
}
