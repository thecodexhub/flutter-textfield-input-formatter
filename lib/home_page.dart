import 'package:flutter/material.dart';
import 'package:flutter_textfield_input_formatter/view/view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  static const List<Widget> _pages = [
    UsernameView(),
    PhoneNumberView(),
    CardNumberView(),
    DOBView(),
  ];

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: _pages.length,
          itemBuilder: (context, index) => _pages[index],
          onPageChanged: (index) {
            setState(() => _currentPageIndex = index);
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80,
            width: double.maxFinite,
            color: Colors.grey[200],
            child: _PageViewNavigator(
              currentPageIndex: _currentPageIndex,
              onNextPage: () {
                _pageController.animateToPage(
                  _currentPageIndex + 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              },
              onPreviousPage: () {
                _pageController.animateToPage(
                  _currentPageIndex - 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _PageViewNavigator extends StatelessWidget {
  const _PageViewNavigator({
    required this.currentPageIndex,
    required this.onNextPage,
    required this.onPreviousPage,
  });
  final int currentPageIndex;
  final VoidCallback onNextPage;
  final VoidCallback onPreviousPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onPreviousPage,
          child: const Icon(Icons.keyboard_double_arrow_left),
        ),
        const SizedBox(width: 16.0),
        Text(
          'Example ${currentPageIndex + 1}/4',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(width: 16.0),
        InkWell(
          onTap: onNextPage,
          child: const Icon(Icons.keyboard_double_arrow_right),
        ),
      ],
    );
  }
}
