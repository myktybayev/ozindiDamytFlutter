import 'package:firebase_database/firebase_database.dart';

class Cinema{
  String key;
  String name;
  String language;
  String link;
  String photo;

  Cinema({this.name, this.language, this.link, this.photo});

  Cinema.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        name = snapshot.value["name"],
        language = snapshot.value["language"],
        link = snapshot.value["link"],
        photo = snapshot.value["photo"];

  toJson() {
    return {
      "name": name,
      "language": language,
      "link": link,
      "photo": photo,
    };
  }
}