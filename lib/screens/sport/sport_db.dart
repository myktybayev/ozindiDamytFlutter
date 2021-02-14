import 'package:firebase_database/firebase_database.dart';

class SportDb {
  String key;
  String desc;
  String title;
  String link;
  String photo;

  SportDb({this.desc, this.title, this.link, this.photo});

  SportDb.fromSnapshot(DataSnapshot snapshot)
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
