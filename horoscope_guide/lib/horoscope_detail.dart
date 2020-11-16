import 'package:flutter/material.dart';
import 'package:horoscope_guide/horoscope_list.dart';
import 'package:horoscope_guide/models/horoscope.dart';

class HoroscopeDetail extends StatelessWidget {
  int index;
  HoroscopeDetail(this.index);

  Horoscope selectedHoroscope;

  @override
  Widget build(BuildContext context) {
    selectedHoroscope = HoroscopeList.horoscopes[index];
    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 15,
            pinned: true,
            primary: true,
            title: Text(selectedHoroscope.horoscopeName),
            backgroundColor: Colors.red,
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  selectedHoroscope.horoscopeFeature,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
