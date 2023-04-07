- [About](#about)
- [Features](#features)
- [Instalation](#instalation)
- [Usage](#usage)
  - [First step](#first-step)
  - [NavigationScaffold](#navigationscaffold)
    - [appBar](#appbar)
    - [Theme](#theme)
    - [navigationType](#navigationtype)
      - [1: drawer](#1-drawer)
      - [2: modalDrawer](#2-modaldrawer)
      - [3: railAndBottomNavBar](#3-railandbottomnavbar)
    - [NavigationSettings](#navigationsettings)
      - [RailAndBottomSettings](#railandbottomsettings)
      - [DrawerSettings](#drawersettings)
        - [NavigationDrawerDestination](#navigationdrawerdestination)
        - [CustomNavigationDrawer.sectionHeader](#customnavigationdrawersectionheader)
        - [CustomNavigationDrawer.headerTitle](#customnavigationdrawerheadertitle)
        - [CustomNavigationDrawer.sectionDivider,](#customnavigationdrawersectiondivider)
      - [NavigationTypeEnum](#navigationtypeenum)
    - [onDestinationSelected](#ondestinationselected)
    - [Full example of NavigationScaffold](#full-example-of-navigationscaffold)
  - [PageLayout widget](#pagelayout-widget)
      - [Example](#example)
    - [Single pane layout](#single-pane-layout)
      - [Example](#example-1)
    - [Two pane layout](#two-pane-layout)
      - [Example](#example-2)
    - [Split pane layout](#split-pane-layout)
        - [Example](#example-3)
    - [Layout mixin](#layout-mixin)
    - [Recomendations](#recomendations)
  - [PaneContainer widget](#panecontainer-widget)
    - [Features](#features-1)
    - [Example](#example-4)
    - [Comparison](#comparison)
- [Conclusion](#conclusion)

# About
![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fm3%2Fimages%2Fld95v1q8-3p_Designing-across-window-classes_2x.png?alt=media&token=ed808875-5318-41dc-89c5-c041ccb877fa)

I created this package to simplify the development of adaptive applications for compact, medium and large screens. This package is fully built on the [Material Design 3 guideline](https://m3.material.io/foundations/layout/understanding-layout/overview).

![](https://file.notion.so/f/s/ae922b0f-db71-4aca-b8fa-46b47497892a/Flutter_material_3_adaptive_design_package_material3_layout.mp4?id=0c5f001d-ce78-48e9-b568-a77f9a1db139&table=block&spaceId=990399a8-1934-4642-bbde-dff011840a37&expirationTimestamp=1680945007762&signature=DuRWAOdvlfYjmdFVVZ8syBljU6PPr20Pyi3eljt4sTE&downloadName=Flutter+material+3+adaptive+design+package+material3_layout.mp4)

# Features
- 🚦 Automatic switching between primary navigation based on 3 breakpoints (compact/medium/expanded) 📲
- 🚪 Support Navigation Bar (for mobile), Navigation Rail, Drawer and Modal Drawer 🗄️
- 📑 Page switching out of the box, without the need for state management 📦
- 🎨 3 layouts (Single Pane/Two Pane/Split Pane) 🛋️
- 🎉 Material 3 theming out of the box 🎊
- 🌞 Theme mode switch 🌜
- 🎓 Simple API 🎓

https://file.notion.so/f/s/ae922b0f-db71-4aca-b8fa-46b47497892a/Flutter_material_3_adaptive_design_package_material3_layout.mp4?id=0c5f001d-ce78-48e9-b568-a77f9a1db139&table=block&spaceId=990399a8-1934-4642-bbde-dff011840a37&expirationTimestamp=1680945007762&signature=DuRWAOdvlfYjmdFVVZ8syBljU6PPr20Pyi3eljt4sTE&downloadName=Flutter+material+3+adaptive+design+package+material3_layout.mp4

# Instalation
To use this package, add material3_layout as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  material3_layout: ^0.0.1
  get: ^lastVersion
```

# Usage
Developing adaptive applications for different devices and form factors is not an easy task, but I have created a package that simplifies this development process and saves your time!

## First step
To begin, change MaterialApp to **`GetMaterialApp`** and make sure to set `useMaterial3` to true, otherwise the material design theme won't work.

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // use GetMaterialApp instead of MaterialApp
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true, // HERE!
      ),
      darkTheme: ThemeData(
        useMaterial3: true, // HERE!
      ),
      themeMode: ThemeMode.light,
      home: const ScreenWidget(),
    );
  }
}
```
## NavigationScaffold
Navigation Scaffold is essentially a modified Scaffold for managing primary navigation. Therefore, it will be your main widget, and there is **no need** to wrap it inside a regular Scaffold.

```dart
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationScaffold(
      appBar: ,
      theme: ,
      navigationType: ,
      navigationSettings: ,
      onDestinationSelected: (int index) => ,
    );
  }
}
```
It takes 5 parameters, let's go over each one.

### appBar
You can pass a regular `AppBar()` that will be displayed on every page of your application. This parameter is optional. However, if you choose the modal driver as the primary navigation, in that case, even if you do not specify it, it will be automatically added to display the icon for opening and closing the drawer.

```dart
return NavigationScaffold(
      appBar: AppBar(
        title: Text('App title'),
        centerTitle: true,
      )
      theme: ,
      navigationType: ,
      navigationSettings: ,
      onDestinationSelected: (int index) => ,
    );
```

### Theme
As an argument for the theme parameter, you need to pass an instance of the ThemeData class. This is necessary for the Material 3 theme to work correctly, as well as for switching between dark and regular themes. This parameter is required, just pass `Theme.of(context)` into it and that's it.

```dart
return NavigationScaffold(  
      theme: Theme.of(context),
    );
```

### navigationType
This parameter is responsible for what will be displayed as primary navigation. As an argument for the navigationType parameter, you need to pass `NavigationTypeEnum`.

NavigationTypeEnum has 3 options:
![](https://lh3.googleusercontent.com/FxLcPe7ocSQ4jkcMMlgoldT13WWOC-FsXIo2k7xCifnkBxQtEwEa2YcGLyYTOn9zQfhY3S1v-Mfe7Iz2EtzOQUT6TYcZBHXUODjo0McyNh-oEw=s0)
#### 1: drawer
`NavigationTypeEnum.drawer` - On large and medium screens, NavigationDrawer will be displayed, on small screens, ModalDrawer will be displayed.

```dart
return NavigationScaffold(  
      navigationType: NavigationTypeEnum.drawer
    );
```
#### 2: modalDrawer
`NavigationTypeEnum.modalDrawer` - the same as a regular drawer, but this one is modal and will open by clicking on the menu icon in the appbar on any screen.

```dart
return NavigationScaffold(  
      navigationType: NavigationTypeEnum.modalDrawer
    );
```
#### 3: railAndBottomNavBar
`NavigationTypeEnum.railAndBottomNavBar` - this is the default option. On large and medium screens, NavigationRail will be displayed, on small screens, NavigationBar (at the bottom of the screen) will be displayed.
```dart
return NavigationScaffold(  
      navigationType: NavigationTypeEnum.railAndBottomNavBar
    );
```

If you do not explicitly specify NavigationTypeEnum, `NavigationTypeEnum.railAndBottomNavBar` will be selected.

### NavigationSettings
The navigationSettings parameter is responsible for configuring and displaying your Primary navigation. It takes either a DrawerSettings or RailAndBottomSettings as an argument.

#### RailAndBottomSettings
RailAndBottomSettings takes only 2 required parameters and 7 optional ones. Let's take a closer look at each parameter:

1. `pages` - accepts a list of widgets for your app's pages
2. `destinations` - accepts a list of `DestinationModel`. This is an analog of the usual NavigationRailDestination/NavigationDestination/NavigationDrawerDestination
```dart
DestinationModel(
    label: 'Home',
    icon: const Icon(Icons.home_outlined),
    selectedIcon: const Icon(Icons.home_filled),
    tooltip: 'Home page',
    badge: // Choose or badge or icon parameter
),
```
3. `leading` - shown only in NavigationRail on medium and large screens at the top of the NavigationRail. Accepts any widget
4. `trailing` - shown only in NavigationRail on medium and large screens below the last destination. Accepts any widget.
5. `groupAlignment`: If set to -1.0, the destinations in NavigationRail will be at the top, 0.0 will be in the middle, and 1.0 will be at the bottom
6. `addThemeSwitcherTrailingIcon`: If true, a button will be displayed at the bottom of NavigationRail to switch between dark and light themes. It works automatically, no logic needs to be written for it.
7. `type`: it accepts NavigationTypeEnum, and is already set as needed, it does not need to be changed.
8. `showMenuIcon`: If true, an icon will be displayed at the top of NavigationRail. Clicking on it will expand NavigationRail and clicking again will hide it. This works out of the box.
9. `labelType`: determines the display of the label in NavigationRail.

```dart
return NavigationScaffold(  
      navigationSettings: RailAndBottomSettings(
        pages: <Widget>[],
        destinations: [
          DestinationModel(
            label: 'Home',
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home_filled),
            tooltip: 'Home page',
          ),
          DestinationModel(
            label: 'Users',
            icon: const Icon(Icons.group_outlined),
            selectedIcon: const Icon(Icons.group),
            tooltip: 'Users page',
          ),
          DestinationModel(
            label: 'Messages',
            badge: Badge.count(
              count: 125,
              child: const Icon(Icons.message_outlined),
            ),
            selectedIcon: const Icon(Icons.message),
            tooltip: 'Messages',
          ),
        ],
        leading: const CircleAvatar(),
        trailing: const Icon(Icons.exit_to_app),
        showMenuIcon: false,
        groupAlignment: -1.0,
        labelType: NavigationRailLabelType.all,
      ),
    );
```

#### DrawerSettings
Use DrawerSettings if you have selected drawer or modalDrawer as the navigationType parameter. It accepts 3 required parameters: pages, destinations, and type.

1. `pages` - accepts a list of widgets for your app's pages
2. `destinations` - accepts a list of Widgets

##### NavigationDrawerDestination
Use it for add destination

```dart
destinations: [
    NavigationDrawerDestination(
        icon: Icon(Icons.home),
        label: Text('Home')
    )
    // add other destinations
]
```
##### CustomNavigationDrawer.sectionHeader
Use it if you want to add header

```dart
destinations: [
    CustomNavigationDrawer.sectionHeader('Header label'),
    NavigationDrawerDestination(),
    NavigationDrawerDestination(),
    NavigationDrawerDestination(),
]
```
##### CustomNavigationDrawer.headerTitle
Use it to add text header

```dart
destinations: [
    CustomNavigationDrawer.drawerTitle('Awesome drawer'),
    NavigationDrawerDestination(),
    NavigationDrawerDestination(),
    NavigationDrawerDestination(),
]
```

##### CustomNavigationDrawer.sectionDivider,
Use it if you need to divide menu sections in your drawer.

```dart
destinations: [
    NavigationDrawerDestination(),
    NavigationDrawerDestination(),
    NavigationDrawerDestination(),
    CustomNavigationDrawer.sectionDivider(),
    NavigationDrawerDestination(),
    NavigationDrawerDestination(),
    NavigationDrawerDestination(),
]
```

#### NavigationTypeEnum
Select the same navigation type that you previously set in NavigationScaffold.

### onDestinationSelected
You can pass your own business logic to the onDestinationSelected method, which will be executed when the user navigates to a certain page. **IMPORTANT**! You don't need to pass the code here to change the currently selected page, as it is already implemented out of the box.

```dart
return NavigationScaffold(
    onDestinationSelected: (int index) {
        // Pass your bussiness logic here
    }
);
```

### Full example of NavigationScaffold

```dart
return NavigationScaffold(
    appBar: AppBar(
        elevation: 2,
        title: const Text('Awesome app'),
        centerTitle: true,
    ),
    theme: Theme.of(context),
    navigationType: NavigationTypeEnum.railAndBottomNavBar,
    navigationSettings: RailAndBottomSettings(
        destinations: <DestinationModel>[
          DestinationModel(
            label: 'Home',
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            tooltip: 'Home page',
          ),
          DestinationModel(
            label: 'Profile',
            icon: const Icon(Icons.person_2_outlined),
            selectedIcon: const Icon(Icons.person_2),
            tooltip: 'Profile page',
          ),
          DestinationModel(
            label: 'Settings',
            badge: Badge.count(
              count: 3,
              child: const Icon(Icons.settings_outlined),
            ),
            selectedIcon: const Icon(Icons.settings),
            tooltip: 'Settings',
          ),
        ],
        pages: <Widget>[
          HomePage(),
          ProfilePage(),
          SettingsPage(),
        ],
        addThemeSwitcherTrailingIcon: true,
        groupAlignment: 0.0,
    ),
    onDestinationSelected: (int index) => log(
        'Page changed: Current page: $index',
      ),
    );
```

## PageLayout widget
![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fm3%2Fimages%2Fld95v1q8-3p_Designing-across-window-classes_2x.png?alt=media&token=ed808875-5318-41dc-89c5-c041ccb877fa)

`PageLayout` is the main widget for the content of your page. It takes three parameters with type `Layout`, each of which controls how your widgets will be displayed on different screen sizes:

1. **compactLayout** - This parameter controls the layout on screens smaller than 600 dp.
2. **mediumLayout** - This parameter controls the layout on screens from 600 dp to 840 dp.
3. **expandedLayout** - This parameter controls the layout on screens larger than 840 dp.

#### Example
```dart
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageLayout(
      compactLayout: 
      mediumLayout: 
      extendedLayout: 
    );
  }
}
```
The material design guideline presents 3 layout options for different needs. In this package, they are represented as 3 widgets:

### Single pane layout
![](https://lh3.googleusercontent.com/mAEi5-k_orJ8GPgo8MUzk7El6jbA6gKobHVljJMReM6sbFgXGEU1Ot0ShLbc_D3biy08U5OWbFZ-45Q0UNH-CO9UBeO0KktlISnlYA1yy7a-=s0)

When using `SinglePaneLayout`, all the content of your page will be placed on a single pane that will stretch across the width of your screen.


#### Example
```dart
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageLayout(
      compactLayout: SinglePaneLayout(

        // add some vertical padding to the page. 
        // Horizontal padding is added out of the box, depending of screen size
        // By default is set to  0
        verticalPadding: 10, 

        // Pass your widgets here
        child: YourContentWidget(),
      );
    );
  }
}
```

### Two pane layout
![](https://lh3.googleusercontent.com/bdDdDI-pkZpGRHykDTXX943ZiveRF8O9DZGnfwYDnEHShHOSLN1ca1syyo2p81Rrg-QKX4aBFSLsTK-iOasGxI-udN5jJP4RKR9Sxg0ZWqg=s0)

TwoPaneLayout have two panes
1. Fixed pane with fixed 360 width
2. Flexible pane that takes all remaining space.

Also, there is a 24dp spacing between the two panes. You do not need to add it separately, it will be added automatically.

#### Example
```dart
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageLayout(
      compactLayout: ,
      mediumLayout: ,
      expandedLayout: TwoPaneLayout(
        fixedPaneChild: YourFixedWidgetHere(),
        flexiblePaneChild: YourFlexibleWidgetHere(),
        // Fixed pane can be positioned either 
        // on the left (by default) or on the right
        fixedPanePosition: FixedPanePositionEnum.left,
        verticalPadding: 0,
      );
    );
  }
}
```

*TwoPaneLayout is recommended to be used only for the expandedLayout.*

### Split pane layout
![](https://lh3.googleusercontent.com/6b0sjS4KB5OQCjgxufPH2SQ9e4TrexQGG6iGbwiC64dUhmFOaGh2hDE8EQd7ZobzlyoGaQ3pbK4jURgYTMEm57qnhSTNXgFh77sChMXQhHDz=s0)

`SplitPaneLayout` is an alternative to `TwoPaneLayout`. It also takes 2 panes, but they have the **same width**.

Typically, it is used with the `expandedLayout` and sometimes with the `mediumLayout`.

##### Example
```dart
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SplitPaneLayout(
      leftChild: YourLeftWidgets,
      rightChild: YourRightWidgets,
      verticalPadding: 0,
    );
  }
}
```

### Layout mixin
The parameters of the `PageLayout` widget accept only the `Layout` type, which means only the `SinglePaneLayout`/`TwoPaneLayout`/`SplitPaneLayout` widgets.

Doing it as shown in the example below is not possible. That's because the `MediumLayout` widget doesn't have a `Layout` type.

```dart
class MediumLayout extends StatelessWidget {
  const MediumLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SinglePaneLayout(
        child: ...
    )
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageLayout(
        // You can't do that because 
        // the MediumLayout class has the type of
        // StatelessWidget, not Layout.
        mediumLayout: MediumLayout(),
    );
  }
}
```
To make this code work, you need to add the `Layout` class mixin to your widget using the `with` keyword.

```dart
class MediumLayout extends StatelessWidget with Layout{
  const MediumLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SinglePaneLayout(
        child: ...
    )
  }
}
```

### Recomendations
Here are some general recommendations for choosing layouts for different screen sizes:

| Compact layout   | Medium layout    | Expanded layout |
| ---------------- |:----------------:| :--------------:|
| SinglePaneLayout | SinglePaneLayout | TwoPaneLayout   |
|                  | SplitPaneLayout  | SplitPaneLayout |
|                  |                  | SinglePaneLayout|

You can read more about [layouts](https://m3.material.io/foundations/layout/applying-layout/window-size-classes) and [part of layouts](https://m3.material.io/foundations/layout/understanding-layout/parts-of-layout) in the official Material Design 3 guidelines.

## PaneContainer widget
`PaneContainerWidget` is a wrapper widget for your widgets that you will place inside SinglePaneLayout/TwoPaneLayout/SplitPaneLayout. 

![](https://lh3.googleusercontent.com/Na0lNSb8aOGk_ojVeIRA983CN31-S59xGL28OPkN1pOBf2wgc_SQs2-Oo1gbOgoAAxdZyxDGxWGUm9QSGpMHZQysfuE4aX9j7JO0uk7Ccy6Ctw=s0)

### Features
- Choice of surface color
- Easy border radius customization
- Customization of container width and height (initially set to double.infinity)
- Padding customization

This widget supports 5 new surface colors that were recently [introduced in the latest update](https://material.io/blog/tone-based-surface-color-m3) of Material Design.

### Example
```dart
return SinglePaneLayout(
    child: PaneContainerWidget(
        surfaceColor: SurfaceColorEnum.surfaceContainer,
        child: // Put your widget here
    ),
);
```
### Comparison
![](https://i.ibb.co/31rXBwg/Flutter-material-3-layout-surface-color-example.gif)

It is not required, but personally, I like it!

# Conclusion
Thank you for watching until the end! I hope I was able to explain how this package works. But if you still have any questions, you can write to me on [Telegram](https://t.me/egor_tabula) or [GitHub](https://github.com/egortabula/shopping_cart), and I will try to help as much as possible.

[![Buy me a coffe](https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png "Buy me a coffe")](https://www.buymeacoffee.com/egortabula "Buy me a coffe")
