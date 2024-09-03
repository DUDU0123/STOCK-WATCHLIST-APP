import 'package:flutter/material.dart';
import 'package:stock_watchlist/core/constants/colors.dart';
import 'package:stock_watchlist/views/widgets/common_widgets/text_widget_common.dart';

Widget commonEmptyWidget() => const Center(
      child: TextWidgetCommon(
        text: "No data available",
        textColor: kGrey,
      ),
    );
