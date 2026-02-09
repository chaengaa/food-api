// ignore_for_file: unnecessary_string_interpolations, avoid_print, deprecated_member_use, must_be_immutable, non_constant_identifier_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:foods_app/bloc/cart/cart_bloc.dart';
import 'package:foods_app/controller/logincon.dart';
import 'package:foods_app/data/notifier.dart';
import 'package:foods_app/models/category.dart' hide Category;
import 'package:foods_app/models/foods.dart';
import 'package:foods_app/service/food_services.dart';
import 'package:foods_app/view/cart_screen.dart';
import 'package:foods_app/view/detail_screen.dart';
import 'package:foods_app/view/filter_products.dart';
import 'package:foods_app/view/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomesState();
}

class _HomesState extends State<HomeScreen> {
  bool isSwitch = false;
  String userName = 'User';
  String userEmail = 'No email';
  String? userPhoto;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  // Load user info when screen loads
  void _loadUserInfo() async {
    final userInfo = await Savelogin.getUserInfo();
    setState(() {
      userName = userInfo['name'] ?? 'User';
      userEmail = userInfo['email'] ?? 'No email';
      userPhoto = userInfo['photo'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Food", style: GoogleFonts.monomakh()),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  // ✅ Show user photo if available
                  child: userPhoto != null
                      ? Image.network(userPhoto!, fit: BoxFit.cover)
                      : Icon(Icons.person),
                ),
              ),
              currentAccountPictureSize: Size(70, 70),
              // Display user name
              accountName: Text(
                userName,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              // Display user email
              accountEmail: Text(
                userEmail,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.dark_mode_outlined),
              title: Text(
                "Night mode",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Switch(
                value: isSwitch,
                onChanged: (value) {
                  setState(() {
                    isSwitch = value;
                    darkmode.value = !darkmode.value;
                  });
                },
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () async {
                await Savelogin.logout();
                await FirebaseAuth.instance.signOut();
                await GoogleSignIn().signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => CartBloc(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Text(
                  "Don't wait,Order your food now!",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(5),
                  child: ImageSlideshow(
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: [
                      Image(
                        width: double.infinity,
                        height: 200,
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1544025162-d76694265947?q=80&w=2069&auto=format&fit=crop",
                        ),
                        fit: BoxFit.cover,
                      ),
                      Image(
                        width: double.infinity,
                        height: 200,
                        image: NetworkImage(
                          "https://b.zmtcdn.com/data/pictures/chains/2/21311152/51162d941fd9c419d0a9fb578f929cfc.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                      Image(
                        width: double.infinity,
                        height: 200,
                        image: NetworkImage(
                          "https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2021/09/beef-burger.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                      Image(
                        width: double.infinity,
                        height: 200,
                        image: NetworkImage(
                          "https://yujinizakaya.com.sg/wp-content/uploads/2025/06/japanese-nigiri-sushi-recipe-1749130962.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                      Image(
                        width: double.infinity,
                        height: 200,
                        image: NetworkImage(
                          "https://unocasa.com/cdn/shop/articles/types_of_coffee_91a828a5-7ff3-427d-acaa-c8b7289c9e5a_600x.jpg?v=1621261041",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: FoodServices.getFood(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error.toString()}"),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Center(child: Text("No data"));
                    }
                    return SizedBox(
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: category.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FilterProducts(
                                      categoryname: category[index].name,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 125,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.4),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "${category[index].image}",
                                      width: 50,
                                      height: 50,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "${category[index].name}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  "Special foods & drinks",
                  style: GoogleFonts.poppins(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 5),
              FutureBuilder<List<Foods>>(
                future: FoodServices.getFood(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error.toString()}"));
                  }
                  if (!snapshot.hasData) {
                    return Center(child: Text("No data"));
                  }
                  final special_foods = snapshot.data!
                      .where((s) => s.special == true)
                      .toList();
                  return SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: special_foods.length,
                      itemBuilder: (context, index) {
                        final items = special_foods[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),

                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailScreen(foods: special_foods[index]),
                                ),
                              );
                            },
                            child: Container(
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://i.pinimg.com/1200x/19/84/a6/1984a6ba4553c6e7eb8ea2008d5350e2.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image.network(
                                      "${items.img}",
                                      width: double.infinity,
                                      height: 90,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 12, left: 12),
                child: Row(
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See All",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: FoodServices.getFood(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error.toString()}"));
                  }
                  if (!snapshot.hasData) {
                    return Center(child: Text("No data"));
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final items = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) =>
                                    DetailScreen(foods: items)),
                              ),
                            );
                          },
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 1.5),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image.network(
                                      "${items.img}",
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                  Text(
                                    "${items.name}",
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
                                        "\$${items.price}",
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          cart.add(
                                            Addtocart(
                                              items: Foods(
                                                id: items.id,
                                                name: items.name,
                                                price: items.price,
                                                qty: items.qty,
                                                img: items.img,
                                                description: items.description,
                                                category: items.category,
                                                special: items.special,
                                              ),
                                              count: 0,
                                            ),
                                          );
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CartScreen(),
                                            ),
                                          );
                                        },
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
            ],
          ),
        ),
      ),
    );
  }
}
