
import 'package:flutter/material.dart'; 
import 'package:modelar/porviders/all_providers.dart';
import 'package:modelar/router/locator.dart';
import 'package:modelar/services/model_data_service.dart';
import 'package:modelar/views/detailpage/widgets/back_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class DetailPage extends ConsumerWidget {
  DetailPage({super.key});
  final modelData = locator<DataModel>();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/stagebg/${ref.watch(currentBgImage)}.jpg"),
                    fit: BoxFit.fill)),
            child: Center(
              child: SizedBox(
                width:  MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.6,
                child: ModelViewer(
                  backgroundColor: Colors.transparent,
                  src: modelData.getModelSrc(ref.read(currentCategoryIndexProvider), ref.read(currentPageIndexProvider)), // 3D model dosyanızın yolunu buraya yazın
                  alt: "3D Model ${modelData.getModelName(ref.read(currentCategoryIndexProvider), ref.read(currentPageIndexProvider))}",
                  autoRotate: true,
                  cameraControls: true,
                  ar: true,
                  
                ),
              ),
              ),
          ),
          const DetailBackButton(),
        ],
      ),
    );
  }
}

/*
ModelViewer(
            backgroundColor: Colors.red,
            src: 'assets/Astronaut.glb', // 3D model dosyanızın yolunu buraya yazın
            alt: "3D Model",
            autoRotate: true,
            cameraControls: true,
            ar: true,
            
          )
 */

