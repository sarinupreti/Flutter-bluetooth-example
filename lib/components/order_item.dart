// import 'package:bell_delivery_hub/routes/router.gr.dart';
// import 'package:flutter/material.dart';
// import 'package:bell_delivery_hub/extensions/context_extension.dart';
// import 'package:bell_delivery_hub/extensions/number_extensions.dart';

// class OrderItem extends StatelessWidget {
//   final String imageUrl;
//   final String orderId;
//   final String date;
//   final WooOrder data;

//   final String amount;

//   const OrderItem(
//       {Key key, this.imageUrl, this.orderId, this.date, this.amount, this.data})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // return ExtendedNavigator.of(context).push(Routes.orderDetailsScreen,
//         //     arguments:
//         //         OrderDetailsScreenArguments(orderId: orderId, data: data));
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           color: context.theme.surface,
//           boxShadow: [
//             BoxShadow(
//               color: context.theme.themeType
//                   ? context.theme.corePalatte.black
//                   : Colors.grey[300].withOpacity(0.5),
//               spreadRadius: 2,
//               blurRadius: 15,
//               offset: Offset(0, 3), // changes position of shadow
//             ),
//           ],
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Column(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: CachedNetworkImage(
//                     fit: BoxFit.cover,
//                     height: (65).flexibleHeight,
//                     width: (65).flexibleWidth,
//                     imageUrl: imageUrl,
//                     imageBuilder: (context, imageProvider) => Container(
//                       height: (65).flexibleHeight,
//                       width: (65).flexibleWidth,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         boxShadow: [
//                           BoxShadow(
//                             color: context.theme.themeType
//                                 ? context.theme.corePalatte.black
//                                 : Colors.grey[300].withOpacity(0.5),
//                             spreadRadius: 7,
//                             blurRadius: 15,
//                             offset: Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                         image: DecorationImage(
//                           image: imageProvider,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     placeholder: (context, url) => CustomShimmer(
//                       height: (65).flexibleHeight,
//                       width: (65).flexibleWidth,
//                     ),
//                     errorWidget: (context, url, error) => CustomShimmer(
//                       height: (65).flexibleHeight,
//                       width: (65).flexibleWidth,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(orderId,
//                           style: AppTextTheme.title.copyWith(
//                               color: context.theme.textColor,
//                               fontSize: 15.flexibleHeight)),
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Text(date,
//                           style: AppTextTheme.title
//                               .copyWith(fontSize: 15.flexibleFontSize)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 16, right: 16, bottom: 16, top: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(amount,
//                       style: AppTextTheme.title.copyWith(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: context.theme.textColor)),
//                   Text("More info..",
//                       style: AppTextTheme.title.copyWith(
//                           fontSize: 14,
//                           color: AppColors.primaryColor,
//                           fontWeight: FontWeight.w500)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
