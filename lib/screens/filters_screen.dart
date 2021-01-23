import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const ROUTE = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  @override
  initState() {
    isGlutenFree = widget.currentFilters['isGlutenFree'];
    isVegan = widget.currentFilters['isVegan'];
    isVegetarian = widget.currentFilters['isVegetarian'];
    isLactoseFree = widget.currentFilters['isLactoseFree'];
    super.initState();
  }

  Widget _buildSwitch(
    String title,
    String subtitle,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'isGlutenFree': isGlutenFree,
                'isVegan': isVegan,
                'isVegetarian': isVegetarian,
                'isLactoseFree': isLactoseFree,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          _buildSwitch(
            'Glutten-Free',
            'Only meals that is Gluten Free',
            isGlutenFree,
            (newValue) {
              setState(() {
                isGlutenFree = newValue;
              });
            },
          ),
          _buildSwitch(
            'Vegan',
            'Only meals that are Vegan',
            isVegan,
            (newValue) {
              setState(() {
                isVegan = newValue;
              });
            },
          ),
          _buildSwitch(
            'Vegetarian',
            'Only meals that are Vegan',
            isVegetarian,
            (newValue) {
              setState(() {
                isVegetarian = newValue;
              });
            },
          ),
          _buildSwitch(
            'LactoseFree',
            'Only meals that are LactoseFree',
            isLactoseFree,
            (newValue) {
              setState(() {
                isLactoseFree = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
