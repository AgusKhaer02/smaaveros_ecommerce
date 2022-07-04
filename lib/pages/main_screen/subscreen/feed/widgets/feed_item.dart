import 'package:ecommerce/pages/detail_feed/detail_feed_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../api/api.dart';
import '../../../../../api/feed/ListFeedResponse.dart';

class FeedItem extends StatelessWidget {
  final Data feedItem;

  const FeedItem({
    Key? key,
    required this.feedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 3, spreadRadius: 0.2)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              feedItem.imageFeed!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 130,
              errorBuilder: (context, exception, stackTrace) {
                return Image.asset(
                  "assets/noimageplaceholder.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 130,
                );
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    feedItem.titleFeed!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    feedItem.descFeed!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailFeedScreen(
                            idFeed: feedItem.idFeed!,
                          ),
                        ),
                      );
                    },
                    child: Text("View More"),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 1.0,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
