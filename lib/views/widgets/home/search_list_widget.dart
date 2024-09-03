import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/controllers/bloc/stock/stock_bloc.dart';
import 'package:stock_watchlist/core/constants/height_width.dart';
import 'package:stock_watchlist/core/utils/dialog_snackbar_helper.dart';
import 'package:stock_watchlist/core/utils/navigator_key.dart';
import 'package:stock_watchlist/views/widgets/common_widgets/common_small_widgets.dart';
import 'package:stock_watchlist/views/widgets/common_widgets/item_tile_widget.dart';

BlocBuilder<StockBloc, StockState> searchListWidget() {
  return BlocBuilder<StockBloc, StockState>(
    builder: (context, state) {
      if (state is StockLoadingState) {
        return const Center(child: CircularProgressIndicator(),);
      }
      if (state.searchedList == null) {
        return commonEmptyWidget();
      }
      if (state.searchedList!.isEmpty) {
        return commonEmptyWidget();
      }
      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemBuilder: (context, index) => itemTileWidget(
          title: state.searchedList![index].companyName ?? '',
          trailingButtonAction: () {
            //add to watchlist

            DialogSnackbarHelper.showDialogBox(
              context: context,
              dialogTitle: 'Add to watchlist',
              dialogContent: 'Do you want to add this item to watchlist?',
              actionButtonName: 'Add',
              buttonActionMethod: () {
                context
                    .read<StockBloc>()
                    .add(AddStockEvent(stockModel: state.searchedList![index]));
                navigatorKey?.currentState?.pop();
              },
            );
          },
          icon: Icons.add_circle_outline_sharp,
        ),
        separatorBuilder: (context, index) => kHeight10,
        itemCount: 10,
      );
    },
  );
}