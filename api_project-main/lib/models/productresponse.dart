class ProductResponse {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;
  Rating rating;
  int quantity;

  ProductResponse(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }
  ProductResponse.ffromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    return data;
  }

  Map<String, dynamic> ttoJson() {
    final Map<String, dynamic> dataa = new Map<String, dynamic>();
    dataa['id'] = this.id;
    dataa['title'] = this.title;
    dataa['price'] = this.price;
    dataa['description'] = this.description;
    dataa['category'] = this.category;
    dataa['image'] = this.image;
    dataa['quantity'] = this.quantity ?? 1;
    return dataa;
  }
}

class Rating {
  num rate;
  String count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
