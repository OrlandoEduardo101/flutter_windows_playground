import 'package:flutter/material.dart';
import 'package:flutter_windows_playground/base_coin/app_colors.dart';
import 'package:flutter_windows_playground/base_coin/model/button_model.dart';

import '../widgets/coin_button_widget.dart';

class BaseCoinPage extends StatefulWidget {
  const BaseCoinPage({Key? key, this.title = 'Moeda Base'}) : super(key: key);
  final String title;

  @override
  State<BaseCoinPage> createState() => _BaseCoinPageState();
}

class _BaseCoinPageState extends State<BaseCoinPage> {
  int selectedIndex = -1;
  final coinsList = const [
    ButtonModel(title: 'Real', icon: Icons.attach_money),
    ButtonModel(title: 'Dólar Americano', icon: Icons.attach_money),
    ButtonModel(title: 'Libra Esterlina', icon: Icons.currency_pound),
    ButtonModel(title: 'Yene', icon: Icons.currency_yen),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.pageCanvaBlack,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: AppColors.indicatorBlue,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Selecione uma moeda base para as conversões',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.indicatorGrey,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            itemCount: coinsList.length,
            itemBuilder: (context, index) {
              final item = coinsList[index];
              return CoinButtonWidget(
                icon: item.icon,
                title: item.title,
                isSelected: selectedIndex == index,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 15,
              );
            },
          ),
        ],
      ),
    );
  }
}
