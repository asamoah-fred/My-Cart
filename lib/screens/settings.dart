// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/settings_providers.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('units'),
                DropdownButton<String>(
                  value: 
                  // 'Imperial',
                  settingsProvider.units,
                  onChanged: (String) {
                    settingsProvider.setUnits(String!);
                  },
                  items: <String>['Imperial', 'Metric']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Wax Lines'),
                  Container(
                    child: Wrap(spacing: 5, runSpacing: 5, children: [
                      FilterChip(
                        label: Text(
                          'Swix',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        selected: 
                        (settingsProvider.waxLines!.contains('Swix')
                            ? true
                            : false),
                        onSelected: (bool value) {
                          if (value) {
                            settingsProvider.addWaxLine('Swix');
                          } else {
                            settingsProvider.removeWaxLine('Swix');
                          }
                        },
                      ),
                      FilterChip(
                        label: Text(
                          'Toko',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        selected: 
                        (settingsProvider.waxLines!.contains('Toko')
                            ? true
                            : false),
                        onSelected: (bool value) {
                          if (value) {
                            settingsProvider.addWaxLine('Toko');
                          } else {
                            settingsProvider.removeWaxLine('Toko');
                          }
                        },
                      ),
                    ]),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
