import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageControllerProvider = StateProvider<PageController>((ref) => PageController(initialPage: 0),);
final currentPageIndexProvider = StateProvider<int>((ref) => 0);
final currentCategoryIndexProvider = StateProvider<int>((ref) => 0,);
final bgImagePickerIspressed = StateProvider<bool>((ref) => false,);
final currentBgImage = StateProvider<String>((ref) => "1",);

