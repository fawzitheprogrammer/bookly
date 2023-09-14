import 'package:equatable/equatable.dart';

class ListPrice extends Equatable {
  final double amount;
  final String currencyCode;

  const ListPrice({required this.amount, required this.currencyCode});

  factory ListPrice.fromJson(Map<String, dynamic> json) => ListPrice(
        amount: json['amount'] as double,
        currencyCode: json['currencyCode'] as String,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount ?? 0.0,
        'currencyCode': currencyCode ?? '',
      };

  @override
  List<Object?> get props => [amount, currencyCode];
}
