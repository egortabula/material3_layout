import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/material3_layout.dart';
import 'package:package_test/pages/products/components/details_page.dart';
import 'package:package_test/pages/products/components/product_list.dart';
import 'package:package_test/pages/products/product_page_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.green,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      home: const ScreenWidget(),
    );
  }
}

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductPageController());
    final destinations = <DestinationModel>[
      DestinationModel(
        label: 'Products',
        selectedIcon: const Icon(Icons.storefront),
        icon: const Icon(Icons.storefront),
        tooltip: 'Products page',
      ),
      DestinationModel(
          label: 'Clients',
          selectedIcon: const Icon(Icons.group),
          badge: const Badge(
            child: Icon(Icons.group_outlined),
          ),
          tooltip: 'Clients page'),
    ];

    final pages = <PageLayout>[
      PageLayout(
        compactLayout: SinglePaneLayout(
          child: PaneContainerWidget(
            borderRadius: 0,
            child: ProductList(
              onTap: () {
                Get.to(const DetailsPage());
              },
            ),
          ),
        ),
        mediumLayout: SinglePaneLayout(
          verticalPadding: 24,
          child: PaneContainerWidget(
            child: ProductList(
              onTap: () {
                Get.to(const DetailsPage());
              },
            ),
          ),
        ),
        expandedLayout: TwoPaneLayout(
          verticalPadding: 24,
          fixedPaneChild: PaneContainerWidget(
            surfaceColor: SurfaceColorEnum.surfaceContainerLow,
            child: ProductList(
              onTap: () {},
            ),
          ),
          flexiblePaneChild: PaneContainerWidget(
            child: Obx(() {
              final controller = Get.find<ProductPageController>();
              return Center(
                child: Image.asset(controller.selectedProduct.photoUrl)
              );
            }),
          ),
        ),
      ),
      PageLayout(
        compactLayout: SinglePaneLayout(
          child: PaneContainerWidget(
            child: Center(
              child: Text(
                'Compact layout',
                style: Get.textTheme.headlineMedium,
              ),
            ),
          ),
        ),
        mediumLayout: SplitPaneLayout(
          verticalPadding: 24,
          leftChild: PaneContainerWidget(
            surfaceColor: SurfaceColorEnum.surfaceContainerLow,
            child: Center(
              child: Text(
                'medium layout left child',
                style: Get.textTheme.headlineMedium,
              ),
            ),
          ),
          rightChild: PaneContainerWidget(
            surfaceColor: SurfaceColorEnum.surface,
            child: Center(
              child: Text(
                'medium layout right child',
                style: Get.textTheme.headlineMedium,
              ),
            ),
          ),
        ),
        expandedLayout: TwoPaneLayout(
          verticalPadding: 24,
          fixedPaneChild: PaneContainerWidget(
            surfaceColor: SurfaceColorEnum.surfaceContainerLow,
            child: Center(
              child: Text(
                'expanded layout fixed pane',
                style: Get.textTheme.headlineMedium,
              ),
            ),
          ),
          flexiblePaneChild: PaneContainerWidget(
            child: Center(
              child: Text(
                'expanded layout flexible pane',
                style: Get.textTheme.headlineMedium,
              ),
            ),
          ),
        ),
      ),
    ];

    return NavigationScaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text('Awesome app'),
        centerTitle: true,
      ),
      theme: Theme.of(context),
      navigationType: NavigationTypeEnum.railAndBottomNavBar,
      navigationSettings: RailAndBottomSettings(
        addThemeSwitcherTrailingIcon: true,
        destinations: destinations,
        pages: pages,
      ),
      onDestinationSelected: (int index) => log(
        'Page changed: Current page: $index',
      ),
    );
  }
}
