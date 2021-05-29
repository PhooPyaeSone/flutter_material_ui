// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:Shrine/supplemental/asymmetric_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'model/products_repository.dart';
import 'model/product.dart';

class HomePage extends StatelessWidget {
  // TODO: Make a collection of cards (102)
  // TODO: Add a variable for Category (104)

  // List<Card> _buildGridCards(int count) {
  //   List<Card> cards = List.generate(
  //     count,
  //     (index) => Card(
  //       clipBehavior: Clip.antiAlias,
  //       child: Column(
  //         children: [
  //           AspectRatio(
  //             aspectRatio: 18.0 / 11.0,
  //             child: Image.asset('assets/diamond.png'),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text('Title'),
  //                 SizedBox(
  //                   height: 8.0,
  //                 ),
  //                 Text('Secondary Text'),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  //   return cards;
  // }
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(CategoryOne.all);
    if (products.isEmpty) {
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return products
        .map(
          (product) => Card(
            color: Colors.blue,
            clipBehavior: Clip.antiAlias,
            elevation: 0.0,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image.asset(
                    product.assetName,
                    package: product.assetPackage,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        product.name,
                        style: theme.textTheme.button,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        formatter.format(product.price),
                        style: theme.textTheme.caption,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return AsymmetricView(
        products: ProductsRepository.loadProducts(CategoryOne.all));
  }
}

// body:GridView.count(
//         crossAxisCount: 2,
//         mainAxisSpacing: 5.0,
//         padding: EdgeInsets.fromLTRB(13.0, 10.0, 13.0, 10.0),
//         childAspectRatio: 8.0 / 9.0,
//         children: _buildGridCards(context),
//       ),



// Scaffold(
//       // TODO: Add app bar (102)
//       appBar: AppBar(
//         systemOverlayStyle: SystemUiOverlayStyle.dark,
//         leading: IconButton(
//           icon: Icon(
//             Icons.menu,
//             semanticLabel: 'menu',
//           ),
//           onPressed: () {
//             print('Menu button');
//           },
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               print('Search Button');
//             },
//             icon: Icon(
//               Icons.search,
//               semanticLabel: 'search',
//             ),
//           ),
//           IconButton(
//             onPressed: () {
//               print('Filter Button');
//             },
//             icon: Icon(
//               Icons.tune,
//               semanticLabel: 'filter',
//             ),
//           ),
//         ],
//         title: Text('SHRINE'),
//       ),
//       // TODO: Add a grid view (102)
//       body: AsymmetricView(
//         products: ProductsRepository.loadProducts(CategoryOne.all),
//       ),
//       resizeToAvoidBottomInset: false,
//     );
