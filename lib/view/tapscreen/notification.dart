import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app/bloc/cart/cart_bloc.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.read<CartBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      // drawer: Drawer(
      //   child: Column(
      //     children: [
      //       UserAccountsDrawerHeader(
      //         accountName: Text("Maek"),
      //         accountEmail: Text("+855 000000000"),
      //       ),
      //     ],
      //   ),
      // ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.foodlist.length,
            itemBuilder: (context, item) {
              final cart = state.foodlist[item];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 1.2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text("${cart.name}")
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
