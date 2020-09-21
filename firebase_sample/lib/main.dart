import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Survey"),
        ),
        body: SurveyList(),
      ),
    );
  }
}

final fakeSnapshot = [
  {"name": "C", "vote": 3},
  {"name": "Java", "vote": 7},
  {"name": "Python", "vote": 9},
  {"name": "Perl", "vote": 1}
];

class SurveyList extends StatefulWidget {
  @override
  _SurveyListState createState() => _SurveyListState();
}

class _SurveyListState extends State<SurveyList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection("languagesurvey").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          return buildBody(context, snapshot.data.docs);
        }
      },
    );
  }

  Widget buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
        padding: EdgeInsets.only(top: 20.0),
        children: snapshot
            .map<Widget>((data) => buildListItem(context, data))
            .toList());
  }

  buildListItem(BuildContext context, DocumentSnapshot data) {
    final row = Survey.fromSnapshot(data);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      key: ValueKey(row.name),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
        ),
        child: ListTile(
          title: Text(row.name),
          trailing: Text(row.vote.toString()),
          onTap: () => print(row.name),
        ),
      ),
    );
  }
}

class Survey {
  String name;
  int vote;
  DocumentReference reference;

  Survey.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map["name"] != null),
        assert(map["vote"] != null),
        name = map["name"],
        vote = map["vote"];

  Survey.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}
