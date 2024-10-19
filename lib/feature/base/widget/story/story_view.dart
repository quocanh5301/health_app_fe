import 'package:flutter/material.dart';
import 'package:health_app_flutter/data/model/story_model.dart';
import 'package:health_app_flutter/feature/base/widget/story/story_progress_bar.dart';
import 'package:health_app_flutter/util/images.dart';
import 'package:health_app_flutter/util/styles.dart';

class StoryView extends StatefulWidget {
  final List<StoryModel> stories;

  const StoryView({super.key, required this.stories});

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late AnimationController _animationController;
  double _verticalDragAmount = 0.0; // Track vertical drag amount

  @override
  void initState() {
    super.initState();
    _initializeAnimationController();
    _startAnimation();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _goToNextStory();
      }
    });
  }

  void _initializeAnimationController() {
    // Initialize the controller with the duration of the first story
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.stories[_currentIndex].duration),
    );
  }

  void _startAnimation() {
    _animationController.duration = Duration(
      seconds: widget.stories[_currentIndex].duration,
    ); // Update duration for the current story
    _animationController.forward(from: 0.0);
    _animationController.addListener(() {
      setState(() {}); // Trigger UI updates on each animation frame
    });
  }

  void _goToNextStory() {
    if (_currentIndex + 1 < widget.stories.length) {
      setState(() {
        _currentIndex += 1;
      });
      _animationController.stop(); // Stop the current animation
    } else {
      // If last story, reset or exit
      // Navigator.pop(context);
      setState(() {
        _currentIndex = 0;
      });
      _animationController.reset(); // Stop the current animation
    }
    _startAnimation(); // Start a new animation with the next story's duration
    _pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          _verticalDragAmount += details.delta.dy;
          // Limit drag amount for smooth effect
          if (_verticalDragAmount > 300) {
            _verticalDragAmount = 301;
          }
        });
      },
      onVerticalDragEnd: (details) {
        debugPrint('Drag end');
        // If dragged down more than a threshold, pop the screen
        if (_verticalDragAmount > 300) {
          // Navigator.pop(context);
          debugPrint('Popped');
        } else {
          // Animate back to original position if not enough drag
          debugPrint('Not Popped');
          setState(() {
            _verticalDragAmount = 0.0;
          });
        }
      },
      child: Stack(
        children: [
          Positioned(
            child: Container(
              color: Colors.black,
              width: AppStyles.screenW,
              height: AppStyles.screenH,
            ),
          ),
          Positioned(
            top: _verticalDragAmount,
            child: Transform.scale(
              scale: 1.0 - (_verticalDragAmount / 1000),
              child: Stack(
                children: [
                  SizedBox(
                    width: AppStyles.screenW,
                    height: AppStyles.screenH,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.stories.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                          _startAnimation();
                        });
                      },
                      itemBuilder: (context, index) {
                        return _buildStory(
                          widget.stories[index],
                          _verticalDragAmount,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 15.0,
                    left: 10.0,
                    right: 10.0,
                    child: Row(
                      children: widget.stories.asMap().entries.map((entry) {
                        return Expanded(
                          child: ProgressBar(
                            value: _currentIndex == entry.key
                                ? _animationController.value
                                : (_currentIndex > entry.key ? 1.0 : 0.0),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStory(StoryModel story, double verticalDragAmount) {
    debugPrint('image: ${story.backgroundImage}');
    return Stack(
      children: [
        story.backgroundImage != ""
            ? Image.network(
                story.backgroundImage,
                fit: BoxFit.cover,
                width: AppStyles.screenW,
                height: AppStyles.screenH,
              )
            : Image.asset(AppImage.imgIntro1),
        Container(
          decoration: BoxDecoration(
            color: story.backgroundImage != ""
                ? Colors.transparent
                : Colors.white,
            borderRadius: verticalDragAmount != 0
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
                : null,
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: "DDF1FF".toColor(),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                story.text,
                style: AppStyles.f20b().copyWith(
                  color: Colors.black,
                  fontSize: 26,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: "DBA510".toColor(),
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

