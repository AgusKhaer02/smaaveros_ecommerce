import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../api/feed/DetailFeedResponse.dart';
import '../../constants/font_constants.dart';

class DetailFeedScreen extends StatefulWidget {
  final String idFeed;
  const DetailFeedScreen({
    Key? key, required this.idFeed,
  }) : super(key: key);

  @override
  State<DetailFeedScreen> createState() => _DetailFeedScreenState();
}

class _DetailFeedScreenState extends State<DetailFeedScreen> {
  late Future<DetailFeedResponse> detailFeed;

  @override
  void initState() {
    detailFeed = Api.getDetailFeed(widget.idFeed);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Feed"),
      ),
      body: FutureBuilder(
        future: detailFeed,
        builder: (context,AsyncSnapshot<DetailFeedResponse> snapshot){
          if(snapshot.hasData){
            return showDetail(snapshot.data!);
          }else if(snapshot.hasError){
            return Center(
              child: Text("Something Wrong"),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Column showDetail(DetailFeedResponse detailFeed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          detailFeed.imageFeed!,
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
          errorBuilder: (context, exception, stackTrace) {
            return Image.asset(
              "assets/noimageplaceholder.png",
              fit: BoxFit.cover,
              height: 200,
            );
          },
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            detailFeed.titleFeed!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            detailFeed.descFeed!,
            style: FontConstants.content,
          ),
        ),
      ],
    );
  }
}
