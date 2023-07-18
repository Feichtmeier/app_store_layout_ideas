import 'dart:convert';

import 'package:app_store_layout_ideas/image_information.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;

FutureBuilder<ImageInformation> imageInfo(int index, BuildContext context) {
  final theme = Theme.of(context);

  return FutureBuilder(
    future: _loadImageInfo(id: index),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const Row(
          children: [
            Icon(Icons.question_mark),
          ],
        );
      } else {
        if (snapshot.hasData) {
          return Text(snapshot.data!.author);
        } else {
          return Shimmer.fromColors(
            baseColor: theme.colorScheme.onSurface.withOpacity(0.05),
            highlightColor: theme.colorScheme.onSurface.withOpacity(0.1),
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.background,
                borderRadius: BorderRadius.circular(8),
              ),
              height: 23,
              width: 150,
            ),
          );
        }
      }
    },
  );
}

Future<ImageInformation> _loadImageInfo({required int id}) async {
  final address = 'https://picsum.photos/id/$id/info';
  final uri = Uri.parse(address);
  final response = await http.get(uri);

  if (response.statusCode != 200) {
    return Future.error('Could not find $address');
  }
  return ImageInformation.fromJson(jsonDecode(response.body));
}
