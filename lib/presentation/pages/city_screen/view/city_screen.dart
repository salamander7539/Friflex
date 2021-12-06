import 'package:flutter/material.dart';
import 'package:friflex/presentation/pages/enter_screen/controller/enter_controller.dart';
import 'package:get/get.dart';

class CityInformationScreen extends StatelessWidget {
  const CityInformationScreen({Key? key, this.name}) : super(key: key);

  final String? name;

  TextStyle txtStyle() {
    return const TextStyle(
      fontSize: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EnterController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name!,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return controller.loaded.isTrue
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Температура ${(controller.cityData.main!.temp! - 273.15).toStringAsFixed(2)} ℃' ,
                    style: txtStyle(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Влажность ${controller.cityData.main!.humidity} %',
                    style: txtStyle(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Скорость ветра ${controller.cityData.wind!.speed} м/с',
                    style: txtStyle(),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
