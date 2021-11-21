import 'package:flutter/cupertino.dart';

import '../pages/containerScreen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ContainerScreen.routeName: (context) => ContainerScreen(),
};
