class Category{
  int? id;
  String? title;
  String? description;
  int date= DateTime.now().millisecondsSinceEpoch;

  Category({this.title,this.description});

  //TO MAP OBJECT TO MAP
  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'description': this.description,
      'date': this.date,
    };
  }

  //FROM MAP MAP TO OBJECT

}