import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/controllers/bloc/stock/stock_bloc.dart';
import 'package:stock_watchlist/core/constants/colors.dart';
import 'package:stock_watchlist/core/constants/height_width.dart';
import 'package:stock_watchlist/views/widgets/common_widgets/textfield_widget_common.dart';
import 'package:stock_watchlist/views/widgets/home/search_list_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final SearchController searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: kGrey.withOpacity(0.3),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.search,
                    color: kBlack,
                  ),
                ),
                kWidth10,
                Expanded(
                  child: TextFieldCommon(
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                    hintText: 'Search....',
                    border: InputBorder.none,
                    onChanged: (value) {
                      context.read<StockBloc>().add(
                            GetStocksFromApiEvent(
                              searchQuery: value,
                            ),
                          );
                    },
                  ),
                ),
                kWidth10,
              ],
            ),
          ),
          Expanded(
            child: searchListWidget(),
          )
        ],
      ),
    );
  }
}
