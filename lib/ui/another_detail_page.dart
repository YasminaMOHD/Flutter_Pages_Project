import 'package:api_project/providers/my_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnotherDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<MyProvider>(builder: (context, provider, x) {
      return Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color(0xFFEE5E69),
                    )),
              ],
            ),
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  child: CachedNetworkImage(
                    imageUrl: provider.selectedProduct.image,
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$ ${provider.selectedProduct.price}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              provider.selectedProduct.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              provider.selectedProduct.description,
              style: TextStyle(color: Colors.grey[500]),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 40,
                        width: 40,
                        child: Text(
                          'Buy Now',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFEE5E69),
                            borderRadius: BorderRadius.circular(15)),
                      )),
                  Expanded(
                      child: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 25,
                    child: IconButton(
                        onPressed: () {
                          provider.addcartProduct(provider.selectedProduct);
                        },
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: Color(0xFFEE5E69),
                        )),
                  )),
                ],
              ),
            )
          ],
        ),
      );
    }));
  }
}
