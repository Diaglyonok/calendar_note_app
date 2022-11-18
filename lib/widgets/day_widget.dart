import 'package:flutter/material.dart';

class DayWidget extends StatelessWidget {
  final bool isSelected;
  final DateTime day;
  final int currentMonth;
  final bool hasNote;
  const DayWidget({
    Key? key,
    required this.day,
    required this.currentMonth,
    this.isSelected = false,
    this.hasNote = false,
  }) : super(key: key);

  Color textColor(BuildContext context) {
    if (isSelected) {
      return Theme.of(context).colorScheme.onPrimary;
    }

    if (day.month != currentMonth) {
      return Theme.of(context).colorScheme.onBackground.withOpacity(0.4);
    }

    return Theme.of(context).colorScheme.onBackground;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 40,
      width: 40,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isSelected || !hasNote ? 4 : 20),
        color: isSelected ? Theme.of(context).colorScheme.primary : null,
        border: hasNote ? Border.all(width: 2, color: Theme.of(context).colorScheme.primary) : null,
      ),
      child: Center(
        child: Text(
          day.day.toString(),
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: textColor(context), fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }
}
