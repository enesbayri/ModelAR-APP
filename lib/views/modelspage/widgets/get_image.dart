
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GetImage extends StatefulWidget {
  const GetImage({
    super.key,
    required this.urls,
  });

  final List<String> urls;

  @override
  GetImageState createState() => GetImageState();
}

class GetImageState extends State<GetImage> {
  int currentUrlIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, bottom: 10, left: 30, right: 30),
      child: CachedNetworkImage(
        key: UniqueKey(),
        imageUrl: widget.urls[currentUrlIndex],
        alignment: Alignment.center,
        fit: BoxFit.fitWidth,
        errorWidget: (context, error, stackTrace) {
          // Eğer hata varsa, başka URL dene
          if (currentUrlIndex < widget.urls.length - 1) {
            // `setState` çağrısını geciktirmek için `Future.delayed` kullanıyoruz.
            Future.delayed(Duration.zero, () {
              setState(() {
                currentUrlIndex++; // Sonraki URL'yi dene
              });
            });
          } else {
            // Eğer tüm URL'ler hatalıysa, bir hata mesajı göster
            debugPrint(widget.urls.toString());
            return const Center(child: Text("Resim Yüklenemedi",style: TextStyle(color: Colors.white),));
          }
          return const CircularProgressIndicator.adaptive(); // Yeni URL yüklenirken göstermek için
        },
        progressIndicatorBuilder: (context, url, progress) =>   
          CircularProgressIndicator.adaptive(value: progress.progress,backgroundColor: Colors.transparent,valueColor: const AlwaysStoppedAnimation<Color>(Colors.white54),)
      ),
    );
  }
}