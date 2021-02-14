import 'package:firebase_database/firebase_database.dart';

class PodcastDb{
  String key;
  String topic;
  String title;
  String link;
  String duration;
  String photo;

  PodcastDb({this.topic, this.title, this.link, this.duration, this.photo});

  PodcastDb.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        topic = snapshot.value["topic"],
        title = snapshot.value["title"],
        link = snapshot.value["link"],
        duration = snapshot.value["duration"],
        photo = snapshot.value["photo"];

  toJson() {
    return {
      "topic": topic,
      "title": title,
      "link": link,
      "duration": duration,
      "photo": photo,
    };
  }
}