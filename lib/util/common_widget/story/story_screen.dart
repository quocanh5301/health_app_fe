import 'package:flutter/material.dart';
import 'package:health_app_flutter/data/model/story_model.dart';
import 'package:health_app_flutter/util/common_widget/story/story_view.dart';

class StoryScreen extends StatelessWidget {
  final List<StoryModel> stories = [
    StoryModel(
      text: "Welcome to my first story!",
      backgroundImage: "https://cdni.iconscout.com/illustration/premium/thumb/adult-man-guiding-people-illustration-download-in-svg-png-gif-file-formats--male-guide-technologies-pack-illustrations-3944009.png",
      duration: 9,
    ),
    StoryModel(
      text: "Here's a tip for today.",
      backgroundImage: 'https://cdni.iconscout.com/illustration/premium/thumb/adult-man-guiding-people-illustration-download-in-svg-png-gif-file-formats--male-guide-technologies-pack-illustrations-3944009.png',
      duration: 6,
    ),
    StoryModel(
      text: "Don't forget to smile :)",
      backgroundImage: 'https://cdni.iconscout.com/illustration/premium/thumb/adult-man-guiding-people-illustration-download-in-svg-png-gif-file-formats--male-guide-technologies-pack-illustrations-3944009.png',
      duration: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StoryView(stories: stories),
    );
  }
}
