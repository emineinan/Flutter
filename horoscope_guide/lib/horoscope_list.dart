import 'package:flutter/material.dart';
import 'package:horoscope_guide/models/horoscope.dart';
import 'package:horoscope_guide/utils/strings.dart';

class HoroscopeList extends StatelessWidget {
  static List<Horoscope> horoscopes;

  @override
  Widget build(BuildContext context) {
    horoscopes = getHoroscopes();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Horoscope Guide"),
      ),
      body: buildList(),
    );
  }

  Widget buildList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return buildHoroscopeRow(context, index);
      },
      itemCount: horoscopes.length,
    );
  }

  List<Horoscope> getHoroscopes() {
    List<Horoscope> horoscope = [];
    for (int i = 0; i < 12; i++) {
      String horoscopeName = Strings.HOROSCOPE_NAMES[i];
      String horoscopeDate = Strings.HOROSCOPE_DATES[i];
      String horoscopeFeature = Strings.HOROSCOPE_FEATURES[i];

      Horoscope h = Horoscope(horoscopeName, horoscopeDate, horoscopeFeature);
      horoscope.add(h);
    }
    return horoscope;
  }

  Widget buildHoroscopeRow(BuildContext context, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, "/horoscopeDetail/$index"),
          title: Text(
            horoscopes[index].horoscopeName,
            style: TextStyle(
                fontSize: 20.0, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              horoscopes[index].horoscopeDate,
              style: TextStyle(fontSize: 17.0, color: Colors.black),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
