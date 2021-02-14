import 'package:firebase_database/firebase_database.dart';

class MarathonDb {
  String key;
  String desc;
  String title;
  String report;
  String photo;
  String date;
  String instruction;
  String present;

  MarathonDb(
      {this.desc,
      this.title,
      this.report,
      this.photo,
      this.date,
      this.instruction,
      this.present});

  MarathonDb.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        desc = snapshot.value["desc"],
        title = snapshot.value["title"],
        report = snapshot.value["report"],
        photo = snapshot.value["photo"],
        date = snapshot.value["date"],
        instruction = snapshot.value["instruction"],
        present = snapshot.value["present"];

  toJson() {
    return {
      "desc": desc,
      "title": title,
      "report": report,
      "photo": photo,
      "date": date,
      "instruction": instruction,
      "present": present
    };
  }
}
