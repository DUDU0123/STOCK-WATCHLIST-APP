import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stock_watchlist/core/constants/colors.dart';
import 'package:stock_watchlist/models/stock_model.dart';
import 'package:stock_watchlist/views/root_widget_page.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(StockModelAdapter());
  await Hive.openBox<StockModel>(dbBoxName,);
  runApp(const RootWidgetPage());
}
