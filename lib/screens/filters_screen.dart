import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> inputObj;
  final Function saveFilters;

  FiltersScreen(this.inputObj, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.inputObj['gluten'];
    _vegetarian = widget.inputObj['vegetarian'];
    _vegan = widget.inputObj['vegan'];
    _lactoseFree = widget.inputObj['lactose'];

    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool curVal, Function updateVal) {
    return SwitchListTile(
        title: Text(title),
        value: curVal,
        subtitle: Text(subtitle),
        onChanged: updateVal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.saveFilters({
                  "gluten": _glutenFree,
                  "lactose": _lactoseFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarian,
                });
              })
        ],
      ),
      drawer: SideDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  'Gluten-free', 'Only include gluten-free meals', _glutenFree,
                  (newVal) {
                setState(() {
                  _glutenFree = newVal;
                });
              }),
              _buildSwitchListTile('Lactose-free',
                  'Only include lactose-free meals', _lactoseFree, (newVal) {
                setState(() {
                  _lactoseFree = newVal;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                  (newVal) {
                setState(() {
                  _vegetarian = newVal;
                });
              }),
              _buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                  (newVal) {
                setState(() {
                  _vegan = newVal;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
