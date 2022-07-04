import 'package:flutter/material.dart';

import '../../../../../api/feed/ListFeedResponse.dart';
import 'feed_item.dart';

class FeedList extends StatefulWidget {
  final List<Data> listFeed;
  const FeedList({
    Key? key, required this.listFeed,
  }) : super(key: key);

  @override
  State<FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.listFeed.length,
        itemBuilder: (context, index) {
          return FeedItem(feedItem: widget.listFeed[index],);
        },
      ),
    );
  }
}
