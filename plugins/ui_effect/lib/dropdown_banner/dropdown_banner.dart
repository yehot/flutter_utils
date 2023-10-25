import 'dart:async';
import 'package:flutter/material.dart';
import 'notification_center.dart';

/// Channel name to communicate menu updates on
const String _kBannerChannel = 'createDropdownBanner';

typedef void _IntCallback(int id);

// 实现逻辑：
// 1. 首先在 Material App 的 home 的 root 节点包 Banner 容器 (才能保证任何页面都能 show 出来)
// 2. 用 notification center 发通知，保证任何页面都能调用 show 方法
// 3. 在 Banner Widget 放一个 Stack 放 child（app 的 root widget）
//  stack 上叠加 一个一个的 小 banner，show 时，设置定时器自动消失并 dispose；
//    用 AnimatedPositioned 设置出现的动画，
//    多个层叠的 banner 覆盖动画，直接是 stack 上的重叠，再加 show、hide 定时器就自动实现了

/// DropdownBanner manages the creation and animation of banner elements
/// that are useful for displaying warnings and updates to users.
class DropdownBanner extends StatefulWidget {
  /// Builder in which to construct the app content that you are wrapping
  final Widget child;

  DropdownBanner({required this.child}) {
    DartNotificationCenter.registerChannel(channel: _kBannerChannel);
  }

  /// Used to track banners uniquely
  static int _idCounter = 1;

  /// Display a banner with the desired [text] and [textStyle] on a [color] background
  /// for the [duration] specified. If the banner is tapped and [tapCallback] != null,
  /// the callback will be executed and the banner dismissed.
  static showBanner({
    required String title,
    required String content,
    Duration? duration,
    Color? color,
    TextStyle? textStyle,
    VoidCallback? tapCallback,
  }) {
    DartNotificationCenter.post(
      channel: _kBannerChannel,
      options: {
        'id': _idCounter,
        'duration': duration ?? Duration(seconds: 3),
        'title': title,
        'content' : content,
        'color': color ?? Colors.white,
        'textStyle': textStyle,
        'tapCallback': tapCallback,
      },
    );

    // Increment counter for next use
    ++_idCounter;
  }

  @override
  State<StatefulWidget> createState() => _DropdownBannerState();
}

class _DropdownBannerState extends State<DropdownBanner> {
  List<_BannerInstance> banners = [];

  @override
  void initState() {
    super.initState();

    // Get notified when a Banner is requested to be created
    DartNotificationCenter.subscribe(
      channel: _kBannerChannel,
      observer: this,
      onNotification: createBanner,
    );
  }

  @override
  void dispose() {
    DartNotificationCenter.unsubscribe(observer: this);

    banners = [];

    super.dispose();
  }

  void createBanner(dynamic bannerDetails) {
    // Ensure that the call to create the banner was from within the Library
    assert(
      bannerDetails is Map<String, dynamic> && bannerDetails['id'] is int,
      'Do not post to $_kBannerChannel using DartNotificationCenter, as this is reserved for internal use for DropdownBanner to work properly.',
    );

    // Add banner to banners, and display
    setState(() {
      var banner = _BannerInstance(
        id: bannerDetails['id'],
        duration: bannerDetails['duration'],
        title: bannerDetails['title'],
        content: bannerDetails['content'],
        color: bannerDetails['color'],
        textStyle: bannerDetails['textStyle'],
        tapAction: bannerDetails['tapCallback'],
        onCompletion: onAnimationCompletion,
      );
      banners.add(banner);
    });
  }

  /// Callback for removing banner from banner queue
  void onAnimationCompletion(int id) =>
      setState(() => banners.removeWhere((b) => b.id == id));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child,
        ...banners
      ],
    );
  }
}

/// Container to track various aspects of the appearance and life of a dropdown banner object
class _BannerInstance extends StatefulWidget {

  _BannerInstance({
    required this.id,
    required this.duration,
    required this.title,
    required this.content,
    required this.color,
    required this.textStyle,
    required this.tapAction,
    required this.onCompletion
  });

  /// Identify unique state between rebuilds
  final Key key = UniqueKey();

  /// Unique id for referencing
  final int id;

  /// Length of time the banner stays visible for
  final Duration duration;

  /// title to display in the banner
  final String title;
  /// content to display in the banner
  final String content;

  /// Color of the banner
  final Color color;

  /// Style for the text displayed
  final TextStyle textStyle;

  /// Action to perform on tap
  final VoidCallback tapAction;

  /// Callback to remove from parent render tree
  final _IntCallback onCompletion;

  @override
  createState() => _BannerInstanceState();
}

class _BannerInstanceState extends State<_BannerInstance> {
  /// Whether the banner is being presented or removed
  bool isActive = true;

  /// The timer for removing banner from screen (if not tapped first)
  Timer? timer;

  /// The height of the banner being presented (for animating it in/out)
  double? bannerHeight;

  final double padding = 8;
  final double contentHeight = 88;

  @override
  void initState() {
    super.initState();

    // Create the timer for dismissing banner after specified duration has passed
    timer = Timer(
      widget.duration,
      () {
        // Only dismiss if we have not already dismissed
        if (isActive) dismissAndDispose();
      },
    );

    // Get size of banner after first render pass
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      setState(() => this.bannerHeight = context.size?.height);
    });
  }

  void dismissAndDispose([TapUpDetails? details]) {
    // Cancel delayed timer
    timer?.cancel();

    // Dismiss banner
    setState(() => isActive = false);

    // Only call tapAction if it exists, and if banner was dismissed from a tap action
    if (details != null) widget.tapAction();

    // Remove as soon as animation is done
    Timer(
      Duration(milliseconds: 200),
      () => widget.onCompletion(widget.id),
    );
  }

  Widget buildBody() {

    bool hasTitle = widget.title.length > 0;
    List<Widget> titleList = !hasTitle ? [] : [
      Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]
      ),
      SizedBox(height: 4,),
    ];

    return Material(
      type: MaterialType.transparency,
      child: Container(
        height: contentHeight,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x1F000000),
              offset: Offset(0, 1.75),
              blurRadius: 3.5,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            ...titleList,
            Expanded(
              child: Row(
                crossAxisAlignment: hasTitle ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      widget.content,
                      maxLines: hasTitle ? 2 : 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  build(BuildContext context) {
    final top = bannerHeight == null ? -120.0 : (isActive ? 0.0 : -(bannerHeight ?? 0));

    return AnimatedPositioned(
      key: widget.key,
      left: padding,
      right: padding,
      top: top,
      duration: Duration(milliseconds: 180),
      child: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTapUp: dismissAndDispose,
          onVerticalDragEnd: (details) {
            if (details.primaryVelocity == null) {
              return;
            }
            if (details.primaryVelocity! < 0) dismissAndDispose();
          },
          child: buildBody(),
        ),
      ),
    );
  }
}
