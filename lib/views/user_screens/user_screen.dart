import 'package:flutter/material.dart';
import 'package:may29/controllers/user_controllers/user_controller.dart';

class UserScreen extends StatelessWidget {
  final productsController = UserController();
  UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(190, 19, 25, 119),
        title: const Center(
          child: Text(
            "Users",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
          future: productsController.getUsers(),
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
            final users = snapshot.data;
            return GridView.builder(
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(users![index].avatar),
                      const SizedBox(height: 5),
                      Text(
                        users[index].name,
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        users[index].email,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        users[index].password,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
