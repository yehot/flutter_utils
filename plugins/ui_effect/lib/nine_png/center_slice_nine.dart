import 'package:flutter/material.dart';

// centerSlice 实现 .9 png 效果
class MyWidget1 extends StatelessWidget {
  const MyWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 250,
        minWidth: 150,
      ),
      decoration: const BoxDecoration(
        // color: Colors.blueGrey,
        image: DecorationImage(
          centerSlice: Rect.fromLTWH(167, 23, 1, 1),
          image: AssetImage(
            "assets/images/bubble_bg_image_4.png",
          ),
          scale: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SizedBox(
          height: 28,
          child: const Text(
            '卡都是发得法卡都是发卡都都是发卡',
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}


class MyWidget3 extends StatelessWidget {
  const MyWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 250,
        minWidth: 130,
        maxHeight: 28,
      ),
      decoration: const BoxDecoration(
        // color: Colors.blueGrey,
        image: DecorationImage(
          centerSlice: Rect.fromLTWH(60, 5, 1, 1),
          image: AssetImage(
            "assets/images/bubble_bg_image_3.png",
          ),
          scale: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 35, right: 8, top: 5),
        child: SizedBox(
          height: 28,
          child: const Text(
            '卡都是发得法卡都是发卡都',
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
