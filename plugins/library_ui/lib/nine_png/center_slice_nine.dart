import 'package:flutter/material.dart';

// centerSlice 实现 .9 png 效果
class MyNineWidget1 extends StatelessWidget {
  const MyNineWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    double imgHeight = 23;
    return Container(
      constraints: BoxConstraints(
        maxWidth: 250,
        minWidth: 123, // 不能小于图片原始宽！
        maxHeight: imgHeight, // 图片高度
      ),
      decoration: const BoxDecoration(
        // color: Colors.blueGrey,
        image: DecorationImage(
          centerSlice: Rect.fromLTWH(123, 23, 1, 1),
          image: AssetImage(
            "assets/images/bubble_bg_image_1.png",
          ),
          scale: 2,
        ),
      ),
      child: test(imgHeight),
    );
  }

  Widget test(double imgHeight) {
    var normalText = Padding(
      padding: const EdgeInsets.only(top: 5),
      child: SizedBox(
        height: imgHeight,
        child: const Text(
          '卡都是发得法卡都是发卡',
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );

    // return normalText;

    return SizedBox(
      height: imgHeight,
      child: const Text.rich(
        TextSpan(
          text: "开户成功送",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            // fontWeight: 700,
          ),
          children: [
            TextSpan(
              text: "150 HSK",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

}


class MyNineWidget3 extends StatelessWidget {
  const MyNineWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    double imgHeight = 28;
    return Container(
      constraints: BoxConstraints(
        maxWidth: 250,
        minWidth: 130,  // 不能小于图片原始宽！
        maxHeight: imgHeight, // 图片高度
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
        padding: const EdgeInsets.only(left: 32, right: 8, top: 5),
        child: test(imgHeight),
      ),
    );
  }

  Widget test(double imgHeight) {
    var normalText = SizedBox(
      height: imgHeight,
      child: const Text(
        '卡都是发得法卡都是发卡都',
        maxLines: 1,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontStyle: FontStyle.italic,
        ),
      ),
    );

    return SizedBox(
      height: imgHeight,
      child: const Text.rich(
        TextSpan(
          text: "升级享",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            // fontWeight: 700,
          ),
          children: [
            TextSpan(
              text: "150 HSK",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
