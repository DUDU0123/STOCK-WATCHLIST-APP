import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/controllers/bloc/stock/stock_bloc.dart';
import 'package:stock_watchlist/core/constants/colors.dart';
import 'package:stock_watchlist/views/widgets/home/search_field_widget.dart';
import 'package:stock_watchlist/views/widgets/home/search_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    @override
  void initState() {
    context.read<StockBloc>().add(
          const GetStocksFromApiEvent(searchQuery: 'a'),
        );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        title: searchFieldWidget(context: context),
      ),
      body: Column(
        children: [
          Expanded(
            child: searchListWidget(),
          )
        ],
      ),
    );
  }
}
