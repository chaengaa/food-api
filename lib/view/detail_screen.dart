// ignore_for_file: must_be_immutable, deprecated_member_use, unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app/bloc/cart/cart_bloc.dart';
import 'package:foods_app/models/foods.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class DetailScreen extends StatefulWidget {
  Foods foods;
  DetailScreen({super.key, required this.foods});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 0;
  bool addPressed = false;
  bool removePressed = false;

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "${widget.foods.name}",
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Image.network(
                    "${widget.foods.img}",
                    width: 300,
                    height: 300,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "\$${widget.foods.price}",
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.chevron_left, size: 30),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.chevron_right, size: 30),
                    ),
                  ],
                ),
                Text(
                  widget.foods.rating == 5
                      ? "⭐⭐⭐⭐⭐ ${widget.foods.rating}"
                      : widget.foods.rating! >= 4
                      ? "⭐⭐⭐⭐ ${widget.foods.rating}"
                      : widget.foods.rating! >= 3
                      ? "⭐⭐⭐ ${widget.foods.rating}"
                      : "⭐ ${widget.foods.rating}",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 18),
                Text(
                  "Details",
                  style: GoogleFonts.poppins(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 22),
                Text(
                  "${widget.foods.description}",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          count--;
                        });
                        removePressed = true;
                        addPressed = false;
                      },
                      icon: Icon(
                        Icons.remove_circle,
                        color: removePressed
                            ? Colors.red
                            : Colors.black.withOpacity(0.8),
                        size: 28,
                      ),
                    ),

                    Text(
                      "$count",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                        addPressed = true;
                        removePressed = false;
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: addPressed
                            ? Colors.red
                            : Colors.black.withOpacity(0.8),
                        size: 28,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 120,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (count <= 0) {
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              title: 'Oops...',
                              text: 'Quantity invalid',
                            );
                          } else {
                            cart.add(
                              Addtocart(
                                items: Foods(
                                  id: widget.foods.id,
                                  name: widget.foods.name,
                                  price: widget.foods.price,
                                  qty: count,
                                  img: widget.foods.img,
                                  description: widget.foods.description,
                                  category: widget.foods.category,
                                  special: widget.foods.special,
                                ),
                                count: count,
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          "Add",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
