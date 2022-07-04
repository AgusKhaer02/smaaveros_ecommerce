import 'package:flutter/material.dart';

import 'package:ecommerce/api/help/ListHelpResponse.dart';

class HelpItem extends StatelessWidget {
  final Data help;
  const HelpItem({
    Key? key, required this.help,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => DetailHelpPage(idHelp: help.idHelp!)
        //   ),
        // );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
              spreadRadius: 0.2,
            ),
          ],
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                help.imageHelp!,
                fit: BoxFit.cover,
                width: 40,
                height: 40,
                errorBuilder: (context, exception, stackTrace){
                  return Image.asset(
                    "assets/noimageplaceholder.png",
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                  );
                },
              ),
            ),

            SizedBox(
              width: 10,
            ),
            Text(
              help.nameHelp!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}