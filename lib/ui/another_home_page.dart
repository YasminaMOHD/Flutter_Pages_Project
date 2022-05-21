import 'package:api_project/providers/my_provider.dart';
import 'package:api_project/ui/another_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class AnotherHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<MyProvider>(builder: (context, provider, x) {
      return Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            color: Color(0xFFEE5E69),
                          )),
                    ),
                    Column(
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text('')
                    // CircleAvatar(
                    //   radius: 20,
                    //   backgroundColor: Color(0xFFEE5E69),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                height: 45,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: IconButton(
                                onPressed: () {}, icon: Icon(Icons.search)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      flex: 5,
                    ),
                    Expanded(
                      child: Container(
                          // child: IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(Icons.local_convenience_store_rounded),
                          //   color: Color(0xFFEE5E69),
                          // ),
                          ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFEE5E69)),
                child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSGe0DVjP41T843N6NIOlQY4c3YSNAcZoJ7A&usqp=CAU')))),
                    // child:Image.network(
                    //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSGe0DVjP41T843N6NIOlQY4c3YSNAcZoJ7A&usqp=CAU',
                    //   fit: BoxFit.contain,
                    // )
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Big sale',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Text(
                              'yoy can make \n Shopping from your \n home as easy',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            )
                          ],
                        ),
                      )),
                ]),
              ),
              SizedBox(height: 20),
              Container(
                child: provider.allCategories == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: provider.allCategories
                              .map((e) => GestureDetector(
                                    onTap: () {
                                      provider.getCategoryProducts(e);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 100,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: provider.selectedCategory == e
                                              ? Color(0xFFEE5E69)
                                              : Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                          e[0].toUpperCase() + e.substring(1),
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
              ),
              Expanded(
                  // margin: EdgeInsets.all(10),
                  child: provider.categoryProducts == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          margin: EdgeInsets.all(10),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemCount: provider.categoryProducts.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    provider.getSingleProduct(
                                        provider.categoryProducts[index].id);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return AnotherDetailPage();
                                    }));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: CachedNetworkImage(
                                            imageUrl: provider
                                                .categoryProducts[index].image,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                // Text(provider
                                                //     .categoryProducts[index]
                                                //     .title),
                                                Text(
                                                  provider
                                                          .categoryProducts[
                                                              index]
                                                          .price
                                                          .toString() +
                                                      '\$',
                                                  style: TextStyle(
                                                      color: Colors.grey[400],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            CircleAvatar(
                                                backgroundColor: provider
                                                        .favoriteProduct
                                                        .any((element) =>
                                                            element.id ==
                                                            provider
                                                                .categoryProducts[
                                                                    index]
                                                                .id)
                                                    ? Color(0xFFEE5E69)
                                                    : Colors.black,
                                                // backgroundColor:
                                                //     Color(0xFFEE5E69),
                                                child: IconButton(
                                                  onPressed: () {
                                                    provider.addFavoriteProduct(
                                                        provider.categoryProducts[
                                                            index]);
                                                    print(provider
                                                        .categoryProducts[index]
                                                        .id);
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .favorite_border_outlined,
                                                    color: Colors.white,
                                                  ),
                                                ))
                                          ],
                                        ),
                                        // Column(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.start,
                                        //   children: [
                                        //     Text(provider
                                        //         .categoryProducts[index].title),
                                        //     Text('Price: ' +
                                        //         provider
                                        //             .categoryProducts[index].price
                                        //             .toString() +
                                        //         '\$'),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ))
            ],
          ));
    }));
  }
}
