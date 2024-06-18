import 'package:VEC_dickyderiyanto/constant/colors.dart';
import 'package:VEC_dickyderiyanto/constant/int_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final ScrollController scrollController = ScrollController();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: SafeArea(
        child: Obx(() {
          final storage = GetStorage();
          final token = storage.read("token");

          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
                controller.loadMore(token);
              }
              return false;
            },
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.80,
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: controller.products.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final data = controller.products[index];
                return Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: AppColors.appWave1),
                          borderRadius: BorderRadius.circular(19),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.appWave1,
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50.0)),
                              child: Image.asset(
                                "assets/images/default_product.png",
                                fit: BoxFit.fitWidth,
                                height: 85,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            data.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  data.price.currencyFormatRp,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            // child: ListView.builder(
            //   itemCount: controller.products.length,
            //   itemBuilder: (context, index) {
            //     final product = controller.products[index];
            //     return ListTile(
            //       contentPadding: EdgeInsets.all(4),
            //       leading: CircleAvatar(
            //         child: Image.asset("assets/images/product.png"),
            //       ),
            //       title: Text(
            //         product.name,
            //         style: const TextStyle(
            //             fontSize: 14, fontWeight: FontWeight.bold),
            //       ),
            //       subtitle: Text('Price: ${product.price}'),
            //     );
            //   },
            // ),
          );
        }),
      ),
    );
  }
}
