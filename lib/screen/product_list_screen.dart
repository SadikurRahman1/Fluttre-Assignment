import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
import 'add_new_product_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool _inprogess = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductList();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text('Product list'),
          actions: [
            IconButton(onPressed: () {
              getProductList();
            }, icon: const Icon(Icons.refresh))
          ],
        ),
        body:_inprogess ? const Center(
          child: CircularProgressIndicator(),
        ) : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.separated(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return ProductItem(
                product: productList[index],
              );
            }, separatorBuilder: (context, index) {
            return const SizedBox(height: 16,);
          },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(
                builder: (context) {
                  return const AddNewProductScreen();
                })
            );
          },
          child: const Icon(Icons.add),
        )
    );
  }

  Future<void> getProductList() async {
    _inprogess = true;
    setState(() {});
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);
    print(response.statusCode);
    if (response.statusCode == 200) {
      productList.clear();
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
     for(var item in jsonResponse['data']) {
        Product product = Product(id: item['_id'] ?? '',
          productName: item['ProductName'] ?? '',
          productCode: item['ProductCode'] ?? '',
          productImage: item['Img'] ?? '',
          unitPrice: item['UnitPrice'] ?? '',
          quantity: item['Qty'] ?? '',
          totalPrice: item['TotalPrice'] ?? '',
          createDate: item['CreatedDate'] ?? '',
        );
        productList.add(product);
      }
    }
    _inprogess = false;
    setState(() {});
  }
}

