import 'package:flutter/material.dart';
import 'package:modelar/porviders/all_providers.dart';
import 'package:modelar/router/locator.dart';
import 'package:modelar/services/model_data_service.dart';
import 'package:modelar/views/detailpage/widgets/back_button.dart';
import 'package:modelar/views/modelspage/widgets/floating_action_bar.dart';
import 'package:modelar/views/modelspage/widgets/get_image.dart';
import 'package:modelar/views/modelspage/widgets/local_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModelsPage extends ConsumerWidget {
  ModelsPage({super.key});
  final modelData = locator<DataModel>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/stagebg/${ref.watch(currentBgImage)}.jpg"), fit: BoxFit.fill)),
            child: Center(
              child: PageView.builder(
                controller: ref.read(pageControllerProvider),
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  ref.read(currentPageIndexProvider.notifier).state = value;
                },
                // oyuncaklar kategorisine 2.modeller serisi eklendi
                itemCount: ref.read(currentCategoryIndexProvider)== 0 ? modelData  
                    .getCategory(ref.read(currentCategoryIndexProvider))
                    .length + modelData.getSecondCategory().length : modelData
                    .getCategory(ref.read(currentCategoryIndexProvider))
                    .length,
                itemBuilder: (context, index) => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedScale(
                        duration: const Duration(milliseconds: 200),
                        scale:
                            index == ref.watch(currentPageIndexProvider) ? 1 : 0.1,
                        child: InkWell(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(80),
                            topRight: Radius.circular(80),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed("DetailPage");
                          },
                          child: index == 0
                              ? Hero(
                                  tag:
                                      'category_${ref.read(currentCategoryIndexProvider)}',
                                  child: buildContainer(index, ref),
                                )
                              : buildContainer(index, ref),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const DetailBackButton()
        ],
      ),
      floatingActionButton: FloatingActionButtonBar(
        lastPageIndex: ref.read(currentCategoryIndexProvider)== 0 ? modelData  
                .getCategory(ref.read(currentCategoryIndexProvider))
                .length + modelData.getSecondCategory().length  - 1 : modelData
                .getCategory(ref.read(currentCategoryIndexProvider))
                .length -
            1,
      ),
    );
  }

  Transform buildContainer(int index, WidgetRef ref) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateX(-0.1)
        ..rotateY(0),
      alignment: FractionalOffset.center,
      child: Container(
        width: 250,
        height: 350,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black54, // Gölge rengi
              offset: Offset(4, 4), // Gölgenin kayma miktarı
              blurRadius: 10, // Gölgenin bulanıklığı
              spreadRadius: 2, // Gölgenin yayılma miktarı
            ),
          ],
          color: Colors.black87,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(80),
            topRight: Radius.circular(80),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey.shade700,
              Colors.black,
            ],
          ),
        ),
        child: // oyuncaklar kategorisine 2.modellerin eklenmesi / 2.modellerin görselleri localde bulunmaktadır. Bu yüzden index kontrolle local görsel gösterilir.
        (ref.read(currentCategoryIndexProvider) == 0 && index >= modelData.getCategory(0).length) ?
        LocalImage(url: "assets/model_img/${modelData.getSecondCategory()[index - modelData.getCategory(0).length]}.png")
        :
        GetImage(
            urls: modelData.getModelImageUrls(modelData
                .getCategory(ref.read(currentCategoryIndexProvider))[index])),
      ),
    );
  }
}
