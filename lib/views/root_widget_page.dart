import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/controllers/bloc/stock/stock_bloc.dart';
import 'package:stock_watchlist/controllers/data/stock_data.dart';
import 'package:stock_watchlist/core/utils/navigator_key.dart';
import 'package:stock_watchlist/controllers/bloc/navigation/navigation_cubit.dart';
import 'package:stock_watchlist/views/pages/home/home_page.dart';
import 'package:stock_watchlist/views/pages/main_tab/main_tab.dart';
import 'package:stock_watchlist/views/pages/watchlist/watchlist_page.dart';

class RootWidgetPage extends StatelessWidget {
  const RootWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => StockBloc(
            stockData: StockData(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        initialRoute: '/main_tab',
        routes: {
          '/main_tab': (context) => const MainTab(),
          '/home_page': (context) => HomePage(),
          '/watchlist_page': (context) => const WatchlistPage(),
        },
      ),
    );
  }
}
