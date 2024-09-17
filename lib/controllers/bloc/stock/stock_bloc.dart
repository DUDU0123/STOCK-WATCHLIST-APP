import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stock_watchlist/controllers/data/stock_data.dart';
import 'package:stock_watchlist/core/utils/dialog_snackbar_helper.dart';
import 'package:stock_watchlist/core/utils/navigator_key.dart';
import 'package:stock_watchlist/models/stock_model.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final StockData stockData;
  StockBloc({required this.stockData}) : super(StockInitial()) {
    on<GetAllStocksFromDBEvent>(getAllStocksFromDBEvent);
    on<AddStockEvent>(addStockEvent);
    on<DeleteStockEvent>(deleteStockEvent);
    on<GetStocksFromApiEvent>(getStocksFromApiEvent);
  }

   FutureOr<void> getAllStocksFromDBEvent(
      GetAllStocksFromDBEvent event, Emitter<StockState> emit) {
    try {
      final stockList = stockData.getAllStocksFromBox();
      emit(StockState(
        stockList: stockList,
      ));
    } catch (e) {
      emit(StockErrorState(errorMessage: e.toString()));
    }
  }

  Future<FutureOr<void>> addStockEvent(
      AddStockEvent event, Emitter<StockState> emit) async {
    try {
      final value = await stockData.addToBox(stockModel: event.stockModel);
      if (value) {
        DialogSnackbarHelper.showSnackbar(context: navigatorKey!.currentContext!, snackBarContent: 'Added to watchlist');
      }
      
    } catch (e) {
      emit(StockErrorState(errorMessage: e.toString()));
    }
  }

  Future<FutureOr<void>> deleteStockEvent(
      DeleteStockEvent event, Emitter<StockState> emit) async {
    try {
      final value = await stockData.deleteFromBox(stockID: event.stockID);
      if (value) {
        add(GetAllStocksFromDBEvent());
      } else {
        emit(const StockErrorState(errorMessage: 'Unable to delete'));
      }
    } catch (e) {
      emit(StockErrorState(errorMessage: e.toString()));
    }
  }
  Future<FutureOr<void>> getStocksFromApiEvent(
      GetStocksFromApiEvent event, Emitter<StockState> emit) async {
    emit(StockLoadingState());
    if (event.searchQuery.isEmpty) {
      emit(state.copyWith(searchedList:Future.value(<StockModel>[])));
    }
    try {
     final searchedStocks = stockData.getCompanies(companyName: event.searchQuery);
     log(searchedStocks.toString());
     emit(state.copyWith(searchedList: searchedStocks));
    } catch (e) {
      emit(StockErrorState(errorMessage: e.toString()));
    }
  }
}
