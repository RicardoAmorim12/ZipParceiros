import 'package:fastdelivery_multivendor_restaurant/features/payment/domain/models/withdraw_model.dart';
import 'package:fastdelivery_multivendor_restaurant/helper/date_converter_helper.dart';
import 'package:fastdelivery_multivendor_restaurant/helper/price_converter_helper.dart';
import 'package:fastdelivery_multivendor_restaurant/util/dimensions.dart';
import 'package:fastdelivery_multivendor_restaurant/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawWidget extends StatelessWidget {
  final WithdrawModel withdrawModel;
  final bool showDivider;
  const WithdrawWidget({super.key, required this.withdrawModel, required this.showDivider});

  @override
  Widget build(BuildContext context) {
    return Column(children: [

      Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
        child: Row(children: [

          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

            Text(PriceConverter.convertPrice(withdrawModel.amount), style: robotoMedium, textDirection: TextDirection.ltr,),
            const SizedBox(height: Dimensions.paddingSizeExtraSmall),

            Text('${'transferred_to'.tr} ${withdrawModel.bankName}', style: robotoRegular.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall, color: Theme.of(context).disabledColor,
            )),

          ])),
          const SizedBox(width: Dimensions.paddingSizeSmall),

          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [

            Text(
              DateConverter.dateTimeStringToDateTime(withdrawModel.requestedAt!),
              style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
            ),
            const SizedBox(height: Dimensions.paddingSizeExtraSmall),

            Text(withdrawModel.status!.tr, style: robotoRegular.copyWith(
              fontSize: Dimensions.fontSizeSmall,
              color: withdrawModel.status == 'Approved' ? Colors.green : withdrawModel.status == 'Denied' ? Theme.of(context).colorScheme.error : Theme.of(context).primaryColor,
            )),

          ]),

        ]),
      ),

      Divider(color: showDivider ? Theme.of(context).disabledColor : Colors.transparent),

    ]);
  }
}