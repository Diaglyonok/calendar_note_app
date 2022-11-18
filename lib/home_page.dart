import 'package:calendar_note_app/date_utils.dart';
import 'package:calendar_note_app/widgets/calendar_widget.dart';
import 'package:calendar_note_app/widgets/text_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDay = DateTimeConstants.currentDay;
  final notes = <DateTime, String>{};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextCardWidget(
                  note: notes[selectedDay] ?? '',
                  onTextChanged: (text) {
                    setState(() {
                      if (text == '') {
                        notes.remove(selectedDay);
                      } else {
                        notes[selectedDay] = text;
                      }
                    });
                  },
                  key: ValueKey(selectedDay),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CalendarWidget(
                    onDaySelected: (day) {
                      setState(() => selectedDay = day);
                    },
                    notes: notes,
                    selectedDay: selectedDay,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
