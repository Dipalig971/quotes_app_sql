import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/imagelist.dart';

class QuotesController extends GetxController {
  var isLoading = true.obs;
  var quotesList = [].obs;
  RxString backgroundImage = 'assets/quotes/img.jpeg'.obs; // Default image

  void updateBackgroundImage(String newImage) {
    backgroundImage.value = newImage;
  }

  Map<String, dynamic> getRandomQuote() {
    final random = Random();
    final index = random.nextInt(quotesList.length);
    return quotesList[index];
  }

  String getRandomImage() {
    final random = Random();
    final index = random.nextInt(imgList.length);
    return imgList[index];
  }

  @override
  void onInit() {
    fetchQuotes();
    super.onInit();
  }

  void fetchQuotes() async {
    try {
      final response = await http.get(Uri.parse('https://sheetdb.io/api/v1/uqngk8mgzyaa5'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        quotesList.value = List<Map<String, dynamic>>.from(data);
      }
    } finally {
      isLoading.value = false;
    }
  }
}