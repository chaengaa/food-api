// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app/bloc/cart/cart_bloc.dart';
import 'package:foods_app/controller/payment_controller.dart';

class Payment extends StatelessWidget {
  Payment({super.key});
  Paymentcon paymentcon = Paymentcon();
  @override
  Widget build(BuildContext context) {
    final cartItems = context.read<CartBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Text(
        "Total :\$${paymentcon.AfterDiscount(cartItems.state.foodlist).toStringAsFixed(2)}",
      ),
    );
  }
}
