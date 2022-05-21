import 'package:api_project/models/productresponse.dart';
import 'package:api_project/providers/my_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnotherFavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFEE5E69),
        title: Text(
          'Favorite',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<MyProvider>(builder: (context, provider, x) {
        List<ProductResponse> products = provider.favoriteProduct;
        return Container(
          color: Colors.grey[300],
          child: Column(
            children: [
              products == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Container(
                        //  margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: products
                                .map((e) => SingleChildScrollView(
                                      child: Container(
                                        margin: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              height: 70,
                                              width: 70,
                                              child: CachedNetworkImage(
                                                imageUrl: e.image,
                                                fit: BoxFit.cover,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  '${e.category}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.grey[600]),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '\$${e.price}',
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  provider
                                                      .deleteFromFavorite(e.id);
                                                },
                                                icon: Icon(Icons.delete))
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList()),
                      ),
                    ),
            ],
          ),
        );
      }),
    );
  }
}
