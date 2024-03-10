import 'package:flutter/material.dart';
import 'package:wallet_app/data/model/categoryModel.dart';
import 'package:wallet_app/dio/ApiDioServices.dart';

class MyApp_ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Category App',
      home: CategoryListWidget(),
    );
  }
}

class CategoryListWidget extends StatefulWidget {
  @override
  _CategoryListWidgetState createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  late Future<Category> futureCategories;
  final String authToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc0xvZ2luIjp0cnVlLCJpZCI6IjY1ZTc3ZGZjMWM0YTE1YWU3YzIwNTZkNiIsImlhdCI6MTcwOTkwMjE5NH0.tlhg5YeQ-EVv-cb-Z5sjPBQCRwxmwLKlXrE7ZGThLOY'; // Replace with your actual token


  @override
  void initState() {
    super.initState();
    futureCategories = ApiDioServises.api.fetchNewsData("all",authToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category List'),
      ),
      body: FutureBuilder<Category>(
        future: futureCategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<UserCategories>? categories = snapshot.data?.userCategories;

            return ListView.builder(
              itemCount: categories?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(categories?[index].categoryName ?? 'No Name'),
                  leading: Image.network(categories?[index].categoryPic ?? 'No Image'),
                );
              },
            );
          }
        },
      ),
    );
  }
}