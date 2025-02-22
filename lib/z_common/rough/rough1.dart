// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class StoreCategoriesScreen extends StatelessWidget {
//   StoreCategoriesScreen({super.key});

//   final List<CategoryItem> categoriesList = [
//     CategoryItem(
//       'Sportswear',
//       Icons.sports_basketball,
//       //Colors.yellow,
//     ),
//     CategoryItem(
//       'Sportswear',
//       Icons.sports_basketball,
//       //Colors.yellow,
//     ),
//     CategoryItem(
//       'Sportswear',
//       Icons.sports_basketball,
//       //Colors.yellow,
//     ),
//     CategoryItem(
//       'Footwear',
//       Icons.shopping_bag,
//       //Colors.blue,
//     ),
//     CategoryItem(
//       'Fitness',
//       Icons.fitness_center,
//       //Colors.indigo,
//     ),
//     CategoryItem(
//       'Equipment',
//       Icons.sports_soccer,
//       //Colors.orange,
//     ),
//     CategoryItem(
//       'Team',
//       Icons.group,
//       //Colors.green,
//     ),
//   ];

//   final List<String> subCategoriesList = [
//     'Activewear',
//     'Athletic Tops',
//     'Leggings',
//     'Shorts',
//     'All',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: categoriesList.length,
//       child: Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               // Categories Header
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Store Categories',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Category TabBar
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: SizedBox(
//                   height: 90,
//                   child: TabBar(
//                     isScrollable: true,
//                     //indicatorColor: Colors.white,
//                     indicatorSize: TabBarIndicatorSize.label,
//                     dividerColor: Colors.transparent,
//                     padding: EdgeInsets.zero,
//                     labelPadding: EdgeInsets.symmetric(horizontal: 16),
//                     tabs: categoriesList
//                         .map((category) => Container(
//                               height: 100,
//                               child: Tab(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.all(8),
//                                       decoration: BoxDecoration(
//                                         //color: category.color.withOpacity(0.2),
//                                         borderRadius: BorderRadius.circular(12),
//                                       ),
//                                       child: Icon(
//                                         category.icon,
//                                         size: 24, //color: category.color,
//                                       ),
//                                     ),
//                                     SizedBox(height: 4),
//                                     Text(
//                                       category.title,
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ))
//                         .toList(),
//                   ),
//                 ),
//               ),
//               10.verticalSpace,
//               // SubCategory TabBar
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: SizedBox(
//                   height: 50,
//                   child: TabBar(
//                     isScrollable: true,
//                     indicatorColor: Colors.transparent,
//                     indicatorSize: TabBarIndicatorSize.label,
//                     dividerColor: Colors.transparent,
//                     padding: EdgeInsets.zero,
//                     labelPadding: EdgeInsets.symmetric(horizontal: 8),
//                     tabs: subCategoriesList
//                         .map((subCategory) => Container(
//                               height: 43,
//                               padding: EdgeInsets.symmetric(horizontal: 16),
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[200],
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   subCategory,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ))
//                         .toList(),
//                   ),
//                 ),
//               ),

//               // Products Grid
//               Expanded(
//                 child: TabBarView(
//                   children: categoriesList
//                       .map((category) => _buildProductsGrid())
//                       .toList(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProductsGrid() {
//     return GridView.builder(
//       padding: EdgeInsets.all(16),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 0.75,
//         crossAxisSpacing: 16,
//         mainAxisSpacing: 16,
//       ),
//       itemCount: 6,
//       itemBuilder: (context, index) {
//         return _buildProductCard();
//       },
//     );
//   }

//   Widget _buildProductCard() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 4,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             flex: 3,
//             child: Container(
//               height: 220.h,
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//               ),
//               child: Center(
//                 child: Icon(Icons.shopping_bag, size: 50, color: Colors.grey),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Product Name',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '421 SAR',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green,
//                         ),
//                       ),
//                       Icon(Icons.shopping_cart, size: 20),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CategoryItem {
//   final String title;
//   final IconData icon;
//   //final Color color;

//   CategoryItem(
//     this.title,
//     this.icon, //this.color
//   );
// }
