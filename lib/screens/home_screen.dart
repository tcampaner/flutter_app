import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/baleart_provider.dart';
import '../widgets/espai_slider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final espaisProvider = Provider.of<EspaisProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('BaleARTS'),
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [EspaiSlider(espais: espaisProvider.onDisplayEspais)],
          ),
        )));
  }
}
