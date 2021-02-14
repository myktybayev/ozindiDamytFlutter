import 'package:firebase_database/firebase_database.dart';

class HobbyDb {
  String key;
  String desc;
  String title;
  String link;
  String photo;

  HobbyDb({this.desc, this.title, this.link, this.photo});

  HobbyDb.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        desc = snapshot.value["desc"],
        title = snapshot.value["title"],
        link = snapshot.value["link"],
        photo = snapshot.value["photo"];

  toJson() {
    return {
      "desc": desc,
      "title": title,
      "link": link,
      "photo": photo,
    };
  }
}
