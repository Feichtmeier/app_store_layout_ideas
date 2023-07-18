import 'package:flutter/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

const kGridPadding = EdgeInsets.only(
  bottom: kYaruPagePadding,
  left: kYaruPagePadding - 5,
  right: kYaruPagePadding - 5,
);

const kImageGridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
  mainAxisExtent: 120,
  mainAxisSpacing: 10,
  crossAxisSpacing: 10,
  maxCrossAxisExtent: 550,
);
