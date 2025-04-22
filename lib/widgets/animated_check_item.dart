import 'package:flutter/material.dart';

class AnimatedCheckItem extends StatelessWidget {
  final String text;
  final bool checked;
  final ValueChanged<bool> onChanged;

  AnimatedCheckItem({
    required this.text,
    required this.checked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      trailing: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: Icon(
          checked ? Icons.check_box : Icons.check_box_outline_blank,
          key: ValueKey<bool>(checked),
        ),
      ),
      onTap: () => onChanged(!checked),
    );
  }
}
