// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerPage extends StatefulWidget {
  final List<String> videoUrls;
  final int startIndex;

  const VideoPlayerPage({required this.videoUrls, required this.startIndex});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late PageController _pageController;
  Map<int, VideoPlayerController> _controllers = {};
  int _currentIndex = 0;
  bool _isVideoPaused = false;
  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.startIndex);
    _currentIndex = widget.startIndex;
    _initializeController(_currentIndex);
  }

  Future<void> _initializeController(int index) async {
    if (_controllers.containsKey(index)) return;

    try {
      final controller = VideoPlayerController.network(
        widget.videoUrls[index],
      );

      await controller.initialize();
      controller.setLooping(true);
      _controllers[index] = controller;
      if (controller.value.isInitialized) {
        controller.play();
        _isVideoPaused = false; // Set video as playing
      }

      if (mounted) setState(() {});
    } catch (e) {
      print("Error loading video $index: $e");
    }
  }

  void _onPageChanged(int index) {
    if (_controllers.containsKey(_currentIndex)) {
      _controllers[_currentIndex]?.pause();
      _isVideoPaused = true; // Mark video as paused when the page changes
    }
    _currentIndex = index;
    _initializeController(index);
    _controllers[_currentIndex]?.play();
    _isVideoPaused = false; // Video is playing after initialization
  }

  void _togglePlayPause() {
    if (_controllers.containsKey(_currentIndex)) {
      final controller = _controllers[_currentIndex];

      if (controller!.value.isPlaying) {
        controller.pause();
        _isVideoPaused = true; // Set video as paused
      } else {
        controller.play();
        _isVideoPaused = false; // Set video as playing
      }

      setState(() {});
    }
  }

  void _onScrollStart(DragStartDetails details) {
    setState(() {
      _isScrolling = true; // User starts scrolling
    });
  }

  void _onScrollEnd(DragEndDetails details) {
    setState(() {
      _isScrolling = false; // User stops scrolling
    });
  }

  @override
  void dispose() {
    // Dispose all video controllers to release resources
    _controllers.values.forEach((controller) {
      controller.dispose();
    });
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: GestureDetector(
        onTap: _togglePlayPause, // Detect tap to toggle play/pause
        onPanStart: _onScrollStart, // Detect start of scroll
        onPanEnd: _onScrollEnd, // Detect end of scroll
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          scrollDirection: Axis.vertical,
          itemCount: widget.videoUrls.length,
          itemBuilder: (context, index) {
            final controller = _controllers[index];

            return Stack(
              children: [
                // Check if the video controller is initialized, then show the video
                controller?.value.isInitialized ?? false
                    ? VideoPlayer(controller!)
                    : Center(
                        child: CircularProgressIndicator(
                          color: whiteColor,
                        ),
                      ),

                _appBar(),

                // Show the play circle only if the video is paused and not scrolling
                if (!_isScrolling &&
                    _isVideoPaused &&
                    (controller?.value.isInitialized ?? false) &&
                    !(controller?.value.isPlaying ?? false))
                  Center(
                    child: Image.asset(
                      AppAssets().playCircle,
                      scale: 2,
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0, right: 20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomCenter,
                          children: [
                            CircleAvatar(
                              radius: 30.r,
                              backgroundImage:
                                  AssetImage(AppAssets().profileImage),
                            ),
                            Positioned(
                              bottom: -6,
                              child: Image.asset(
                                AppAssets().follow,
                                scale: 3.5,
                              ),
                            ),
                          ],
                        ),
                        20.verticalSpace,
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppAssets().like, scale: 3),
                        ),
                        Text(
                          "21.5k",
                          style: style14.copyWith(color: whiteColor),
                        ),
                        10.verticalSpace,
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppAssets().share, scale: 3),
                        ),
                        Text(
                          "21.5k",
                          style: style14.copyWith(color: whiteColor),
                        ),
                        10.verticalSpace,
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppAssets().views, scale: 3),
                        ),
                        Text(
                          "21.5k",
                          style: style14.copyWith(color: whiteColor),
                        ),
                        10.verticalSpace,
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppAssets().addFav, scale: 3),
                        ),
                        Text(
                          "21.5k",
                          style: style14.copyWith(color: whiteColor),
                        ),
                        10.verticalSpace,
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppAssets().repost, scale: 3),
                        ),
                        Text(
                          "21.5k",
                          style: style14.copyWith(color: whiteColor),
                        ),
                        10.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

_appBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  AppAssets().backicon,
                  scale: 3,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                "Reels",
                style: style20B.copyWith(color: whiteColor),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            AppAssets().searchicon2,
            color: whiteColor,
            scale: 3,
          ),
        ),
      ],
    ),
  );
}
