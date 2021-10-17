import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';
  final Function saveFilter;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

/// used StatefulWidget bcs the app needs to keep this filter states
class _FilterScreenState extends State<FilterScreen> {
  ///Default value of the filters
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    /// before load the screen, setup the default filter value that saved by the user before
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 25),
          alignment: Alignment.centerRight,
          child: IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilter(selectedFilters);
              },
              icon: Icon(Icons.save)),
        ),

        ///Expanded is a widget that expands a child of a [Row], [Column], or [Flex]
        Expanded(
            child: ListView(
          children: [
            _buildSwitchListTile(
                'Gluten-free', 'Gluten-free subtitle', _glutenFree, (newVal) {
              setState(() {
                _glutenFree = newVal;
              });
            }),
            _buildSwitchListTile(
                'Vegetarian-free', 'Vegetarian-free subtitle', _vegetarian,
                (newVal) {
              setState(() {
                _vegetarian = newVal;
              });
            }),
            _buildSwitchListTile('Vegan-free', 'Vegan-free subtitle', _vegan,
                (newVal) {
              setState(() {
                _vegan = newVal;
              });
            }),
            _buildSwitchListTile(
                'lactose-free', 'lactose-free subtitle', _lactoseFree,
                (newVal) {
              setState(() {
                _lactoseFree = newVal;
              });
            })
          ],
        ))
      ]),
    );
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool curVal, Function updateVal) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: curVal,
        onChanged: updateVal);
  }
}
