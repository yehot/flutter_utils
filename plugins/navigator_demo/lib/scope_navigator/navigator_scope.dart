//
// class NavigatorScope extends StatelessWidget {
//   final IRouteNode node;
//   final PopPageCallback onPopPage;
//   final List<IRouteConfig> configs;
//   final IRoutePageBuilder notFindPageBuilder;
//
//   const NavigatorScope({
//     super.key,
//     required this.node,
//     required this.onPopPage,
//     required this.configs,
//     required this.notFindPageBuilder,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     Widget content = Navigator(
//       onPopPage: onPopPage,
//       pages: _buildPages(context, configs),
//     );
//
//     if (node is CellIRoute) {
//       content =
//         (node as CellIRoute).cellBuilder(context, configs.last, content);
//     }
//     return HeroControllerScope(
//       controller: MaterialApp.createMaterialHeroController(),
//       child: content,
//     );
//   }
// }
