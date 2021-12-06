import 'package:flutter/material.dart';
import 'package:friflex/presentation/pages/enter_screen/view/enter_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Friflex',
      home: EnterScreen(),
    );
  }
}
