import 'package:code_structure/ui/store/cart/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartViewModel(),
      child: Consumer<CartViewModel>(
        builder: (context, value, child) => Scaffold(
          body: Column(
            children: [Text('data')],
          ),
        ),
      ),
    );
  }
}
