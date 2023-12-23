class MyDatabaseEntry {
  late int _id;
  late int _age;
  late String _title;

  MyDatabaseEntry(this._id, this._age, this._title);

  // Getter for each field
  int get id => _id;
  int get age => _age;
  String get title => _title;

  // Setter for id
  set id(int value) {
    _id = value;
  }

  // Setter for age
  set age(int value) {
    _age = value;
  }

  // Setter for title
  set title(String value) {
    _title = value;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['age'] = _age;
    map['title'] = _title;
    return map;
  }

  MyDatabaseEntry.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._age = map['age'];
    this._title = map['title'];
  }
}
