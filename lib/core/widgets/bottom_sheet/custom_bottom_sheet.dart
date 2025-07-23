import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

Future<T?> customCupertinoModalPopup<T>(
  BuildContext context, {
  required void Function() actionOne,
  required void Function() actionTwo,
  String title = "",
  String actionTitleOne = "",
  String actionTitleTwo = "",
}) async =>
    showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        title: Text(title),
        actions: <Widget>[
          CupertinoActionSheetAction(
            onPressed: actionOne,
            child: Text(actionTitleOne),
          ),
          CupertinoActionSheetAction(
            onPressed: actionTwo,
            child: Text(actionTitleTwo),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );

typedef WidgetScrollBuilder = Widget Function(
  BuildContext context,
  ScrollController? controller,
);
Future<T?> customModalBottomSheet<T>({
  required BuildContext context,

  required WidgetScrollBuilder builder,
  bool isScrollControlled = false,
  bool enableDrag = true,
  Color? backgroundColor
}) async =>
    showModalBottomSheet(
      backgroundColor: backgroundColor,
      context: context,
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
      showDragHandle: false,
      // constraints: BoxConstraints(
      //   maxHeight: context.kSize.height * 1,
      //   minHeight: context.kSize.height * 0.1,
      // ),
      builder: (_) {
        if (isScrollControlled) {
          return DraggableScrollableSheet(
            initialChildSize: 1,
            minChildSize: 0.05,
            expand: false,
            snap: true,
            builder: (BuildContext context, ScrollController controller) =>
                builder(context, controller),
          );
        } else {
          return builder(context, null);
        }
      },
    );
