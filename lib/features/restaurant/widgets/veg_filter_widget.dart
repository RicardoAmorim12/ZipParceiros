import 'package:fastdelivery_multivendor_restaurant/features/language/controllers/localization_controller.dart';
import 'package:fastdelivery_multivendor_restaurant/features/restaurant/controllers/restaurant_controller.dart';
import 'package:fastdelivery_multivendor_restaurant/features/splash/controllers/splash_controller.dart';
import 'package:fastdelivery_multivendor_restaurant/util/dimensions.dart';
import 'package:fastdelivery_multivendor_restaurant/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegFilterWidget extends StatelessWidget {
  final String? type;
  final Function(String value)? onSelected;
  const VegFilterWidget({super.key, required this.type, required this.onSelected});

  @override
  Widget build(BuildContext context) {

    final bool ltr = Get.find<LocalizationController>().isLtr;

    return Get.find<SplashController>().configModel!.toggleVegNonVeg! ? Align(alignment: Alignment.center, child: Container(
      height: 30,
      margin: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Get.find<RestaurantController>().productTypeList.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => onSelected!(Get.find<RestaurantController>().productTypeList[index]),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(
                    ltr ? index == 0 ? Dimensions.radiusSmall : 0 : index == Get.find<RestaurantController>().productTypeList.length-1 ? Dimensions.radiusSmall : 0,
                  ),
                  right: Radius.circular(
                    ltr ? index == Get.find<RestaurantController>().productTypeList.length-1 ? Dimensions.radiusSmall : 0 : index == 0 ? Dimensions.radiusSmall : 0,
                  ),
                ),
                color: Get.find<RestaurantController>().productTypeList[index] == type ? Theme.of(context).primaryColor : Theme.of(context).cardColor,
              ),
              child: Text(
                Get.find<RestaurantController>().productTypeList[index].tr,
                style: Get.find<RestaurantController>().productTypeList[index] == type
                  ? robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).cardColor)
                  : robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
              ),
            ),
          );
        },
      ),
    )) : const SizedBox();
  }
}