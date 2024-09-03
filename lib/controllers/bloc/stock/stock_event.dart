part of 'stock_bloc.dart';

sealed class StockEvent extends Equatable {
  const StockEvent();

  @override
  List<Object> get props => [];
}
class GetStocksFromApiEvent extends StockEvent {
  final String searchQuery;
  const GetStocksFromApiEvent({
    required this.searchQuery,
  });
  @override
  List<Object> get props => [searchQuery,];
}
class GetAllStocksFromDBEvent extends StockEvent{}
class DeleteStockEvent extends StockEvent {
  final int stockID;
  const DeleteStockEvent({
    required this.stockID,
  });
  @override
  List<Object> get props => [stockID,];
}
class AddStockEvent extends StockEvent {
  final StockModel stockModel;
  const AddStockEvent({
    required this.stockModel,
  });
  @override
  List<Object> get props => [stockModel,];
}
