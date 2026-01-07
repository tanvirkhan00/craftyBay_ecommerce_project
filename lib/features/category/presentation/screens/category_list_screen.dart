import 'package:ecommerce_project/features/category/presentation/provider/category_list_provider.dart';
import 'package:ecommerce_project/features/common/presentation/provider/main_nav_container_provider.dart';
import 'package:ecommerce_project/features/common/presentation/widgets/category_card.dart';
import 'package:ecommerce_project/features/common/presentation/widgets/center_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchCategoryList();
    });
  }

  Future<void> _fetchCategoryList() async {
    context.read<CategoryListProvider>().fetchCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_, __) {
        context.read<MainNavContainerProvider>().backHome();
      },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.read<MainNavContainerProvider>().backHome();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Category"),
        ),
        body: Consumer<CategoryListProvider>(
          builder: (context, categoryListProvider, _) {
            if (categoryListProvider.initialLoading) {
              return CenterCircularProgress();
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: categoryListProvider.categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return CategoryCard(categoryModel: categoryListProvider.categoryList[index],);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
