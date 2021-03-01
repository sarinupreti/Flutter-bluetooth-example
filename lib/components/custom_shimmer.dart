import 'package:bots_demo/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:bots_demo/extensions/context_extension.dart';

class CustomShimmer extends StatelessWidget {
  //
  //
  final double height;
  final double width;
  final bool isCircular;

  const CustomShimmer({
    Key key,
    this.height = 30.0,
    this.width = 200.0,
    this.isCircular = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.theme.corePalatte.greyColor.withOpacity(0.1),
      highlightColor: context.theme.background.withOpacity(0.1),
      child: Container(
        width: this.width,
        height: this.height,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius:
                BorderRadius.circular(this.isCircular ? this.height : 8)),
      ),
    );
  }
}
