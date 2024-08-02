import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app_sql/controller/quotes_controller.dart';
import 'package:quotes_app_sql/utils/imagelist.dart';
import 'package:quotes_app_sql/view/catagori/category_screen.dart';
import 'package:quotes_app_sql/view/settings/setting_screen.dart';
import 'package:share_extend/share_extend.dart';
import '../../controller/sql_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuotesController quotesController = Get.put(QuotesController());
    final FavoritesController favoritesController = Get.put(FavoritesController());

    return Scaffold(
      body: Obx(
            () {
          if (quotesController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image(
                    image: AssetImage(quotesController.backgroundImage.value),
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 55, left: 20),
                          child: InkWell(
                            onTap: () {
                              Get.to(const CategoryScreen());
                            },
                            child: Container(
                              height: 60,
                              width: 300,
                              decoration: BoxDecoration(
                                color: const Color(0xff5B7C71),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 100),
                                child: Row(
                                  children: [
                                    Center(
                                      child: Icon(
                                        Icons.star_border,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Inspiration',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, left: 10),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: const Color(0xff5B7C71),
                            child: IconButton(
                              icon: const Icon(Icons.edit, color: Colors.white),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      width: double.infinity,
                                      height: 700,
                                      child: Column(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Background image',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25),
                                            ),
                                          ),
                                          Expanded(
                                            child: GridView.builder(
                                              gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2),
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    String selectedImage = imgList[index];
                                                    quotesController.updateBackgroundImage(selectedImage);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Card(
                                                    child: Image(
                                                      image: AssetImage(
                                                          imgList[index]),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                );
                                              },
                                              itemCount: imgList.length,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, left: 10),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: const Color(0xff5B7C71),
                            child: IconButton(
                              icon: const Icon(Icons.settings,
                                  color: Colors.white),
                              onPressed: () {
                                Get.to(const SettingScreen());
                              },
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 50, left: 10),
                        //   child: CircleAvatar(
                        //     radius: 20,
                        //     backgroundColor: const Color(0xff5B7C71),
                        //     child: IconButton(
                        //       icon: const Icon(Icons.favorite,
                        //           color: Colors.white),
                        //       onPressed: () {
                        //         Get.to(FavoritesScreen());
                        //       },
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: PageView.builder(
                        itemCount: quotesController.quotesList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final quote = quotesController.quotesList[index]['quote'] ?? 'No quote available';
                          final author = quotesController.quotesList[index]['author'] ?? 'Unknown author';
                          final image = quotesController.quotesList[index]['image'] ?? '';

                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  quote,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  author,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.share, color: Colors.grey),
                                      onPressed: () {
                                        ShareExtend.share(quote, 'text');
                                      },
                                    ),
                                    IconButton(
                                      icon: Obx(() {
                                        return Icon(
                                          favoritesController.isFavorite(quote)
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.red,
                                        );
                                      }),
                                      onPressed: () {
                                        if (favoritesController.isFavorite(quote)) {
                                          favoritesController.removeFavorite(quote);
                                        } else {
                                          favoritesController.addFavorite(quote, author, '', image);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
