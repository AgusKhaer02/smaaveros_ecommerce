import 'package:ecommerce/api/api.dart';
import 'package:ecommerce/api/category/ListSubcategoryResponse.dart';
import 'package:ecommerce/pages/subcategory_screen/widgets/subcategory_list.dart';
import 'package:ecommerce/pages/subcategory_screen/widgets/subpage_title.dart';
import 'package:flutter/material.dart';

class SubcategoryScreen extends StatefulWidget {
  final String id;

  const SubcategoryScreen({Key? key, required this.id}) : super(key: key);

  @override
  _SubcategoryScreenState createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  Future<ListSubcategoryResponse>? listSubcategory;

  // Future<List<Data>> getListSubcategory() async{
  //
  //   Api.getListSubcategory(widget.id).then((value) {
  //     setState(() {
  //       listSubcategory = value.data!;
  //     });
  //   });
  //   return listSubcategory;
  //
  // }

  Future<void> onSwipeRefresh() async {
    listSubcategory = Api.getListSubcategory(widget.id);
  }

  @override
  void initState() {

    listSubcategory = Api.getListSubcategory(widget.id);
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState!.show());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return onSwipeRefresh();
          },
          child: ListView(
            children: [
              Container(
                width: width,
                height: height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubpageTitle(),

                    // list subcategory page
                    FutureBuilder(
                      future: listSubcategory,
                      builder: (context, AsyncSnapshot<ListSubcategoryResponse>snapshot){
                        if(snapshot.hasData){
                          // 1
                          // mengembalikan widget Subcategorylist ketika data dari API sudah ada
                          // dan mengirimkan data snapshot beserta dengan nama categorynya
                          return SubcategoryList(subcategoryListData: snapshot.data!.data!, category: "This is category",);
                        }else if(snapshot.hasError){
                          return Center(
                            child: Text("Something Wrong, Error : ${snapshot.stackTrace}"),
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
        child: Icon(Icons.shopping_cart, color: Colors.white,),

      ),
    );
  }
}