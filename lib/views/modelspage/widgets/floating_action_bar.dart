import 'package:flutter/material.dart';
import 'package:modelar/porviders/all_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingActionButtonBar extends ConsumerWidget {
  const FloatingActionButtonBar({
    super.key,required this.lastPageIndex
  });
  final int lastPageIndex;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    PageController controller = ref.read(pageControllerProvider);
    int currentPage = ref.watch(currentPageIndexProvider);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (currentPage == 0 )? Container() :  Padding(
          padding: const EdgeInsets.only(left: 26.0),
          child: FloatingActionButton(
            heroTag: "buttonOne",
            backgroundColor: Colors.transparent,
            shape: const CircleBorder(side: BorderSide(color: Colors.white,width: 2)),
            child: const Icon(Icons.keyboard_double_arrow_left_sharp,color: Colors.white,),
            onPressed: () {
              ref.read(currentPageIndexProvider.notifier).state = controller.page!.toInt()-1;
              controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.linear);
            },
          ),
        ),
        currentPage == lastPageIndex ? Container() : FloatingActionButton(
          heroTag: "buttonTwo",
          backgroundColor: Colors.transparent,
          shape: const CircleBorder(side: BorderSide(color: Colors.white,width: 2)),
          child: const Icon(Icons.keyboard_double_arrow_right_sharp,color: Colors.white,),
          onPressed: () {
            ref.read(currentPageIndexProvider.notifier).state = controller.page!.toInt()+1;
            controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.linear);
          },
        ),
      ],
    );
  }
}
