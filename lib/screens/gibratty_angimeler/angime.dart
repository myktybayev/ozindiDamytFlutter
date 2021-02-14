import 'package:firebase_database/firebase_database.dart';

class Angime{
  String key;
  String title;
  String desc;
  String language;
  String photo;

  Angime({this.title, this.desc, this.language,this.photo});

  Angime.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        title = snapshot.value["title"],
        desc = snapshot.value["desc"],
        language = snapshot.value["language"],
        photo = snapshot.value["photo"];

  toJson() {
    return {
      "title": title,
      "desc": desc,
      "language": language,
      "photo": photo
    };
  }
}