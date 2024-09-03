import 'package:flutter/material.dart';
import 'package:stock_watchlist/core/constants/colors.dart';
import 'package:stock_watchlist/views/widgets/home/search_field_widget.dart';
import 'package:stock_watchlist/views/widgets/home/search_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
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
