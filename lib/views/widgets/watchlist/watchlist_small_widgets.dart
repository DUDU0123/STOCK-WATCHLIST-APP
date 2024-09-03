  import 'package:flutter/material.dart';
import 'package:stock_watchlist/core/constants/colors.dart';
import 'package:stock_watchlist/views/widgets/common_widgets/text_widget_common.dart';

TableCell bodyTableCell({
    required String text,
  }) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: TextWidgetCommon(
          textColor: kBlack,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
          text: text,
        ),
      ),
    );
  }

  TableCell titletableCell({
    required String title,
  }) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: titleText(titleText: title),
      ),
    );
  }

  Widget titleText({
    required String titleText,
  }) {
    return TextWidgetCommon(
      text: titleText,
      textColor: kGreen,
      fontWeight: FontWeight.bold,
      textAlign: TextAlign.center,
    );
  }