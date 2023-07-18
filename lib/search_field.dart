import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    this.text,
    this.onSubmitted,
    this.hintText,
    this.onSearchActive,
  });

  final String? text;
  final String? hintText;
  final void Function(String? value)? onSubmitted;
  final void Function()? onSearchActive;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final light = theme.brightness == Brightness.light;
    final focusNode = FocusNode();

    final border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(100),
    );
    return KeyboardListener(
      focusNode: focusNode,
      onKeyEvent: (value) {
        if (value.logicalKey == LogicalKeyboardKey.escape) {
          widget.onSearchActive?.call();
        }
      },
      child: TextField(
        autofocus: true,
        style: theme.textTheme.bodyMedium,
        strutStyle: const StrutStyle(
          leading: 0.2,
        ),
        textAlignVertical: TextAlignVertical.center,
        cursorWidth: 1,
        onSubmitted: widget.onSubmitted,
        controller: _controller,
        decoration: InputDecoration(
          border: border,
          enabledBorder: border,
          errorBorder: border,
          focusedBorder: border,
          contentPadding:
              const EdgeInsets.only(bottom: 8, top: 10, right: 15, left: 45),
          hintText: widget.hintText,
          fillColor: theme.dividerColor,
          hoverColor: theme.dividerColor,
        ),
      ),
    );
  }
}
