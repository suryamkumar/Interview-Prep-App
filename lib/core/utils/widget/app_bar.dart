import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/extensions/styles.dart';

PreferredSizeWidget appBarWidget({
  required BuildContext context,
  String? title,
  bool? centerTitle,
  bool? automaticallyImplyLeading,
  List<Widget>? actions,
}) => AppBar(
  actions: actions,
  centerTitle: centerTitle,
  automaticallyImplyLeading: automaticallyImplyLeading ?? true,
  title: Text(
    title ?? "",
    style: context.titleLarge.copyWith(fontWeight: FontWeight.bold),
  ),
  bottom: PreferredSize(
    preferredSize: Size.fromHeight(0),
    child: Divider(height: 1, thickness: .5),
  ),
);
