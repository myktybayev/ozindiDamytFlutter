import 'package:firebase_database/firebase_database.dart';

class QuizDb {
  String key;
  String title;
  String link;
  String photo;

  QuizDb({this.title, this.link, this.photo});

  QuizDb.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        title = snapshot.value["title"],
        link = snapshot.value["link"],
        photo = snapshot.value["photo"];

  toJson() {
    return {
      "title": title,
      "link": link,
      "photo": photo,
    };
  }
}
