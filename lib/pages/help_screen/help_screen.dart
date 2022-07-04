import 'package:ecommerce/pages/help_screen/widgets/help_list.dart';
import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../api/help/ListHelpResponse.dart';
import '../main_screen/subscreen/feed/widgets/subpage_title.dart';

class HelpScreen extends StatefulWidget {

  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  Future<ListHelpResponse> listHelp = Api.getListHelp();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // subpage title
        SubpageTitle(),

        // help list
        FutureBuilder(
          future: listHelp,
          builder: (context, AsyncSnapshot<ListHelpResponse> snapshot) {
            if (snapshot.hasData) {
              return HelpList(
                listHelp: snapshot.data!.data!,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Something Error"),
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