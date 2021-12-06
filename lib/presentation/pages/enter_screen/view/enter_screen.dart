import 'package:flutter/material.dart';
import 'package:friflex/presentation/pages/city_screen/view/city_screen.dart';
import 'package:friflex/presentation/pages/enter_screen/controller/enter_controller.dart';
import 'package:get/get.dart';

class EnterScreen extends StatelessWidget {
  EnterScreen({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(EnterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Friflex'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              autofocus: true,
              controller: _textEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Город',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                bool? loaded = await _controller.getCityInformation(name: _textEditingController.text);
                if (loaded!) {
                  Get.to(() => CityInformationScreen(name: _textEditingController.text,));
                }
              },
              child: const Center(
                child: Text('Подтвердить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
