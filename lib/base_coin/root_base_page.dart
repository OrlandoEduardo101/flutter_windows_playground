import 'package:flutter/material.dart';
import 'package:flutter_windows_playground/base_coin/pages/base_coin_page.dart';
import 'package:flutter_windows_playground/base_coin/widgets/page_indicator.dart';

import 'app_colors.dart';

class RootBasePage extends StatefulWidget {
  final String title;
  const RootBasePage({Key? key, this.title = 'Moeda Base'}) : super(key: key);

  @override
  State<RootBasePage> createState() => _RootBasePageState();
}

class _RootBasePageState extends State<RootBasePage> {
  int selectedIndex = 0;
  final pageViewController = PageController();
  final listPages = const [
    BaseCoinPage(title: 'Moeda Base'),
    BaseCoinPage(title: 'Moeda Base 2'),
    BaseCoinPage(title: 'Moeda Base 3'),
  ];

  @override
  void initState() {
    super.initState();
    // pageViewController.addListener(() { })
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 40,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            widget.title,
            style: TextStyle(
              color: AppColors.titlePageGrey,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: size.height * 0.85,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              controller: pageViewController,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              itemCount: listPages.length,
              itemBuilder: (context, index) {
                return listPages[selectedIndex];
              },
            ),
            Positioned(
                bottom: 16,
                child: SizedBox(
                  width: size.width * 0.8,
                  height: 20,
                  child: PageIndicator(
                    countIndicator: listPages.length,
                    selectedIndicator: selectedIndex,
                    itemSize: 15,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
