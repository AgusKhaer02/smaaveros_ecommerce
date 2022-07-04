import 'package:ecommerce/pages/main_screen/subscreen/feed/widgets/feed_list.dart';
import 'package:ecommerce/pages/main_screen/subscreen/feed/widgets/subpage_title.dart';
import 'package:flutter/material.dart';

import '../../../../api/api.dart';
import '../../../../api/feed/ListFeedResponse.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Future<ListFeedResponse> listFeeds = Api.getListFeed();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // subpage title
        SubpageTitle(),

        FutureBuilder(
          future: listFeeds,
          builder: (context, AsyncSnapshot<ListFeedResponse> snapshot) {
            if (snapshot.hasData) {
              return FeedList(listFeed: snapshot.data!.data!,);
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Something Wrong!"),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),



      ],
    );
  }
}
