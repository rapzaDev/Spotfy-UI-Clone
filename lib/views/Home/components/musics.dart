import 'package:flutter/material.dart';

class MusicsList extends StatelessWidget {
  final List data;
  final double height;
  final double width;
  const MusicsList({
    super.key,
    required this.data,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.41,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 2.8,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(
                          data[index]["image"],
                        ),
                        height: 80,
                        width: 50,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        data[index]["label"],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: data.length,
            ),
          ),
        ],
      ),
    );
  }
}
