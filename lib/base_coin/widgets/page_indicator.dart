import 'package:flutter/material.dart';

import '../app_colors.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator(
      {Key? key,
      required this.countIndicator,
      this.selectedIndicator = 0,
      this.itemSize = 10,
      this.colorSelected,
      this.onTap,
      this.colorUnSelected})
      : super(key: key);

  final int countIndicator;
  final int selectedIndicator;
  final double itemSize;
  final Color? colorSelected;
  final Color? colorUnSelected;
  final void Function(int index)? onTap;

  get _colorSelected => colorSelected ?? AppColors.indicatorBlue;

  get _colorUnSelected => colorUnSelected ?? AppColors.indicatorGrey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
        itemCount: countIndicator,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (contex, index) => SizedBox(
          width: itemSize / 2,
        ),
        itemBuilder: (contex, index) => InkWell(
          onTap: () {
            if (onTap != null) {
              onTap!(index);
            }
          },
          child: Container(
            width: itemSize,
            height: itemSize,
            decoration: BoxDecoration(
              color: index == selectedIndicator
                  ? _colorSelected
                  : _colorUnSelected,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
