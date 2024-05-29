import 'package:continuse_2/src/config/color/appcolor.dart';
import 'package:continuse_2/src/data/mock_database.dart';
import 'package:continuse_2/src/domain/product.dart';
import 'package:continuse_2/src/features/home_screen/presentation/detail_screen_product.dart';
import 'package:continuse_2/src/features/home_screen/presentation/new_product_screen.dart';
import 'package:flutter/material.dart';

class HomeProductScreen extends StatefulWidget {
  final MockDatabase mockdb;

  const HomeProductScreen(this.mockdb, {super.key});

  @override
  State<HomeProductScreen> createState() => HomeProductScreenState();
}

class HomeProductScreenState extends State<HomeProductScreen> {
  void callback() {
    setState(() {
      debugPrint("Product list updated");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backroundhomescreen,
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Willkommen zum Homescreen!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) =>
                        NewProductScreen(widget.mockdb, callback)),
                  ),
                );
              },
              child: const Text("Neues Produkt hinzufügen"),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: widget.mockdb.getAllProduct(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('Keine Produkte verfügbar.'));
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Product product = snapshot.data![index];
                        return Card(
                          child: ListTile(
                            title: Text(product.title),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      DetailScreenProduct(product)),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
