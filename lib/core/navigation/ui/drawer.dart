import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NavigationDrawer extends ConsumerStatefulWidget {
  const NavigationDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NavigationDrawerState();
}

class _NavigationDrawerState extends ConsumerState<NavigationDrawer> {
  bool isExtended = false;
  bool forceCollapsed = true;
  int currentIndex = 0;
  bool showExtendedContent = false;

  @override
  Widget build(BuildContext context) {
    currentIndex = getNavigationIndex(GoRouterState.of(context).uri.toString());
    isExtended = MediaQuery.of(context).size.width > 1400 && !forceCollapsed;
    return AnimatedContainer(
      onEnd: () {
        setState(() {
          showExtendedContent = isExtended;
        });
      },
      color: Theme.of(context).colorScheme.surfaceVariant,
      width: isExtended ? 250 : 70,
      duration: const Duration(milliseconds: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Maybe here you can add your business logo
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...getNavigationItems(),
                ],
              ),
            ),
          ),
          ...footer(),
        ],
      ),
    );
  }

  void toggleDrawerContent() {
    setState(() {
      if (isExtended) {
        showExtendedContent = false;
      }
      isExtended = !isExtended;
      forceCollapsed = !forceCollapsed;
    });
  }

  Widget navigationListTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isSelected = false,
    required bool isExtended,
  }) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: Material(
        type: MaterialType.card,
        color: isSelected ? Theme.of(context).splashColor : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.hardEdge,
        child: ListTile(
          leading: showExtendedContent
              ? Icon(
                  icon,
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.black.withOpacity(0.5),
                )
              : null,
          title: showExtendedContent
              ? Text(label,
                  style: isSelected
                      ? TextStyle(color: Theme.of(context).primaryColor)
                      : const TextStyle(color: Colors.black))
              : Icon(
                  icon,
                  size: 20,
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.black.withOpacity(0.5),
                ),
          onTap: () {
            // if (isExtended == false) {
            //   setState(() {
            //     forceCollapsed = !forceCollapsed;
            //     isExtended = !isExtended;
            //   });
            // }
            onTap();
          },
        ),
      ),
    );
  }

  Widget navigationExpantionTile({
    required IconData icon,
    required String label,
    required List<Widget> children,
    required bool isExtended,
    required bool isSelected,
  }) {
    return Tooltip(
      message: isExtended ? "" : label,
      margin: const EdgeInsets.only(left: 50),
      child: Container(
          margin: const EdgeInsets.all(4.0),
          child: Material(
            type: MaterialType.card,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.hardEdge,
            child: ExpansionTile(
              leading: showExtendedContent
                  ? Icon(
                      icon,
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.black.withOpacity(0.5),
                    )
                  : null,
              title: showExtendedContent
                  ? Text(label)
                  : Icon(
                      icon,
                      size: 20,
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.black.withOpacity(0.5),
                    ),
              onExpansionChanged: (value) {
                // if (isExtended == false) {
                //   setState(() {
                //     forceCollapsed = !forceCollapsed;
                //     isExtended = !isExtended;
                //   });
                // }
              },
              tilePadding: const EdgeInsets.symmetric(horizontal: 10),
              children: children,
            ),
          )),
    );
  }

  List<Widget> getNavigationItems() {
    return [
      // navigationExpantionTile(
      //   icon: Icons.people_rounded,
      //   label: 'Esempio ExpansionTile',
      //   isExtended: isExtended,
      //   isSelected: currentIndex == NavigationItem.customers.index ||
      //       currentIndex == NavigationItem.suppliers.index ||
      //       currentIndex == NavigationItem.contacts.index,
      //   children: [
      //     navigationListTile(
      //       icon: Icons.business_rounded,
      //       label: 'Child 1',
      //       onTap: () {
      //         // setState(() {
      //         //   currentIndex = NavigationItem.customers.index;
      //         // });
      //         // context.go('${AnagraphicDashboard.route}?type=C');
      //       },
      //       isSelected: currentIndex == NavigationItem.customers.index,
      //       isExtended: isExtended,
      //     ),
      //     navigationListTile(
      //       icon: Icons.fire_truck_rounded,
      //       label: 'Child 2',
      //       onTap: () {
      //         // setState(() {
      //         //   currentIndex = NavigationItem.suppliers.index;
      //         // });
      //         // context.go('${AnagraphicDashboard.route}?type=S');
      //       },
      //       isSelected: currentIndex == NavigationItem.suppliers.index,
      //       isExtended: isExtended,
      //     ),
      //   ],
      // ),
      navigationListTile(
        icon: Icons.manage_accounts_rounded,
        label: 'Accounts',
        onTap: () {
          // Update index and go to accounts page
        },
        isSelected: currentIndex == NavigationItem.accounts.index,
        isExtended: isExtended,
      ),
    ];
  }

  List<Widget> footer() {
    return [
      // navigationListTile(
      //   isExtended: isExtended,
      //   icon: Icons.construction_outlined,
      //   label: 'Amministrazione',
      //   onTap: () {
      //     context.go(AdministrationDashboard.route);
      //   },
      // ),
      navigationListTile(
        isExtended: isExtended,
        icon: Icons.settings,
        label: 'Impostazioni',
        onTap: () {},
      ),
      navigationListTile(
        isExtended: isExtended,
        icon: Icons.logout,
        label: 'Logout',
        onTap: () async {},
      ),
      expansionButton(),
    ];
  }

  Widget expansionButton() {
    return InkWell(
      onTap: toggleDrawerContent,
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              showExtendedContent
                  ? Icons.arrow_back_ios
                  : Icons.arrow_forward_ios,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  int getNavigationIndex(String path) {
    path = path.split('/')[1];
    path = path.split('?')[0];
    switch ("/$path") {
      // case AccountsPage.route:
      //   return NavigationItem.accounts;
      default:
        return 0;
    }
  }
}

enum NavigationItem {
  accounts,
}
