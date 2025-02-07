import 'package:flutter/material.dart';
import 'package:may29/controllers/categories_controller/categories_controllers.dart';

class CategoryScreen extends StatelessWidget {
  final categoriesController = CategoriesController();
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(190, 19, 25, 119),
        title: const Center(
          child: Text(
            "Categories",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: categoriesController.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Mahsulotlar mavjud emal"),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          final categories = snapshot.data;
          return GridView.builder(
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(categories![index].image),
                    const SizedBox(height: 5),
                    Text(
                      "\$ ${categories[index].name}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
