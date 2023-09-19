import 'package:flutter/material.dart';
import 'package:three_sixty_kids/widgets/chip_view.dart';

class CustomChipList extends StatelessWidget {
  final List<String?> list;

  CustomChipList(this.list);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start, // Align chips to the start of the line
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: Axis.horizontal,
      children: _createMovieTimeAndGenreWidget(),
    );
  }

  List<Widget> _createMovieTimeAndGenreWidget() {
    List<Widget> widgets = [];

    widgets.addAll(list
        .map((text) => ChipView(text ?? ""))
        .toList(),);

    return widgets;
  }
}

