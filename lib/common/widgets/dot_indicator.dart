import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.length,
    required this.currentIndex,
  });

  final int length;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 3.w,
      runAlignment: WrapAlignment.center,
      children: List.generate(
        length,
        (index) {
          final isCurrentPage = index == currentIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: 1.5.h,
            width: isCurrentPage ? 15.0.w : 10.0.w,
            decoration: ShapeDecoration(
                color: isCurrentPage
                    ? const Color(0xFF004EC3)
                    : const Color(0xFFC2D5F1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                )),
          );
        },
      ),
    );
  }
}
