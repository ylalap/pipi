// models/sale_info.dart
class SaleInfo {
  final String carInfo;
  final String buyerInfo;
  final DateTime purchaseDate;
  final double salePrice;

  SaleInfo({
    required this.carInfo,
    required this.buyerInfo,
    required this.purchaseDate,
    required this.salePrice,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) {
    return SaleInfo(
      carInfo: json['carInfo'] as String,
      buyerInfo: json['buyerInfo'] as String,
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      salePrice: (json['salePrice'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'carInfo': carInfo,
      'buyerInfo': buyerInfo,
      'purchaseDate': purchaseDate.toIso8601String(),
      'salePrice': salePrice,
    };
  }
}