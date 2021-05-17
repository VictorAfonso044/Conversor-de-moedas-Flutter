import 'package:conversor_de_moedas/app/components/Currency_box.dart';
import 'package:conversor_de_moedas/app/controllers/Home_controller.dart';
import 'package:conversor_de_moedas/core/app_images.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController homeController;
  TextEditingController toText = TextEditingController();
  TextEditingController fromText = TextEditingController();
  
  @override
  void initState() => homeController = HomeController(toText: toText, fromText: fromText);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 30),
          child: SingleChildScrollView(
              child: Column(
              children: [
                Image.asset(
                  AssetsImages.logoMoeda,
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 50,
                ),
                CurrencyBox(
                    selectedItem: homeController.toCurrency,
                    controller: toText,
                    items: homeController.currencies,
                    onChanged: (model) {
                      setState(() {
                        homeController.toCurrency = model;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                CurrencyBox(
                    selectedItem: homeController.fromCurrency,
                    controller: fromText,
                    items: homeController.currencies,
                    onChanged: (model) {
                      setState(() {
                        homeController.fromCurrency = model;
                      });
                    }),
                SizedBox(
                  height: 60,
                ),
                RaisedButton(
                  color: Colors.amber,
                  onPressed: () {
                    homeController.convert();
                  },
                  child: Text('Converter'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
