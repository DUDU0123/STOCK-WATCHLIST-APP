import 'package:flutter/material.dart';
import 'package:stock_watchlist/core/constants/colors.dart';
import 'package:stock_watchlist/views/widgets/common_widgets/text_widget_common.dart';

Widget commonEmptyWidget({String? text}) => Center(
      child: TextWidgetCommon(
        text: text??"No data available",
        textColor: kGrey,
      ),
    );
