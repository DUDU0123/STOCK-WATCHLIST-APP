import 'package:stock_watchlist/core/service_keys/service_keys.dart';
String baseUrl = 'https://www.alphavantage.co/query?function=';
String symbol = '';
String askask =
    'https://www.alphavantage.co/query?function=OVERVIEW&symbol=$symbol&apikey=$stockMarketApiKey';
String sharePriceUrl =
    'https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=$symbol&apikey=$stockMarketApiKey';
