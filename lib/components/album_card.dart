import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  final List data;
  final int index;
  final Function onTap;
  const AlbumCard({
    super.key,
    required this.data,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          Image.asset(
            data[index]["image"],
            width: 120,
            height: 120,
          ),
          const SizedBox(height: 10),
          Text(data[index]["label"]),
        ],
      ),
    );
  }
}
