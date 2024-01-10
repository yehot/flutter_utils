import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class MyWidgetCanvas extends StatelessWidget {
  const MyWidgetCanvas({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getImageFromAssets(imagePath),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
          snapshot.connectionState == ConnectionState.active) {
          return const Text('加载中');
        }
        return CustomPaint(
          painter: ChatBubblePainter(snapshot.data!),
          child: Padding(
            padding: const EdgeInsets.only(left: 80.0, right: 0, top: 8,bottom: 8),
            child: const Text(
              'Flutter 聊化聊化聊化聊化聊化聊化化聊',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Future<ui.Image> getImageFromAssets(String path) async {
    final ImmutableBuffer immutableBuffer = await rootBundle.loadBuffer(path);
    final ui.Codec codec = await ui.instantiateImageCodecFromBuffer(
      immutableBuffer,
    );
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }
}

class ChatBubblePainter extends CustomPainter {
  const ChatBubblePainter(this.image);
  final ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    // canvas drawImageNine 绘制 .9 效果
    canvas.drawImageNine(image, const Rect.fromLTWH(40, 320, 1, 1), Offset.zero & size, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

