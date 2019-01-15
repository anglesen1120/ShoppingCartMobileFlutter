import 'package:flutter/material.dart';
import 'package:hello_world/menus/sidemenu.dart';
import 'package:hello_world/models/product.dart';
import 'package:hello_world/pages/products/product_details.dart';
import 'package:share/share.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<ProductModel> productList = new List<ProductModel>();
  @override
  void initState() {
    getProducts().then((value) {
      setState(() {
        productList.addAll(value);
      });
    });
    super.initState();
  }

  Future<List<ProductModel>> getProducts() {
    var productList = [
      new ProductModel(
          price: 100,
          productMediFile:
              "https://www.masoko.com/media/catalog/product/cache/small_image/240x300/beff4985b56e3afdbeabfc89641a4582/a/l/alcatel_1_black_front.png",
          productName: "ALCATEL 1 - 8GB ROM - 1GB RAM - BLACK + FREE 100MBS",
          shopperReview: 5),
      new ProductModel(
          price: 100,
          productMediFile:
              "https://www.masoko.com/media/catalog/product/cache/small_image/240x300/beff4985b56e3afdbeabfc89641a4582/a/l/alcatel_1_black_front.png",
          productName: "ALCATEL 1 - 8GB ROM - 1GB RAM - BLACK + FREE 100MBS",
          shopperReview: 5),
      new ProductModel(
          price: 100,
          productMediFile:
              "https://www.masoko.com/media/catalog/product/cache/small_image/240x300/beff4985b56e3afdbeabfc89641a4582/a/l/alcatel_1_black_front.png",
          productName: "ALCATEL 1 - 8GB ROM - 1GB RAM - BLACK + FREE 100MBS",
          shopperReview: 5),
      new ProductModel(
          price: 100,
          productMediFile:
              "https://www.masoko.com/media/catalog/product/cache/small_image/240x300/beff4985b56e3afdbeabfc89641a4582/a/l/alcatel_1_black_front.png",
          productName: "ALCATEL 1 - 8GB ROM - 1GB RAM - BLACK + FREE 100MBS",
          shopperReview: 5),
    ];
    return new Future(() => productList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
          title: Text("Products"),
        ),
        body: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, int index) {
              return GestureDetector(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Image.network(
                            productList.elementAt(index).productMediFile),
                      ),
                      Center(
                        child: Text(productList.elementAt(index).productName),
                      ),
                      Center(
                          child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Price:",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            Text(productList.elementAt(index).price.toString()),
                          ],
                        ),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.favorite),
                            onPressed: () => {},
                          ),
                          IconButton(
                            icon: Icon(Icons.thumb_up),
                            onPressed: () => {},
                          ),
                          IconButton(
                            icon: Icon(Icons.shopping_cart),
                            onPressed: () => {},
                          ),
                          IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () {
                              Share.share(
                                  'check out my website https://example.com');
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
                onDoubleTap: _goTodDetail,
              );
            }));
  }

  void _goTodDetail() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
  }
}
