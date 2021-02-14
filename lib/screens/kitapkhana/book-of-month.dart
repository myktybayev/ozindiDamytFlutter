import 'package:firebase_database/firebase_database.dart';

class BookOfMonth{
  String key;
  String name;
  String author;
  String url;
  String photo;

  BookOfMonth({this.name, this.author,  this.url, this.photo});

  BookOfMonth.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        name = snapshot.value["name"],
        author = snapshot.value["author"],
        url = snapshot.value["url"],
        photo = snapshot.value["photo"];

  toJson() {
    return {
      "name": name,
      "author": author,
      "url": url,
      "photo": photo,
    };
  }
}