import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'stock_model.g.dart';
@HiveType(typeId: 0)
class StockModel extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? companyName;
  @HiveField(2)
  final String? sharePrice;
  const StockModel({
    this.id,
    this.companyName,
    this.sharePrice,
  });

  StockModel copyWith({
    int? id,
    String? companyName,
    String? sharePrice,
  }){
    return StockModel(
      id: id?? this.id,
      companyName: companyName?? this.companyName,
      sharePrice: sharePrice?? this.sharePrice,
    );
  }

  @override
  List<Object?> get props => [id, companyName, sharePrice];
}
