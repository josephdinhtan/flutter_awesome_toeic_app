import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

class ExplainPanel extends StatefulWidget {
  const ExplainPanel({super.key, required this.contents, required this.title});

  final String title;
  final List<Widget> contents;

  @override
  State<ExplainPanel> createState() => ExplainPanelState();
}

class ExplainPanelState extends State<ExplainPanel> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 1.sp),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: <Widget>[
          ExpansionTile(
            title: Text(widget.title),
            childrenPadding: EdgeInsets.symmetric(horizontal: 6.w),
            //subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(
              _isExpanded
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down,
            ),
            children: widget.contents,
            onExpansionChanged: (bool expanded) {
              setState(() => _isExpanded = expanded);
            },
          ),
        ],
      ),
    );

    // return ExpansionPanelList(
    //   elevation: 0,
    //   expandedHeaderPadding: const EdgeInsets.all(0),
    //   expansionCallback: (int index, bool isExpanded) {
    //     setState(() {
    //       _isExpanded = !isExpanded;
    //       //log("jdt: isExpanded = $_isExpanded");
    //     });
    //   },
    //   children: [
    //     ExpansionPanel(
    //       backgroundColor: context.colors.surface,
    //       canTapOnHeader: true,
    //       isExpanded: _isExpanded,
    //       body: widget.content,
    //       headerBuilder: (context, isExpanded) {
    //         return ListTile(
    //           contentPadding: const EdgeInsets.all(0),
    //           leading: const Icon(Icons.lightbulb, color: Colors.green),
    //           title: Text(widget.title,
    //               style: const TextStyle(color: Colors.green)),
    //         );
    //       },
    //     ),
    //   ],
    // );
  }
}
