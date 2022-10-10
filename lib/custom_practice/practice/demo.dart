import 'package:ecommerse/custom_practice/practice/demo_data.dart';
import 'package:ecommerse/custom_practice/practice/hotel_list.dart';
import 'package:ecommerse/custom_practice/practice/style.dart';
import 'package:ecommerse/custom_practice/practice/travel_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TravelCardDemo extends StatefulWidget {
  const TravelCardDemo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TravelCardDemoState createState() => _TravelCardDemoState();
}

class _TravelCardDemoState extends State<TravelCardDemo> {
  late List<City> _cityList;
  late City _currentCity;

  @override
  void initState() {
    super.initState();
    var data = DemoData();
    _cityList = data.getCities();
    _currentCity = _cityList[1];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding),
              child: Text(
                'Where are you going next?',
                overflow: TextOverflow.ellipsis,
                style: Styles.appHeader,
                maxLines: 2,
              ),
            ),
            TravelCardList(
              cities: _cityList,
              onCityChange: _handleCityChange,
            ),
            HotelList(_currentCity.hotels),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

  void _handleCityChange(City city) {
    setState(() {
      _currentCity = city;
    });
  }

   _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      leading: const Icon(Icons.menu, color: Colors.black),
      backgroundColor: Colors.white,
      actions: const <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding),
          child: Icon(Icons.search, color: Colors.black),
        )
      ], systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}