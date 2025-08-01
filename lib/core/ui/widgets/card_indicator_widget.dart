import 'package:flutter/material.dart';

class CardIndicatorWidget extends StatefulWidget {
  const CardIndicatorWidget({super.key});

  @override
  CardIndicatorWidgetState createState() => CardIndicatorWidgetState();
}

class CardIndicatorWidgetState extends State<CardIndicatorWidget> {
  final ScrollController _scrollController = ScrollController();
  int _currentPageIndex = 0; // Simulate pages based on scroll position
  final int _numberOfPages = 4; // Total "pages" to represent

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updatePageIndex);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updatePageIndex);
    _scrollController.dispose();
    super.dispose();
  }

  void _updatePageIndex() {
    if (_scrollController.hasClients) {
      double scrollPosition = _scrollController.offset;
      double maxScrollExtent = _scrollController.position.maxScrollExtent;

      if (maxScrollExtent > 0) {
        // Calculate approximate page based on scroll position
        int newPageIndex = ((scrollPosition / maxScrollExtent) * _numberOfPages)
            .floor();
        if (newPageIndex >= _numberOfPages) {
          newPageIndex = _numberOfPages - 1; // Cap at last page
        }
        if (_currentPageIndex != newPageIndex) {
          setState(() {
            _currentPageIndex = newPageIndex;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_numberOfPages, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPageIndex == index ? Colors.white : Colors.grey,
          ),
        );
      }),
    );
  }
}
