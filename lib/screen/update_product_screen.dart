import 'package:flutter/material.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
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
          ),
          TextFormField(
            controller: _unitePriceTEController,
            decoration: const InputDecoration(
              hintText: 'Unit Price',
              labelText: 'Unit Price',
            ),
          ),
          TextFormField(
            controller: _productCodeTEController,
            decoration: const InputDecoration(
              hintText: 'Product Code',
              labelText: 'Product Code',
            ),
          ),
          TextFormField(
            controller: _productQuantityTEController,
            decoration: const InputDecoration(
              hintText: 'Quantity',
              labelText: 'Product Quantity',
            ),
          ),
          TextFormField(
            controller: _totalPriceTEController,
            decoration: const InputDecoration(
              hintText: 'Total Price',
              labelText: 'Total Price',
            ),
          ),
          TextFormField(
            controller: _productImageTEController,
            decoration: const InputDecoration(
              hintText: 'Image',
              labelText: 'Product Image',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(double.maxFinite)),
            onPressed: _onTapAddProductButton,
            child: const Text('Update Product'),
          ),
        ],
      ),
    );
  }

  void _onTapAddProductButton() {}

  @override
  void dispose() {
    _productNameTEController.dispose();
    _unitePriceTEController.dispose();
    _productCodeTEController.dispose();
    _productQuantityTEController.dispose();
    _totalPriceTEController.dispose();
    _productImageTEController.dispose();
    super.dispose();
  }
}
