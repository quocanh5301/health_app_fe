import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseImage extends StatelessWidget {
  const FirebaseImage({
    super.key,
    required this.imagePath,
    required this.cardWidth,
    required this.cardHeight,
    required this.emptyImagePath,
  });

  final String imagePath;
  final double cardWidth;
  final double cardHeight;
  final String emptyImagePath;

  Future<Uint8List?> downloadImage() async {
    if (imagePath != '') {
      final ref = FirebaseStorage.instance.ref().child(imagePath);

      try {
        final Uint8List? downloadData = await ref.getData();
        return downloadData;
      } catch (e) {
        debugPrint('Error download image $imagePath: $e');
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
    // FutureBuilder(
    //   future: downloadImage(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting &&
    //         snapshot.data == null) {
    //       return Container(
    //         height: cardHeight,
    //         width: cardWidth,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(16),
    //           color: Colors.grey.withOpacity(0.5),
    //         ),
    //         child: Center(
    //           child: SizedBox(
    //             height: cardWidth / 3,
    //             width: cardWidth / 3,
    //             child: const CircularProgressIndicator.adaptive(),
    //           ),
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Image.asset(
    //         emptyImagePath,
    //         width: cardWidth,
    //         height: cardHeight,
    //       );
    //     } else if (snapshot.data == null) {
    //       return Image.asset(
    //         emptyImagePath,
    //         width: cardWidth,
    //         height: cardHeight,
    //       );
    //     } else {
    //       return Image.memory(
    //         snapshot.data!,
    //         fit: BoxFit.cover,
    //         width: cardWidth,
    //         height: cardHeight,
    //       );
    //     }
    //   },
    // );
    Image.asset(
          emptyImagePath,
          width: cardWidth,
          height: cardHeight,
        );
  }
}
