import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class TextWidget extends StatelessWidget {
  final String text;
  // Optional style for customizing text appearance
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;

  const TextWidget(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
  });
  @override
  Widget build(BuildContext context) {
    return Html(
      data: text,
      style: {
        "body": Style(
          maxLines: maxLines,
          textOverflow: overflow,
          fontSize:
              style?.fontSize != null
                  ? FontSize(style!.fontSize!)
                  : FontSize(14),
          fontFamily: style?.fontFamily,
          fontWeight: style?.fontWeight,
          color: style?.color,
        ),
      },
    );
  }
}
