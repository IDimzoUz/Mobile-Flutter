import "package:flutter/cupertino.dart";
import "package:imzo/features/docs/presentation/docs_page.dart";
import "package:imzo/features/home/model/category_response.dart";

mixin DocsMixin on State<DocsPage> {

  List<dynamic> navigationStack = [];
  List<dynamic> currentItems = [];
  List<dynamic> breadcrumbs = [];
  List<dynamic> filteredItems = [];
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }


  void navigateBack() {
    if (navigationStack.isNotEmpty) {
      searchController.clear();
      setState(() {
        currentItems = navigationStack.removeLast();
        filteredItems = currentItems;
        breadcrumbs.removeLast();
        if (navigationStack.isEmpty) {
          breadcrumbs = [];
        }
      });
    }
  }


  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      filteredItems = _filterItems(currentItems, searchController.text);
    });
  }

  List<dynamic> _filterItems(List<dynamic> items, String query) {
    if (query.isEmpty) return items;

    final lowerCaseQuery = query.toLowerCase();
    return items.where((item) {
      return item.nameUz.toLowerCase().contains(lowerCaseQuery) ||
          (item.nameEn?.toLowerCase().contains(lowerCaseQuery) ?? false);
          }).toList();
  }

}
