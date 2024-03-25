// import 'package:flutter/material.dart';
// import 'package:wallet_app/data/model/getcateory.dart';
// import 'package:wallet_app/dio/ApiDioServices.dart';
//
// import '../widgets/categories.dart';
//
// /*class MyApp_ extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Category App',
//       home: CategoryListWidget(),
//     );
//   }
// }
//
// class CategoryListWidget extends StatefulWidget {
//   @override
//   _CategoryListWidgetState createState() => _CategoryListWidgetState();
// }
//
// class _CategoryListWidgetState extends State<CategoryListWidget> {
//   late Future<Category> futureCategories;
//   final String authToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc0xvZ2luIjp0cnVlLCJpZCI6IjY1ZTc3ZGZjMWM0YTE1YWU3YzIwNTZkNiIsImlhdCI6MTcwOTkwMjE5NH0.tlhg5YeQ-EVv-cb-Z5sjPBQCRwxmwLKlXrE7ZGThLOY'; // Replace with your actual token
//
//
//   @override
//   void initState() {
//     super.initState();
//     futureCategories = ApiDioServises.api.fetchNewsData("all",authToken) as Future<Category>;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Category List'),
//       ),
//       body: FutureBuilder<Category>(
//         future: futureCategories,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             //List<UserCategories>? categories = snapshot.data?.userCategories;
//
//             return ListView.builder(
//               itemCount: categories?.length ?? 0,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text('categories?[index].categoryName ?? No Name'),
//                   leading: Image.network('categories?[index].categoryPic ?? No Image'),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }*/
//
//
// class MyApp__ extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Category App',
//       home: CategoryListWidget_(),
//     );
//   }
// }
//
// class CategoryListWidget_ extends StatelessWidget {
//
//   late Future<Category> futureCategories;
//   final String authToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc0xvZ2luIjp0cnVlLCJpZCI6IjY1ZTc3ZGZjMWM0YTE1YWU3YzIwNTZkNiIsImlhdCI6MTcwOTkwMjE5NH0.tlhg5YeQ-EVv-cb-Z5sjPBQCRwxmwLKlXrE7ZGThLOY';
//
//
//   @override
//   void initState() {
//
//     futureCategories = ApiDioServises.api.fetchNewsData("all",authToken) ;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Category List'),
//       ),
//       body:
//       FutureBuilder<Category>(
//         future: futureCategories,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             List<Category>? categories = snapshot.data?.userCategories;
//
//
//             return ListView.separated(
//               padding:
//               EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//               itemCount: categories?.length ?? 0,
//               itemBuilder: (context, index) {
//                 return InkWell(
//                     onTap: (){
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //     builder: (context) => ExpensiveScreen(category: categories[index]),
//                       //   ),
//                       // );
//
//                     },
//                     child: Container(
//                       width: 120,
//                       decoration: BoxDecoration(
//                           color: Colors.white, borderRadius: BorderRadius.circular(18)),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20),
//                             child: Container(
//                                 height: 60,
//                                 width: 60,
//                                 decoration: const BoxDecoration(
//                                     color: Color(0xffDBE7C9), shape: BoxShape.circle),
//                                 child: CircleAvatar(
//                                   backgroundImage: AssetImage('images/line-icon-for-category-vector.jpg'),
//                                   radius: 20,
//                                 )),
//                           ),
//                           Center(
//                               child: Text(
//                                 categories?[index].categoryName ?? 'No Name',
//                                 style: TextStyle(
//                                     fontSize: 18,color: Colors.black
//                                 ),
//                                 maxLines: 3,
//                               )),
//                         ],
//                       ),
//                     )
//                   //CategoryWidget(category: categories[index]);
//                 );
//                 /*ListTile(
//                   title: Text(categories?[index].categoryName ?? 'No Name'),
//                   leading: Image.network(categories?[index].categoryPic ?? 'No Image'),
//                 );*/
//               },
//               separatorBuilder: (context, index) => SizedBox(width: 10),
//               scrollDirection: Axis.horizontal,
//               shrinkWrap: true,
//             );
//           }
//         },
//       ),
//     );
//   }
// }
