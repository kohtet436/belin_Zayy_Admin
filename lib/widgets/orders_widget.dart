import 'package:belin_zayy_admin/values/font_manager.dart';
import 'package:belin_zayy_admin/values/style_manager.dart';
import 'package:belin_zayy_admin/values/value_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:belin_zayy_admin/services/utils.dart';
import 'package:get/get.dart';

import '../values/widget_util.dart';
import 'text_widget.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget(
      {Key? key,
      required this.price,
      // required this.totalPrice,
      required this.productId,
      required this.userId,
      required this.imageUrl,
      required this.userName,
      required this.quantity,
      required this.orderDate})
      : super(key: key);
  final double price;
  //  totalPrice;
  final String productId, userId, imageUrl, userName;
  final int quantity;
  final Timestamp orderDate;
  @override
  _OrdersWidgetState createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  late String orderDateStr;
  @override
  void initState() {
    var postDate = widget.orderDate.toDate();
    orderDateStr = '${postDate.day}/${postDate.month}/${postDate.year}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Utils(context).getTheme;
    // Color color = Colors.white;
    //  theme == true ? Colors.white : Colors.black;
    // Size size = Utils(context).getScreenSize;

    return Card(
      elevation: 5,
      child: Row(
        children: [
          CachedNetworkImage(
            height: Get.size.width * 0.25,
            width: Get.size.width * 0.25,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                strokeWidth: 1,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: widget.imageUrl,
            fit: BoxFit.fill,
          ),
          WidgetUtil.spaceHorizontal(AppSize.s30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${widget.quantity} X ${widget.price}",
                style: getRegularStyle(
                    fontSize: FontSize.defaultFontSize, color: Colors.black),
              ),
              Row(
                children: [
                  Text("By "),
                  Text(widget.userName,
                      style: getRegularStyle(
                        fontSize: FontSize.defaultFontSize,
                        color: Colors.black,
                      ))
                ],
              ),
              Text(orderDateStr,
                  style: getRegularStyle(
                      fontSize: FontSize.defaultFontSize, color: Colors.black))
            ],
          )
        ],
      ),
    );
    //  Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Card(
    //     elevation: 5,
    //     child: Material(
    //       borderRadius: BorderRadius.circular(8.0),
    //       color: Theme.of(context).cardColor.withOpacity(0.4),
    //       child: Padding(
    //         padding: const EdgeInsets.all(0.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Flexible(
    //               flex: size.width < 650 ? 3 : 1,
    // child: CachedNetworkImage(
    //   progressIndicatorBuilder:
    //       (context, url, downloadProgress) => Center(
    //     child: CircularProgressIndicator(
    //         value: downloadProgress.progress),
    //   ),
    //   errorWidget: (context, url, error) =>
    //       const Icon(Icons.error),
    //   imageUrl: widget.imageUrl,

    //   fit: BoxFit.fill,
    //   // height: screenWidth * 0.15,
    //   // width: screenWidth * 0.15,
    // ),
    //             ),
    //             const SizedBox(
    //               width: 12,
    //             ),
    //             Expanded(
    //               flex: 10,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                       "${widget.quantity}X ${widget.price}"),
    //                   // TextWidget(
    //                   //   text:
    //                   //       '${widget.quantity}X For \$${widget.price.toStringAsFixed(2)}',
    //                   //   color: color,
    //                   //   textSize: 16,
    //                   //   isTitle: true,
    //                   // ),
    //                   FittedBox(
    //                     child: Row(
    //                       children: [
    //                         TextWidget(
    //                           text: 'By',
    //                           color: Colors.blue,
    //                           textSize: 16,
    //                           isTitle: true,
    //                         ),
    //                         Text('  ${widget.userName}')
    //                       ],
    //                     ),
    //                   ),
    //                   Text(
    //                     orderDateStr,
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
