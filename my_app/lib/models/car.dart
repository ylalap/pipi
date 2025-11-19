class Car {
  final int id;
  final String brand;
  final String model;
  final int year;
  final double price;
  final String color;

  Car({required this.id, required this.brand, required this.model, 
       required this.year, required this.price, required this.color});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      year: json['year'],
      price: json['price'].toDouble(),
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand,
      'model': model,
      'year': year,
      'price': price,
      'color': color,
    };
  }
}