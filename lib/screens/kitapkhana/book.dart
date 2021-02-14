import 'package:firebase_database/firebase_database.dart';

class Book{
  String key;
  String name;
  String author;
  String desc;
  String url;
  int page_number;
  String rating;
  String photo;

  Book({this.name, this.author, this.desc, this.url, this.page_number, this.rating, this.photo});

  Book.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        name = snapshot.value["name"],
        author = snapshot.value["author"],
        desc = snapshot.value["desc"],
        url = snapshot.value["url"],
        page_number = snapshot.value["page_number"],
        rating = snapshot.value["rating"],
        photo = snapshot.value["photo"];

  toJson() {
    return {
      "name": name,
      "author": author,
      "desc": desc,
      "url": url,
      "page_number": page_number,
      "rating": rating,
      "photo": photo,
    };
  }
}