import 'package:flutter/material.dart';

class ListArticle extends StatelessWidget {
  const ListArticle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Notable Works",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Based on the popularity of articles",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.grey
            ),
          ),
          SizedBox(
            // double.infinty = menyesuaikan ukuran dengan parent widget
            width: double.infinity,
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              // menampilkan widget pada masing masing item listview
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  height: 230,
                  margin:
                  EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://www.homestratosphere.com/wp-content/uploads/2021/04/olive-tree-feature-28042021.jpg",
                          width: double.infinity,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text("Natural"),
                      Text("Let up plant more trees from this year"),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}