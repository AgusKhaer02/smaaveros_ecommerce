import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String desc;
  final String nameProduct;

  const Description({
    Key? key,
    required this.desc, required this.nameProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Descriptions",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            desc,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          TextButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => DetailDescription(
              //       nameProduct: nameProduct,
              //       descProduct: desc,
              //     ),
              //   ),
              // );
            },
            child: Text("Lihat selengkapnya"),
          )
        ],
      ),
    );
  }
}
