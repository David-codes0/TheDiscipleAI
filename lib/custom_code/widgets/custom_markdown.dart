// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_markdown/flutter_markdown.dart';

class CustomMarkdown extends StatefulWidget {
  const CustomMarkdown({
    super.key,
    this.width,
    this.height,
    this.inputString,
  });

  final double? width;
  final double? height;
  final String? inputString;

  @override
  State<CustomMarkdown> createState() => _CustomMarkdownState();
}

class _CustomMarkdownState extends State<CustomMarkdown> {
  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      shrinkWrap: true,
      data: widget.inputString!,
      selectable: false,
      styleSheet: MarkdownStyleSheet(
        listBullet: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Inter',
              fontSize: 16.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        p: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Inter',
              fontSize: 16.0,
              letterSpacing: 0.0,
            ),
        h3: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Inter',
              fontSize: 16.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
