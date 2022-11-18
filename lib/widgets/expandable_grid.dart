import 'package:flutter/material.dart';

class ExpandableGrid extends StatelessWidget {
  final List<Widget> children;
  final int crossAxisCount;

  const ExpandableGrid({Key? key, required this.children, required this.crossAxisCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int columnsCount = crossAxisCount;
    int additionalLinesCount = children.length % columnsCount > 0 ? 1 : 0;

    return Column(
      children: [
        for (int i = 0; i < children.length ~/ columnsCount + additionalLinesCount; i++)
          Expanded(
            child: Row(
              children: <Widget>[
                for (int j = 0; j < columnsCount; j++)
                  Expanded(
                    child: i * columnsCount + j >= children.length
                        ? Container()
                        : children[i * columnsCount + j],
                  ),
              ],
            ),
          )
      ],
    );
  }
}
