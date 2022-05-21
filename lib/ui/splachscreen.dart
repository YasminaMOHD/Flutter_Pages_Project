import 'package:api_project/ex.dart';
import 'package:api_project/providers/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key key}) : super(key: key);

  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<MyProvider>(context, listen: false).getAllCategories();
    Provider.of<MyProvider>(context, listen: false).getAllProducts();
    Provider.of<MyProvider>(context, listen: false).getAllfavoriteProduct();
    Provider.of<MyProvider>(context, listen: false).getAllcartProduct();

    // Future.delayed(const Duration(seconds: 3)).then((value) =>
    //     Navigator.of(context)
    //         .push(MaterialPageRoute(builder: (context) => HomePage())));
    // method();
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Example())));
    // Future.delayed(const Duration(seconds: 3)).then((value) =>
    //     Navigator.of(context)
    //         .push(MaterialPageRoute(builder: (context) => Login())));
    // super.initState();
  }

  // method() {
  //   Future.delayed(const Duration(seconds: 3)).then((value) =>
  //       Navigator.of(context)
  //           .push(MaterialPageRoute(builder: (context) => HomePage())));
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('splash screeen'),
      ),
    );
  }
}
