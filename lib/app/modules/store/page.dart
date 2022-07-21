import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hortifrutti_app/app/widgets/store_status.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../routes/routes.dart';
import 'controller.dart';

class StorePage extends GetView<StoreController> {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx((state) {
        return CustomScrollView(
          slivers: [
            const SliverAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 8, right: 16, bottom: 16),
                child: Row(
                  children: [
                    SizedBox(
                      width: 96,
                      height: 96,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: state!.image,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.name,
                            style: Get.textTheme.headline5,
                          ),
                          StoreStatus(isOnline: state.isOnline),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var category = state.categories[index];

                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.grey[200],
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16,
                              ),
                              child: Text(
                                category.name,
                                style: Get.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      for (var product in category.products)
                        ListTile(
                          title: Text(product.name),
                          subtitle: Text(
                            NumberFormat.simpleCurrency()
                                    .format(product.price) +
                                (product.isKG ? ' /KG' : ''),
                          ),
                          leading: product.image.isNotEmpty
                              ? SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image: product.image,
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[300],
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  width: 56,
                                  height: 56,
                                  child: Center(
                                    child: Text(
                                      'Sem Foto',
                                      style: Get.textTheme.bodySmall,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                          onTap: () => Get.toNamed(
                            Routes.product,
                            arguments: {
                              'product': product,
                              'store': state,
                            },
                          ),
                        ),
                    ],
                  );
                },
                childCount: state.categories.length,
              ),
            ),
          ],
        );
      }),
    );
  }
}
