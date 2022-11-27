import 'package:flutter/material.dart';
import 'package:spotfy_ui_clone/components/album_card.dart';

class AlbumCardList extends StatelessWidget {
  final double viewHeight;
  final List data;
  final Function onAlbumTap;
  const AlbumCardList({
    super.key,
    required this.viewHeight,
    required this.data,
    required this.onAlbumTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: viewHeight * 0.24,
      child: ListView.builder(
        itemCount: data.isEmpty ? 0 : data.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return Container(
            margin: const EdgeInsets.only(right: 20, top: 20),
            child: AlbumCard(data: data, index: index, onTap: onAlbumTap),
          );
        },
      ),
    );
  }
}
