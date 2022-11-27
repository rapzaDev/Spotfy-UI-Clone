import 'package:flutter/material.dart';

class MusicsAndArtists extends StatelessWidget {
  final List data;
  final double screenHeight;
  final String title;
  const MusicsAndArtists({
    super.key,
    required this.data,
    required this.screenHeight,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: screenHeight * 0.24,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            // padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, index) {
              return Container(
                width: 140,
                margin: const EdgeInsets.only(right: 14),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(data[index]["image"]),
                      width: 140,
                      height: 140,
                    ),
                    Text(
                      data[index]["label"],
                      style: Theme.of(context).textTheme.caption,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
