import 'package:calendar_note_app/date_utils.dart';
import 'package:calendar_note_app/widgets/day_widget.dart';
import 'package:calendar_note_app/widgets/expandable_grid.dart';
import 'package:flutter/material.dart';

const _kInternalHorizontalPadding = EdgeInsets.symmetric(horizontal: 8.0);

class CalendarWidget extends StatefulWidget {
  final Function(DateTime) onDaySelected;
  final DateTime? selectedDay;
  final Map<DateTime, String> notes;

  const CalendarWidget(
      {Key? key, required this.onDaySelected, required this.selectedDay, required this.notes})
      : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  final days = <DateTime>[];

  @override
  void initState() {
    _initDays();
    super.initState();
  }

  _initDays() {
    final now = DateTimeConstants.currentDay;

    final firstMonthDay = DateTime(now.year, now.month, 1);
    final lastMonthDay = DateTime(now.year, now.month + 1, 0);

    DateTime firstCalendarDate = firstMonthDay;
    while (firstCalendarDate.weekday != DateTimeConstants.weekdayOrder.first) {
      firstCalendarDate = firstCalendarDate.subtract(const Duration(days: 1));
    }

    DateTime lastCalendarDate = lastMonthDay;
    while (lastCalendarDate.weekday != DateTimeConstants.weekdayOrder.last) {
      lastCalendarDate = lastCalendarDate.add(const Duration(days: 1));
    }

    DateTime dayIteration = firstCalendarDate;

    days.add(dayIteration);
    for (int i = 0; i < lastCalendarDate.difference(firstCalendarDate).inDays; i++) {
      dayIteration = dayIteration.add(const Duration(days: 1));
      days.add(dayIteration);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _CalendarTitleWidget(),
        const _CalendarWeekHeaderWidget(),
        const SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: _kInternalHorizontalPadding,
            child: SizedBox(
              child: ExpandableGrid(
                crossAxisCount: 7,
                children: List.generate(
                  days.length,
                  (index) {
                    final day = days[index];

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(4),
                          onTap: day.month != DateTime.now().month
                              ? null
                              : () => widget.onDaySelected(day),
                          child: DayWidget(
                            currentMonth: DateTime.now().month,
                            day: day,
                            isSelected: widget.selectedDay == day,
                            hasNote: widget.notes.keys.contains(day),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CalendarWeekHeaderWidget extends StatelessWidget {
  const _CalendarWeekHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Padding(
          padding: _kInternalHorizontalPadding,
          child: Row(
            children: List.generate(
              DateTimeConstants.weekdayOrder.length,
              (index) {
                return Expanded(
                  child: Center(
                    child: Text(
                      DateTimeConstants.weekdayShortNames[DateTimeConstants.weekdayOrder[index]] ??
                          '',
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _CalendarTitleWidget extends StatelessWidget {
  const _CalendarTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: _kInternalHorizontalPadding.copyWith(
          top: 12.0,
          bottom: 28.0,
        ),
        child: Text(
          '${DateTimeConstants.monthNames[DateTime.now().month] ?? ''} ${DateTime.now().year}',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
        ),
      ),
    );
  }
}
