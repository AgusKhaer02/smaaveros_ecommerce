import 'package:ecommerce/api/api.dart';
import 'package:ecommerce/api/category/DetailSubcategoryResponse.dart';
import 'package:ecommerce/pages/detail_subcategory_screen/widgets/detail_subcategory_list.dart';
import 'package:ecommerce/pages/detail_subcategory_screen/widgets/detail_subcategory_title_n_product_name.dart';
import 'package:flutter/material.dart';

class DetailSubcategoryScreen extends StatefulWidget {
  final String idSubcategory;
  final String subcategory;

  const DetailSubcategoryScreen(
      {Key? key, required this.idSubcategory, required this.subcategory})
      : super(key: key);

  @override
  _DetailSubcategoryScreenState createState() => _DetailSubcategoryScreenState();
}

class _DetailSubcategoryScreenState extends State<DetailSubcategoryScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  // untuk menampung response webservice
  // Future = menerima response di lain waktu, tergantung berapa lama webservice akan melakukan response
  Future<DetailSubcategoryResponse>? detailSubcategoryList;

  // ketika refresh halaman, panggil subcategory lagi/request data ke webservice lagi
  Future<void> onSwipeRefresh() async {
    detailSubcategoryList = Api.getDetailSubcategory(widget.idSubcategory);
  }

  @override
  void initState() {
    // request data ke webservice sebelum function build() dieksekusi
    detailSubcategoryList = Api.getDetailSubcategory(widget.idSubcategory);

    // inisialisasi untuk swipe refresh
    // memberikan callback ketika user swipe dari atas maka akan eksekusi show()
    // WidgetsBinding.instance!
    //     .addPostFrameCallback((_) => _refreshIndicatorKey.currentState!.show());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: onSwipeRefresh,
          child: ListView(
            children: [
              Container(
                height: height,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailSubcategoryTitleNProductName(
                      subcategory: widget.subcategory,
                    ),

                    // List category page
                    FutureBuilder(
                      future: detailSubcategoryList,
                      builder: (context, AsyncSnapshot<DetailSubcategoryResponse> snapshot) {
                        if (snapshot.hasData) {
                          return DetailSubcategoryList(
                            subcategory: widget.subcategory,
                            detailSubcategoryData: snapshot.data!.data!,
                          );
                        }else if(snapshot.hasError) {
                          return Expanded(
                            child: Center(
                              child: Text("Something wrong"),
                            ),
                          );
                        }

                        return Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => CartPage(),
          //   ),
          // );
        },
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
    );
  }
}
