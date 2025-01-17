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

import 'package:the_disciple/components/verse_widget/verse_widget_widget.dart';

class BibleVerseList extends StatefulWidget {
  const BibleVerseList(
      {super.key,
      this.width,
      this.height,
      required this.versesList,
      required this.index,
      required this.bibleRef});

  final double? width;
  final double? height;
  final List<String> versesList;
  final int index;
  final String? bibleRef;

  @override
  State<BibleVerseList> createState() => _BibleVerseListState();
}

class _BibleVerseListState extends State<BibleVerseList> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _verses = [
    "Genesis 1:1 - In the beginning, God created the heavens and the earth.",
    "Psalm 23:1 - The Lord is my shepherd; I shall not want.",
    "John 3:16 - For God so loved the world, that he gave his only Son...",
    "Romans 8:28 - And we know that in all things God works for the good...",
    "Philippians 4:13 - I can do all things through Christ who strengthens me.",
    "Psalm 23:1 - The Lord is my shepherd; I shall not want.",
    "John 3:16 - For God so loved the world, that he gave his only Son...",
    "Romans 8:28 - And we know that in all things God works for the good...",
    "Philippians 4:13 - I can do all things through Christ who strengthens me.",
    "Genesis 1:1 - In the beginning, God created the heavens and the earth.",
    "Psalm 23:1 - The Lord is my shepherd; I shall not want.",
    "John 3:16 - For God so loved the world, that he gave his only Son...",
    "John 3:16 - For God so loved the world, that he gave his only Son...",
    "Romans 8:28 - And we know that in all things God works for the good...",
    // Add more verses as needed
  ];
  @override
  void initState() {
    super.initState();
    // _selectedDate = _currentDate; // Set initial selected date to current date

    // ScrollController to control the initial scroll to the current date
    // _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToVerse(widget.index);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToVerse(int index) {
    if (index >= 0 && index < widget.versesList.length) {
      _scrollController.animateTo(
        index * 72.0, // Assuming each item has a fixed height of 50
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Index out of range!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _indexController = TextEditingController();

    return Scaffold(
        backgroundColor: Color(0xff111010),
        body: Column(children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.57,
                  width: MediaQuery.sizeOf(context).width,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: widget.versesList.length,
                    itemBuilder: (context, index) {
                      return VerseWidgetWidget(
                        indexinList: (index + 1).toString(),
                        parameter1: widget.versesList[index],
                        bibleRef: widget.bibleRef,
                      );
                    },
                  ),
                )),
          )
        ]));
  }
}
