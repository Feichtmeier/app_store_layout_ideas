import 'package:app_store_layout_ideas/app_card.dart';
import 'package:app_store_layout_ideas/app_page.dart';
import 'package:app_store_layout_ideas/constants.dart';
import 'package:app_store_layout_ideas/utils.dart';
import 'package:flutter/material.dart';

class AppGrid extends StatefulWidget {
  const AppGrid({
    super.key,
    this.skip = 20,
  });

  final int skip;

  @override
  State<AppGrid> createState() => _AppGridState();
}

class _AppGridState extends State<AppGrid> {
  final _imageIndices = List.generate(4, (index) => index);

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = ScrollController()
    //   ..addListener(() {
    //     if (_controller.position.maxScrollExtent == _controller.offset) {
    //       _updateIndices();
    //     }
    //   });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // void _updateIndices() {
  //   setState(() {
  //     _imageIndices.addAll(
  //       List.generate(
  //         30,
  //         (index) => _imageIndices.length + index,
  //       ),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _imageIndices.length,
      padding: kGridPadding,
      gridDelegate: kImageGridDelegate,
      itemBuilder: (context, i) {
        final info = imageInfo(i, context);
        return AppCard(
          index: i + widget.skip,
          title: info,
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return AppPage(
                url: 'https://picsum.photos/300/300?image=${i + widget.skip}',
                title: info,
              );
            },
          )),
        );
      },
    );
  }
}
