// ignore_for_file: unnecessary_string_interpolations, deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:foods_app/models/foods.dart';
import 'package:foods_app/service/food_services.dart';
import 'package:foods_app/view/detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchs extends StatefulWidget {
  const Searchs({super.key});

  @override
  State<Searchs> createState() => _SearchsState();
}

class _SearchsState extends State<Searchs> {
  TextEditingController searchcon = TextEditingController();
  List<Foods> searchfoods = [];

  @override
  void dispose() {
    searchcon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Product",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        // automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Foods>>(
        future: FoodServices.getFood(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error.toString()}"));
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  ),
                  child: TextField(
                    controller: searchcon,
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          //pel ot enter text
                          searchfoods = [];
                        } else {
                          searchfoods = snapshot.data!
                              .where(
                                (food) => food.name!.toLowerCase().contains(
                                  value.toLowerCase(),
                                ),
                              )
                              .toList();
                        }
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Find',
                      suffixIcon: IconButton(
                        onPressed: () {
                          searchcon.clear();
                          setState(() {
                            //clear text pel empty
                            searchfoods = [];
                          });
                        },
                        icon: Icon(Icons.clear),
                      ),
                      contentPadding: EdgeInsetsGeometry.only(top: 12),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: searchfoods.length,
                    itemBuilder: (context, index) {
                      final item = searchfoods[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(foods: item),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Image.network(
                            item.img!,
                            width: 50,
                            height: 50,
                            // fit: BoxFit.cover,
                          ),
                          title: Text(item.name ?? ""),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
