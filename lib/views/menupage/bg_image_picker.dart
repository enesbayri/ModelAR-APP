import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modelar/porviders/all_providers.dart';
import 'package:modelar/views/menupage/future_content.dart';
import 'package:modelar/views/menupage/image_builder.dart';

class BgImagePicker extends ConsumerWidget {
  const BgImagePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isPressed = ref.watch(bgImagePickerIspressed);
    return SafeArea(
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              ref.read(bgImagePickerIspressed.notifier).state = true;
            },
            borderRadius: BorderRadius.circular(20),
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isPressed ? MediaQuery.of(context).size.width : 100,
                height: isPressed ? MediaQuery.of(context).size.height : 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(4, 4),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                  color: Colors.black87,
                  gradient: LinearGradient(
                    begin: (isPressed
                        ? Alignment.topCenter
                        : Alignment.bottomRight),
                    end: (isPressed
                        ? Alignment.bottomCenter
                        : Alignment.topLeft),
                    colors: [
                      Colors.grey.shade700,
                      Colors.black,
                    ],
                  ),
                ),
                child: isPressed ? FutureContent(content: ImageBuilder()) :  FutureContent(content: Center(child: Text("Sahneler"),)) ),
          ),
          isPressed ? FutureContent(content: OutlinedButton(
            onPressed: () {
              ref.read(bgImagePickerIspressed.notifier).state = (!isPressed);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),) : Container()
        ],
      ),
    );
  }
}
