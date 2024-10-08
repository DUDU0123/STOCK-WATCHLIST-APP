import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stock_watchlist/core/constants/colors.dart';
import 'package:stock_watchlist/core/service_keys/service_keys.dart';
import 'package:stock_watchlist/core/utils/dialog_snackbar_helper.dart';
import 'package:stock_watchlist/core/utils/navigator_key.dart';
import 'package:stock_watchlist/models/stock_model.dart';

class StockData {
  final Box<StockModel> stockBox = Hive.box<StockModel>(dbBoxName);

  // delete from box
  Future<bool> deleteFromBox({required int stockID}) async {
    try {
      await stockBox.delete(stockID);
      return true;
    } catch (e) {
      return false;
    }
  }
  // add stock to db
  Future<bool> addToBox({required StockModel stockModel}) async {
    try {
      final stockList = stockBox.values.toList();
      final isAlreadyAdded =
          stockList.any((stock) => stock.companyName == stockModel.companyName);

      if (!isAlreadyAdded) {
        final addedStockId = await stockBox.add(stockModel);
        final updatedStockModel = stockModel.copyWith(id: addedStockId);
        await stockBox.put(addedStockId, updatedStockModel);
        return true;
      } else {
        DialogSnackbarHelper.showSnackbar(
          context: navigatorKey!.currentContext!,
          snackBarContent: "Already added",
        );
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // get all stocks from db
  List<StockModel> getAllStocksFromBox() {
    try {
      final stocks = stockBox.values.toList();
      return stocks;
    } catch (e) {
      return [];
    }
  }

  // list all stocks with company name and price
  Future<List<StockModel>> getCompanies({
    required String companyName,
  }) async {
    try {
      final searchUrl =
          'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$companyName&apikey=$stockMarketApiKey';
      final response = await http.get(Uri.parse(searchUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['bestMatches'] != null && data['bestMatches'] is List) {
          final List<dynamic> symbols = data['bestMatches'];
          final List<StockModel> stocks = [];

          for (var symbol in symbols) {
            final String symbolName = symbol['1. symbol'];
            final String symbolCompanyName = symbol['2. name'];

            final sharePriceUrl =
                'https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=$symbolName&apikey=$stockMarketApiKey';

            final sharePriceResponse = await http.get(Uri.parse(sharePriceUrl));
            if (sharePriceResponse.statusCode == 200) {
              try {
                final priceData = json.decode(sharePriceResponse.body);
                if (priceData['Global Quote'] != null &&
                    priceData['Global Quote']['05. price'] != null) {
                  final String sharePrice =
                      priceData['Global Quote']['05. price'];

                  final stockModel = StockModel(
                    id: null,
                    companyName: symbolCompanyName,
                    sharePrice: sharePrice,
                  );

                  stocks.add(stockModel);
                } else {
                  stocks.add(StockModel(
                    id: null,
                    companyName: symbolCompanyName,
                    sharePrice: 'N/A',
                  ));
                }
              } catch (e) {
                continue;
              }
            }
          }

          return stocks;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } on HttpException catch (e) {
      return [];
    } catch (e) {
      return [];
    }
  }
}
