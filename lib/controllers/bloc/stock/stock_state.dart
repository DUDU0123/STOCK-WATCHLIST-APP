part of 'stock_bloc.dart';

class StockState extends Equatable {
  const StockState({
    this.stockList,
    this.searchedList,
  });
  final List<StockModel>? stockList;
  final Future<List<StockModel>>? searchedList;
  StockState copyWith({
    List<StockModel>? stockList,
    Future<List<StockModel>>? searchedList,
  }) {
    return StockState(
        stockList: stockList ?? this.stockList,
        searchedList: searchedList ?? this.searchedList);
  }

  @override
  List<Object> get props => [
        stockList ?? [],
        searchedList ?? [],
      ];
}

class StockInitial extends StockState {}
class StockLoadingState extends StockState {}

class StockErrorState extends StockState {
  final String errorMessage;
  const StockErrorState({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [
        errorMessage,
      ];
}
