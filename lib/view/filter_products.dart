// ignore_for_file: unnecessary_string_interpolations, deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:foods_app/models/foods.dart';
import 'package:foods_app/service/food_services.dart';
import 'package:foods_app/view/detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterProducts extends StatelessWidget {
  String categoryname;
  FilterProducts({super.key, required this.categoryname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryname,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Foods>>(
        future: FoodServices.getFood(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error.toString()}"));
          }
          if (!snapshot.hasData) {
            return Center(child: Text("No Data."));
          }
          final items = snapshot.data!
              .where(
                (i) => i.category?.toLowerCase() == categoryname.toLowerCase(),
              )
              .toList(); //cilck product ey jenh ng

          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              childAspectRatio: 0.9,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final pro = items[index];
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(foods: pro),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.network(
                              "${pro.img}",
                              width: 120,
                              height: 120,
                            ),
                          ),
                          Text(
                            "${pro.name}",
                            style: GoogleFonts.monomakh(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                            maxLines: 1,
                          ),
                          Row(
                            children: [
                              Text(
                                "\$${pro.price}",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
