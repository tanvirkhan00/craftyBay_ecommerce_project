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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if(_scrollController.position.extentBefore < 300) {
      context.read<CategoryListProvider>().fetchCategoryList();
    }
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

            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      controller: _scrollController,
                      itemCount: categoryListProvider.categoryList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (context, index) {
                        return CategoryCard(categoryModel: categoryListProvider.categoryList[index],);
                      },
                    ),
                  ),
                ),
                if(categoryListProvider.loadMoreData)
                  CenterCircularProgress()
              ],
            );
          },
        ),
      ),
    );
  }
}
