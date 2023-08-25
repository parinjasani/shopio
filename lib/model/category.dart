class Category {
  int? id;
  String? title;
  String? description;
  String? imagepath;
  int? date = DateTime.now().millisecondsSinceEpoch;

  Category({this.title, this.description,this.imagepath});

  Category.withId(
  { this.id, this.title, this.description,this.imagepath ,this.date});


  //convert MAP OBJECT TO MAP
  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'description': this.description,
      'image':this.imagepath,
      'date': this.date,
    };
  }

  //convert MAP MAP TO OBJECT
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category.withId(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      imagepath: map['image'] as String,
      date: map['date'] as int,
    );
  }
}
