import 'dart:math';

import 'package:flutter/material.dart';

class FoodRandomizer extends StatefulWidget {
  @override
  _FoodRandomizerState createState() => _FoodRandomizerState();
}

class _FoodRandomizerState extends State<FoodRandomizer> {
  List<String> firstData = ['Картошка', 'Рис', 'Макароны'];
  List<String> secondData = ['Люля', 'Индейка', 'Курица', 'Ребрышко'];
  List<String> history = [];
  String randomizedFood = '';

  void randomizeFood() {
    setState(() {
      String randomFirst = firstData[Random().nextInt(firstData.length)];
      String randomSecond = secondData[Random().nextInt(secondData.length)];
      randomizedFood = '$randomFirst с $randomSecond';

      // Add to history
      history.insert(0, randomizedFood);
    });
  }

  void addToFirstList(String newItem) {
    setState(() {
      firstData.add(newItem);
    });
  }

  void addToSecondList(String newItem) {
    setState(() {
      secondData.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Гарнир',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              ...firstData.map((food) => Text(food)),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Add new item to the first list
                  addToFirstList('Новый гарнир');
                },
                child: Text('Добавить в список гарниров'),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Мясо',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              ...secondData.map((food) => Text(food)),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Add new item to the second list
                  addToSecondList('Новое мясо');
                },
                child: Text('Добавить в список мяса'),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: randomizeFood,
            child: Text('Что кушаем?'),
          ),
          SizedBox(height: 20),
          Text(
            randomizedFood,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'История запросов:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(history[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
