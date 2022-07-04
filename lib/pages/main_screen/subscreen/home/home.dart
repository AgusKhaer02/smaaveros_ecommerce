import 'package:flutter/material.dart';

import 'package:ecommerce/pages/main_screen/subscreen/home/widgets/carousel_offers.dart';
import 'package:ecommerce/pages/main_screen/subscreen/home/widgets/category_list.dart';
import 'package:ecommerce/pages/main_screen/subscreen/home/widgets/new_product_list.dart';
import 'package:ecommerce/pages/main_screen/subscreen/home/widgets/section_title.dart';

import '../../../../api/api.dart';
import '../../../../api/carousel/ListCarouselResponse.dart';
import '../../../../api/category/ListCategoryResponse.dart';
import '../../../../api/product/ListProductResponse.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 1. deklarasi variabel dengan return Future
  // didalam variabel ini berisi method yang langsung dari class Api, ketika function getListProduct/getListCategory sudah tereksekusi maka akan return class response
  // jadi jangan dibuat function future baru lagi di dalam class ini yang mana akan berakibat calling api secara terus menerus
  Future<ListProductResponse> dataNewProduct = Api.getListProduct();
  Future<ListCategoryResponse> dataCategory = Api.getListCategory();
  Future<ListCarouselResponse> dataCarousel = Api.getListCarousel();

  // REFRESH INDICATOR=======
  // memberikan indentitas pada refresh indicator
  // GlobalKey mirip2 seperti Key pada umumnya, tujuannya untuk
  // menyimpan suatu state agar saat elemen tersebut dipindahkan
  // ke suatu lokasi di widget tree, state miliknya tidak hilang
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  Future<void> onSwipeRefresh() async {
    dataNewProduct;
    dataCategory;
  }

  @override
  void initState() {
    // menampilkan refresh indicator nanti ketika proses build widget selesai
    // WidgetsBinding.instance!
    //     .addPostFrameCallback((_) => _refreshIndicatorKey.currentState!.show());

    super.initState();
  }

  // # REFRESH INDICATOR=======

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return onSwipeRefresh();
      },
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search items
              // SearchItem(),

              // CarouselSlider
              // menggunakan Future Builder
              // untuk membuat proses loading
              FutureBuilder(
                future: dataCarousel,
                builder: (context,
                    AsyncSnapshot<ListCarouselResponse> snapshot) {
                  // ketika ada datanya
                  if (snapshot.hasData) {
                    return CarouselOffers(
                      listCarousel: snapshot.data!.data!,
                    );
                    //  ketika error
                  } else if (snapshot.hasError) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text("Something wrong"),
                      ),
                    );
                  }

                  // container ini akan muncul ketika tidak dari kedua kondisi itu,
                  // container ini biasanya akan di tampilkan lebih dulu karna dalam kondisi belum diketahui apakah error atau ada datanya
                  return Container(
                    width: double.infinity,
                    height: 120,
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
              ),

              SizedBox(
                height: 20,
              ),

              // Section title Category
              SectionTitle(
                title: 'Category',
              ),

              // Category List
              FutureBuilder(
                future: dataCategory,
                builder: (context,
                    AsyncSnapshot<ListCategoryResponse> snapshot) {
                  if (snapshot.hasData) {
                    return CategoryList(
                      listCategory: snapshot.data!.data!,
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text("Something wrong"),
                      ),
                    );
                  }
                  return Center(
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),

              // Section title New Product
              SectionTitle(
                title: 'New Product',
              ),

              // new product list
              FutureBuilder(
                future: dataNewProduct,
                builder: (context,
                    AsyncSnapshot<ListProductResponse> snapshot) {
                  if (snapshot.hasData) {
                    return NewProductList(
                      data: snapshot.data!.data!,
                    );
                  }
                  return Center(
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),

            ],
          ),
        ],
      ),
    );
  }
}
