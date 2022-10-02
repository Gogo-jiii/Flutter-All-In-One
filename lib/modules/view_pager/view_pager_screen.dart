import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

class ViewPagerScreen extends StatefulWidget {
  const ViewPagerScreen({Key? key}) : super(key: key);

  @override
  State<ViewPagerScreen> createState() => _ViewPagerScreenState();
}

class _ViewPagerScreenState extends State<ViewPagerScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "View Pager"),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        children: const [
          Center(
            child: Text("Page 1"),
          ),
          Center(
            child: Text("Page 2"),
          ),
          Center(
            child: Text("Page 3"),
          )
        ],
      ),
    );
  }
}
