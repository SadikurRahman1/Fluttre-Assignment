import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _productNameTEController =
      TextEditingController();
  final TextEditingController _unitePriceTEController = TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final TextEditingController _productQuantityTEController =
      TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _productImageTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _inprogess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildNewProductForm(),
        ),
      ),
    );
  }

  Form _buildNewProductForm() {
    return Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _productNameTEController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  labelText: 'Product Name',
                ),
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return 'Inter The value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _unitePriceTEController,
                decoration: const InputDecoration(
                  hintText: 'Unit Price',
                  labelText: 'Unit Price',
                ),
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return 'Inter The value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _productCodeTEController,
                decoration: const InputDecoration(
                  hintText: 'Product Code',
                  labelText: 'Product Code',
                ),
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return 'Inter The value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _productQuantityTEController,
                decoration: const InputDecoration(
                  hintText: 'Quantity',
                  labelText: 'Product Quantity',
                ),
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return 'Inter The value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _totalPriceTEController,
                decoration: const InputDecoration(
                  hintText: 'Total Price',
                  labelText: 'Total Price',
                ),
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return 'Inter The value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _productImageTEController,
                decoration: const InputDecoration(
                  hintText: 'Image',
                  labelText: 'Product Image',
                ),
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return 'Inter The value';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              _inprogess ?
              const Center(
                child: CircularProgressIndicator(),
              ) : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(double.maxFinite)
                ),
                onPressed: _onTapAddProductButton,
                child: const Text('Add Product'),
              ),
            ],
          ),
        );
  }


  void _onTapAddProductButton(){
    if(_formKey.currentState!.validate()){
      addNewProduct();
    }
  }

  Future<void> addNewProduct() async{
    _inprogess = true;
    setState(() {});
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');
    Map<String, dynamic> requestBody = {
      "ProductName": _productNameTEController.text,
      "ProductCode": _productCodeTEController.text,
      "Img": _productImageTEController.text,
      "UnitPrice": _unitePriceTEController.text,
      "Qty": _productQuantityTEController.text,
      "TotalPrice": _totalPriceTEController.text,
    };
    Response response = await post(
        uri,
        headers: {"Content-Type": "application/json"} ,
        body: jsonEncode(requestBody)
    );
    // print('=================');
    // print(response.statusCode);
    // print(response.body);
    // print('=================');

    if(response.statusCode == 200){
      _clearTextfields();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('New product add'),));
    }
    _inprogess = false;
    setState(() {});
  }

  void _clearTextfields(){
    _productNameTEController.clear();
    _unitePriceTEController.clear();
    _productCodeTEController.clear();
    _productQuantityTEController.clear();
    _totalPriceTEController.clear();
    _productImageTEController.clear();
  }

  @override
  void dispose(){
    _productNameTEController.dispose();
    _unitePriceTEController.dispose();
    _productCodeTEController.dispose();
    _productQuantityTEController.dispose();
    _totalPriceTEController.dispose();
    _productImageTEController.dispose();
    super.dispose();


  }
}

