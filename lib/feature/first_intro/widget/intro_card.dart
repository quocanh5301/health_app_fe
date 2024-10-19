import 'package:flutter/material.dart';
import 'package:health_app_flutter/util/styles.dart';

class IntroCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const IntroCard(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: ["64b5f6".toColor(), "ffcc80".toColor()],
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.fill,
            height: AppStyles.height(200),
          ),
          const VerticalSpace(20),
          Text(
            title,
            style: AppStyles.f19sb(),
          ),
          const VerticalSpace(10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppStyles.f17m(),
          ),
        ],
      ),
    );
  }
}
