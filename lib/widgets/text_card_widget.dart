import 'package:flutter/material.dart';

class TextCardWidget extends StatefulWidget {
  final Function(String) onTextChanged;
  final String note;
  const TextCardWidget({Key? key, required this.onTextChanged, required this.note})
      : super(key: key);

  @override
  State<TextCardWidget> createState() => _TextCardWidgetState();
}

class _TextCardWidgetState extends State<TextCardWidget> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(text: widget.note);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: const Offset(0, 4)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: TextField(
                controller: controller,
                onChanged: widget.onTextChanged,
                maxLines: null,
                cursorColor: Theme.of(context).colorScheme.onPrimary,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: 'Input your note here...',
                  hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.4),
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
