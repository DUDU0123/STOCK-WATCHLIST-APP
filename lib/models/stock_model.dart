import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'stock_model.g.dart';

@HiveType(typeId: 0)
class StockModel extends Equatable {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? companyName;
  @HiveField(2)
  String? sharePrice;
  @HiveField(3)
  String? symbol;
  StockModel({
    this.id,
    this.companyName,
    this.sharePrice,
    this.symbol,
  });

  StockModel copyWith({
    int? id,
    String? companyName,
    String? sharePrice,
    String? symbol,
  }) {
    return StockModel(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      sharePrice: sharePrice ?? this.sharePrice,
      symbol: symbol ?? this.symbol,
    );
  }

  @override
  List<Object?> get props => [
        id,
        companyName,
        sharePrice,
        symbol,
      ];
}
