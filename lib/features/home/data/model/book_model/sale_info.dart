import 'package:bookly/features/home/data/model/book_model/list_price.dart';
import 'package:equatable/equatable.dart';

class SaleInfo extends Equatable {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final ListPrice listPrice;

  const SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    required this.listPrice,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json['country'] as String?,
        saleability: json['saleability'] as String?,
        isEbook: json['isEbook'] as bool?,
        listPrice: json['listPrice'] == null
            ? const ListPrice(amount: 0.0, currencyCode: 'USB')
            : json['listPrice'] as ListPrice,
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'saleability': saleability,
        'isEbook': isEbook,
        'listPrice': listPrice
      };

  @override
  List<Object?> get props => [country, saleability, isEbook, listPrice];
}
