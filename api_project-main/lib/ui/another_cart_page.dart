import 'package:api_project/models/productresponse.dart';
import 'package:api_project/providers/my_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnotherCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<MyProvider>(context, listen: false).totoal = 0;
    Provider.of<MyProvider>(context, listen: false)
        .cartProduct
        .map((e) => Provider.of<MyProvider>(context, listen: false).totoal =
            Provider.of<MyProvider>(context, listen: false).totoal +
                (e.price * e.quantity))
        .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFEE5E69),
        title: Text(
          'Card',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<MyProvider>(builder: (context, provider, x) {
        List<ProductResponse> products = provider.cartProduct;
        products.removeWhere((element) => element.quantity == 0);
        // provider.getAllcartProduct();
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: products
                                .map((e) => SingleChildScrollView(
                                      child: Container(
                                        margin: EdgeInsets.all(10),
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
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          provider
                                                              .increassQuantity(
                                                                  e);
                                                          provider.totoal = 0;
                                                          Provider.of<MyProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .cartProduct
                                                              .map((e) => Provider.of<MyProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .totoal = Provider.of<MyProvider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .totoal +
                                                                  (e.price *
                                                                      e.quantity))
                                                              .toList();
                                                        },
                                                        icon: Icon(Icons.add)),
                                                    Text("${e.quantity}"),
                                                    IconButton(
                                                        onPressed: () {
                                                          provider
                                                              .decreaseQuantity(
                                                                  e);
                                                          provider.totoal = 0;
                                                          Provider.of<MyProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .cartProduct
                                                              .map((e) => Provider.of<MyProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .totoal = Provider.of<MyProvider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .totoal +
                                                                  (e.price *
                                                                      e.quantity))
                                                              .toList();
                                                        },
                                                        icon: Icon(Icons
                                                            .remove_outlined))
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList()),
                      ),
                    ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 25),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              child: Text(provider.cartProduct == null
                                  ? "${0}"
                                  : "${provider.totoal}")
                              // Text(
                              //   provider.cartProduct == null
                              //       ? ' \$'
                              //       : provider.cartProduct.map((e) => this.total = this.total + (e.price * e.quantity)).toList(),
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.bold, fontSize: 20),
                              )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xFFEE5E69),
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          'Pay Now',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
