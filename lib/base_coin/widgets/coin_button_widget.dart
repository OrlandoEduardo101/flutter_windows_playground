import 'package:flutter/material.dart';
import 'package:flutter_windows_playground/base_coin/app_colors.dart';

class CoinButtonWidget extends StatefulWidget {
  const CoinButtonWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.isSelected,
    this.radius = 8,
    this.borderWidth = 1.5,
    this.width = double.infinity,
    this.height = 55,
    this.colorSelected,
    this.colorUnSelected,
    this.backGroundColor, 
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color? colorSelected;
  final Color? colorUnSelected;
  final Color? backGroundColor;
  final bool isSelected;
  final double radius;
  final double borderWidth;
  final double width;
  final double height;
  final void Function()? onTap;

  @override
  State<CoinButtonWidget> createState() => _CoinButtonWidgetState();
}

class _CoinButtonWidgetState extends State<CoinButtonWidget> {
  late final Color colorSelected;
  late final Color colorUnSelected;
  late final Color backGroundColor;

  @override
  void initState() {
    super.initState();
    colorSelected = widget.colorSelected ?? AppColors.indicatorBlue;
    colorUnSelected = widget.colorUnSelected ?? AppColors.indicatorGrey;
    backGroundColor = widget.backGroundColor ?? AppColors.backgroundBlack;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(
            color: widget.isSelected ? colorSelected : Colors.transparent,
            width: widget.borderWidth,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                Expanded(
                  flex: 15,
                  child: Icon(
                    widget.icon,
                    color: widget.isSelected ? colorSelected : colorUnSelected,
                  ),
                ),
                Expanded(
                  flex: 85,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: widget.isSelected ? colorSelected : colorUnSelected,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
