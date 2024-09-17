import 'package:flutter/material.dart';
import 'package:stock_watchlist/core/constants/colors.dart';
import 'package:stock_watchlist/views/widgets/common_widgets/text_widget_common.dart';

Widget itemTileWidget({
  void Function()? onTap,
   IconData? icon,
   void Function()? trailingButtonAction,
  required String title,
  required String price,
}) {
  return ListTile(
    onTap: onTap,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    tileColor: kGreen.withOpacity(0.4),
    title: TextWidgetCommon(
      text: title,
      fontSize: 18,
      overflow: TextOverflow.ellipsis,
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextWidgetCommon(
          text: price != 'N/A' ? '\$$price' : price,
          fontSize: 12,
          overflow: TextOverflow.ellipsis,
        ),
        IconButton(
          onPressed: trailingButtonAction,
          icon: Icon(
            icon,
            color: kBlack,
            size: 30,
          ),
        ),
      ],
    ),
  );
}
