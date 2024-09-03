import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/controllers/bloc/stock/stock_bloc.dart';
import 'package:stock_watchlist/core/constants/colors.dart';
import 'package:stock_watchlist/core/utils/dialog_snackbar_helper.dart';
import 'package:stock_watchlist/core/utils/navigator_key.dart';
import 'package:stock_watchlist/views/widgets/common_widgets/common_small_widgets.dart';
import 'package:stock_watchlist/views/widgets/watchlist/watchlist_small_widgets.dart';
BlocBuilder<StockBloc, StockState> watchlistItemsTableWidget() {
  return BlocBuilder<StockBloc, StockState>(
    builder: (context, state) {
      if (state.stockList == null) {
        return commonEmptyWidget();
      }
      if (state.stockList!.isEmpty) {
        return commonEmptyWidget();
      }
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.all(
                width: 2,
                color: kGreen,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            children: [
              TableRow(
                decoration: const BoxDecoration(
                    // color: kAmber,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                children: [
                  titletableCell(title: "Company"),
                  titletableCell(title: "Share Price"),
                  titletableCell(title: "Action"),
                ],
              ),
              ...List.generate(
                state.stockList!.length,
                (index) {
                  final companyName = state.stockList![index].companyName!;
                  final sharePrice = state.stockList![index].sharePrice!;
                  return TableRow(
                    children: [
                      bodyTableCell(text: companyName),
                      bodyTableCell(
                        text:
                            sharePrice != 'N/A' ? "\$$sharePrice" : sharePrice,
                      ),
                      IconButton(
                        onPressed: () {
                          DialogSnackbarHelper.showDialogBox(
                            context: context,
                            dialogTitle: 'Delete',
                            dialogContent:
                                'Are you sure to delete this item from watchlist?',
                            actionButtonName: 'Delete',
                            buttonActionMethod: () {
                              if (state.stockList![index].id != null) {
                                context.read<StockBloc>().add(DeleteStockEvent(
                                    stockID: state.stockList![index].id!));
                              }
                              navigatorKey?.currentState?.pop();
                            },
                          );
                        },
                        icon: const Icon(Icons.delete),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      );
    },
  );
}