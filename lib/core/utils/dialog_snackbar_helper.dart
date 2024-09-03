import 'package:flutter/material.dart';
import 'package:stock_watchlist/core/constants/colors.dart';
import 'package:stock_watchlist/core/utils/navigator_key.dart';
import 'package:stock_watchlist/views/widgets/common_widgets/text_widget_common.dart';

class DialogSnackbarHelper {
 static void showDialogBox({
    required BuildContext context,
    required String dialogTitle,
    required String dialogContent,
    required String actionButtonName,
    required void Function()? buttonActionMethod,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: TextWidgetCommon(
          text: dialogTitle,
          fontSize: 18,
        ),
        content: TextWidgetCommon(
          fontSize: 16,
          text: dialogContent,
        ),
        actions: [
          commonTextButton(
            textColor: kBlack,
            buttonActionMethod: () {
              navigatorKey?.currentState?.pop();
            },
            buttonText: 'Cancel',
          ),
          commonTextButton(
            textColor: kBlack,
            buttonActionMethod: buttonActionMethod,
            buttonText: actionButtonName,
          ),
        ],
      ),
    );
  }

 static void showSnackbar({
    required BuildContext context,
    required String snackBarContent,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: TextWidgetCommon(
          text: snackBarContent,textColor: kWhite,
          fontSize: 16,
        ),
        backgroundColor: kBlack,
        duration: const Duration(seconds: 2,),
      ),
    );
  }
}
Widget commonTextButton({
  required String buttonText,
  required void Function()? buttonActionMethod,
  Color? textColor,
}) {
  return TextButton(
    onPressed: buttonActionMethod,
    child: TextWidgetCommon(
      textColor: textColor,
      fontSize: 18,
      text: buttonText,
    ),
  );
}
