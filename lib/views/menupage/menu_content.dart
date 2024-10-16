
import 'package:flutter/material.dart';
import 'package:modelar/porviders/all_providers.dart';
import 'package:modelar/router/locator.dart';
import 'package:modelar/services/model_data_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuContent extends ConsumerWidget {
  MenuContent({
    super.key,
  });
  final modelData = locator<DataModel>();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
          height: MediaQuery.of(context).size.height*0.35,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30
            ),
            padding: const EdgeInsets.all(10),
            itemCount: modelData.getCategories().length,
            itemBuilder:(context, index) =>  Stack(
              children: [
                InkWell(
                  onTap: () {
                    ref.read(currentPageIndexProvider.notifier).state = 0; // sayfadan geri çıkılmışsa tekrar başlangıç itemi seçili göstermek için
                    ref.read(currentCategoryIndexProvider.notifier).state = index;
                    Navigator.of(context).pushNamed("ModelsPage",arguments: index);
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                  tag: 'category_$index', // Hero tag for container transition
                  child: Material( // Adding Material to avoid Hero issues with text
                    color: Colors.transparent,
                    child: Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(4, 4),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                        color: Colors.black87,
                        borderRadius:  BorderRadius.circular(20),
                        /*BorderRadius.only(
                          topLeft: (index == 3) ? const Radius.circular(0) :  const Radius.circular(20),
                          topRight: (index == 5) ? const Radius.circular(0) :  const Radius.circular(20),
                          bottomLeft: (index == 0 || index == 4 || index == 5) ? const Radius.circular(0) :  const Radius.circular(20),
                          bottomRight: (index == 3 || index == 4  || index == 2) ? const Radius.circular(0) :  const Radius.circular(20) 
                        ),*/
                        // was made screen desing with index for 6 category container
                        gradient: LinearGradient(
                          begin: (index ==  0 || index == 3) ? Alignment.topRight : ((index == 1 || index == 4) ?  Alignment.topCenter : Alignment.topLeft),
                          end: (index ==  0 || index == 3) ? Alignment.bottomLeft : ((index == 1 || index == 4) ?  Alignment.bottomCenter : Alignment.bottomRight),
                          colors: [
                            Colors.grey.shade700,
                            index == 1 ? Colors.black26 : Colors.black,
                          ],
                        ),
                      ),
                      // Keep only the container for the Hero
                    ),
                  ),
                ),
              ),
              // Place the text outside the Hero widget to prevent scaling issues
              InkWell(
                onTap: () {
                    ref.read(currentPageIndexProvider.notifier).state = 0; // sayfadan geri çıkılmışsa tekrar başlangıç itemi seçili göstermek için
                    ref.read(currentCategoryIndexProvider.notifier).state = index;
                    Navigator.of(context).pushNamed("ModelsPage");
                  },
                borderRadius: BorderRadius.circular(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/category/${modelData.getCategoryImages(index)}"),
                        backgroundColor: Colors.transparent,
                      ),
                      Text(
                        modelData.getCategories()[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
                
                
              
              ],
            ),
          ),
        ),
    );
  }
}
