import 'package:flutter/material.dart';
import 'package:may29/controllers/product_controller.dart';

class ProductsScreen extends StatelessWidget {
  final productsController = ProductController();
  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(190, 19, 25, 119),
        title: const Center(
          child: Text(
            "Products",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
          future: productsController.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Mahsulotlar mavjud emas"),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            final products = snapshot.data;
            return products == null || products.isEmpty
                ? const Center(
                    child: Text("Mahsulotlar mavjud emas"),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisExtent: 4,
                      crossAxisSpacing: 4,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Image(
                                image: NetworkImage(products[index].images[0])),
                          ),
                          Text("Nima"),
                        ],
                      );
                    },
                  );
          }),
    );
  }
}
