

import 'package:carousel_custom_slider/carousel_custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modelar/database/db.dart';
import 'package:modelar/porviders/all_providers.dart';
import 'package:modelar/router/locator.dart';

class ImageBuilder extends ConsumerWidget {
  ImageBuilder({
    super.key,
  });

  final List<String> imagePaths = List.generate(
    12,
    (index) => 'assets/stagebg/${index + 1}.jpg',
  );

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return CarouselCustomSlider.advancedCarouselSlider(
      initialPage: 0,
      slides: imagePaths,
      height: 90,
      effect: const JumpingDotEffect(activeDotColor: Colors.lightGreen,jumpScale: 1.8),
      viewportFraction: 0.8,
      backgroundColor: Colors.transparent,
      childrenStackBuilder: (index) {
        return InkWell(
          onTap: () async{
            if(ref.read(currentBgImage) != "${index +1}"){
              ref.read(currentBgImage.notifier).state = "${index + 1}";
              await locator<LocalDB>().setBgImgIndex(index+1);
            }
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imagePaths[index]), // Asset görseli
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}

