
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modelar/database/db.dart';
import 'package:modelar/porviders/all_providers.dart';
import 'package:modelar/router/locator.dart';
import 'package:modelar/views/menupage/bg_image_picker.dart';
import 'package:modelar/views/menupage/menu_content.dart';


class MenuPage extends ConsumerStatefulWidget {
  const MenuPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MenuPageState();
}

class _MenuPageState extends ConsumerState<MenuPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final index = locator<LocalDB>().getBgImgIndex().toString();
      ref.read(currentBgImage.notifier).state = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration:BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/stagebg/${ref.watch(currentBgImage)}.jpg"),
                    fit: BoxFit.fill)),
          ),
          MenuContent(),
          const BgImagePicker()
        ],
      ),
    );
  }
}


