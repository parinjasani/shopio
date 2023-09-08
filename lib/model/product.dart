class Product{

  String? id;
  String title;
  String  description;
  double mrp;
  int discount;
  int categoryid;
  String imagepath;
  int timestamp=DateTime.now().millisecondsSinceEpoch;

  Product({required this.title, required this.description, required this.mrp, required this.discount,required this.categoryid, required this.imagepath});

  Product.withId({this.id, required this.title, required this.description, required this.mrp, required this.discount,required this.categoryid, required this.imagepath, required this.timestamp});


  factory Product.fromMap(Map<dynamic, dynamic> map) {
    return Product.withId(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      mrp: double.parse(map['mrp'].toString()),
      discount: map['discount'] as int,
      categoryid: map['categoryid'] as int,
      imagepath: map['imagepath'] as String,
      timestamp: map['timestamp'] as int,
    );
  }
Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'mrp': this.mrp,
      'discount': this.discount,
      'categoryid': this.categoryid,
      'imagepath': this.imagepath,
      'timestamp': this.timestamp,
    };
  }
}