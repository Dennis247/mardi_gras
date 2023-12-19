import 'package:mardi_gras/styles/text.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key? key,
    required this.tabs,
    this.isScrollable = false,
    this.padding,
    this.controller,
    this.onTap,
  }) : super(key: key);

  final TabController? controller;
  final List<Widget> tabs;
  final bool isScrollable;
  final EdgeInsetsGeometry? padding;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: isScrollable,
      controller: controller,
      onTap: onTap,
      physics: const BouncingScrollPhysics(),
      unselectedLabelColor: Colors.grey.withOpacity(.5),
      labelStyle: AppText.bold400(context),
      unselectedLabelStyle: AppText.bold400(context).copyWith(
        color: Colors.grey.withOpacity(.5),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xff17161B),
      ),
      padding: EdgeInsets.zero,
      tabs: tabs,
    );
  }
}
