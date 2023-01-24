import 'package:flutter/material.dart';
import 'package:instagram_story_details_app/triangle_widget.dart';
import 'package:instagram_story_details_app/widgets/alick_pic.dart';
import 'package:instagram_story_details_app/widgets/icon_with_text_widget.dart';
import 'package:instagram_story_details_app/widgets/logo_pic.dart';
import 'package:video_player/video_player.dart';

class InstagramStoryDetails extends StatefulWidget {
  const InstagramStoryDetails({Key? key}) : super(key: key);

  @override
  State<InstagramStoryDetails> createState() => _InstagramStoryDetailsState();
}

class _InstagramStoryDetailsState extends State<InstagramStoryDetails> {
  late VideoPlayerController _videoPlayerCtrl;
  bool isShowingStory = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerCtrl = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )
      ..initialize().then((value) => setState(() {}))
      ..play()
      ..setLooping(true);
  }

  double _getStoryHeight(double height) {
    if (isShowingStory) {
      return height - 100;
    } else {
      return height * 0.2 - 55;
    }
  }

  double _getStoryWidth(double width) {
    if (isShowingStory) {
      return width - 16;
    } else {
      return width * 0.15;
    }
  }

  double _getStoryDetailsHeight(double height) {
    if (isShowingStory) {
      return 0;
    } else {
      return height * 0.8;
    }
  }

  void _onVerticalDragUpdate(DragUpdateDetails dragUpdateDetails) {
    if (dragUpdateDetails.delta.dy < -0.7) {
      setState(() {
        isShowingStory = false;
      });
    } else {
      setState(() {
        isShowingStory = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top + 16;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    const animationDuration = Duration(milliseconds: 300);

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragUpdate: _onVerticalDragUpdate,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: animationDuration,
              curve: Curves.easeIn,
              top: paddingTop,
              height: _getStoryHeight(height),
              width: _getStoryWidth(width),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: _videoPlayerCtrl.value.isInitialized
                    ? VideoPlayer(_videoPlayerCtrl)
                    : const SizedBox.shrink(),
              ),
            ),
            if (isShowingStory)
              Positioned(
                bottom: 0,
                left: 16,
                right: 16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        LogoPic(),
                        Text(
                          'Activity',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        IconWithTextWidget(
                          text: 'Create',
                          icon: Icons.create,
                        ),
                        SizedBox(width: 8),
                        IconWithTextWidget(
                          text: 'Facebook',
                          icon: Icons.face,
                        ),
                        SizedBox(width: 8),
                        IconWithTextWidget(
                          text: 'Highlights',
                          icon: Icons.highlight,
                        ),
                        SizedBox(width: 8),
                        IconWithTextWidget(
                          text: 'More',
                          icon: Icons.more_horiz,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            if (isShowingStory)
              Positioned(
                top: paddingTop + 16,
                left: 16,
                child: Row(
                  children: [
                    const AlickPic(),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Your story',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '  3h',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Boomerang',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: ' by instagram >',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            if (!isShowingStory)
              Positioned(
                top: paddingTop + 16,
                left: 16,
                child: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            Positioned(
              top: paddingTop + 16,
              right: 16,
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            ),
            AnimatedPositioned(
              duration: animationDuration,
              curve: Curves.easeIn,
              left: 0,
              right: 0,
              bottom: 0,
              height: _getStoryDetailsHeight(height),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  if (!isShowingStory)
                    const Positioned(
                      top: -25,
                      child: TriangleWidget(),
                    ),
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: const Color.fromRGBO(33, 33, 33, 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                '25',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          const Text(
                            'Viewers',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ...List.generate(
                            20,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      LogoPic(),
                                      SizedBox(width: 8),
                                      Text(
                                        'Flutter Dicas',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.more_horiz,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.chat_bubble,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
