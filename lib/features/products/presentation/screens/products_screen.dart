import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/app_routes.dart';
import '../cubit/products_cubit.dart';
import 'search.dart';
import '../widgets/product_item.dart';
import '../../../user/presentation/bloc/user_bloc.dart';

import '../../../../inject_container.dart';
import '../../../user/data/datasources/user_local_data_source.dart';
import '../widgets/seperator_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductsCubit>()..getAllProducts(),
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.shopping_basket_outlined),
                title: Text(
                  'Orders',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.ordersScreen);
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket_outlined),
                title: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  sl<UserLocalDataSource>().signOut();
                },
              ),
              ListTile(
                title: Text('Profile'),
                leading: Icon(Icons.person_outline),
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.profileScreen);
                },
              ),
            ],
          ),
        ),
        body: DefaultTabController(
          length: 4,
          child: SafeArea(
            child: NestedScrollView(
              body: TabBarView(
                children: [
                  BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductsLoadedState) {
                        return ListView.separated(
                          itemBuilder: (context, index) => ProductItem(
                            product: state.products.foodProducts[index],
                          ),
                          itemCount: state.products.foodProducts.length,
                          separatorBuilder: (context, index) => SeparatorItem(),
                        );
                      } else if (state is ProductsErrorState) {
                        return Center(
                          child: Text(state.msg),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductsLoadedState) {
                        return ListView.separated(
                          itemBuilder: (context, index) => ProductItem(
                            product: state.products.drinkProducts[index],
                          ),
                          itemCount: state.products.drinkProducts.length,
                          separatorBuilder: (context, index) => SeparatorItem(),
                        );
                      } else if (state is ProductsErrorState) {
                        return Center(
                          child: Text(state.msg),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductsLoadedState) {
                        return ListView.separated(
                          itemBuilder: (context, index) => ProductItem(
                            product: state.products.snackProducts[index],
                          ),
                          itemCount: state.products.snackProducts.length,
                          separatorBuilder: (context, index) => SeparatorItem(),
                        );
                      } else if (state is ProductsErrorState) {
                        return Center(
                          child: Text(state.msg),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductsLoadedState) {
                        return ListView.separated(
                          itemBuilder: (context, index) => ProductItem(
                            product: state.products.sauceProducts[index],
                          ),
                          itemCount: state.products.sauceProducts.length,
                          separatorBuilder: (context, index) => SeparatorItem(),
                        );
                      } else if (state is ProductsErrorState) {
                        return Center(
                          child: Text(state.msg),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => [
                SliverAppBar(
                  backgroundColor: Colors.grey[100],
                  foregroundColor: Colors.black,
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.cartScreen);
                      },
                      icon: Icon(Icons.add_shopping_cart_rounded),
                    ),
                  ],
                  expandedHeight: 350,
                  elevation: 0.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          const Text(
                            'Delicious\nfood for you',
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              showSearch(context: context, delegate: Search());
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 30),
                              height: 60,
                              padding: const EdgeInsets.only(left: 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[300],
                              ),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Search',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottom: TabBar(
                    padding: const EdgeInsetsDirectional.only(start: 60),
                    isScrollable: true,
                    unselectedLabelColor: Colors.black,
                    labelColor: Color(0xFFFA4A0C),
                    tabs: [
                      Tab(
                        child: Text(
                          "Foods",
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Drinks",
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Snacks",
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Sauce",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
