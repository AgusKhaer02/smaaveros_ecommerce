import 'package:flutter/material.dart';

import 'help_item.dart';
import 'package:ecommerce/api/help/ListHelpResponse.dart';

class HelpList extends StatefulWidget {
  final List<Data> listHelp;
  const HelpList({
    Key? key, required this.listHelp,
  }) : super(key: key);

  @override
  State<HelpList> createState() => _HelpListState();
}

class _HelpListState extends State<HelpList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.listHelp.length,
        itemBuilder: (context, index) {
          return HelpItem( help: widget.listHelp[index],);
        },
      ),
    );
  }
}