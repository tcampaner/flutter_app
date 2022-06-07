import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/espai.dart';

class EspaiSlider extends StatefulWidget {
  // const MovieSlider({Key? key}) : super(key: key);
  final List<Espai> espais;
  const EspaiSlider({Key? key, required this.espais}) : super(key: key);
  @override
  State<EspaiSlider> createState() => _EspaiSliderPageState();
}

class _EspaiSliderPageState extends State<EspaiSlider> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      print(_scrollController.position.pixels);
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print('Scroll ini');
        } else {
          print('Scroll fi');
          //_carregaNou();
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.espais.length == 0) {
      return Container(
        width: double.infinity,
        height: 260,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: 600,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Espais',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                itemCount: widget.espais.length,
                itemBuilder: (_, int index) =>
                    _EspaiInfo(espai: widget.espais[index])),
          )
        ],
      ),
    );
  }
}

class _EspaiInfo extends StatelessWidget {
  final Espai espai;
  const _EspaiInfo({Key? key, required this.espai}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final targeta = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              height: 250,
              fit: BoxFit.cover,
              fadeInDuration: Duration(milliseconds: 100),
              image: NetworkImage(espai.fotoPath)),
          Container(
            child: Text(espai.nom),
            padding: EdgeInsets.all(10),
          ),
          Container(
            child: GestureDetector(
              child: Text(espai.web,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue)),
              onTap: () async {
                var url = Uri.http(espai.web, '');
                if (await canLaunchUrl(url)) {
                  launchUrl(url);
                }
                ;
              },
            ),
            padding: EdgeInsets.all(5),
          ),
        ],
      ),
    );
    return Container(
      child: Column(children: [
        Container(
          child: GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: espai),
            child: ClipRRect(
              child: targeta,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: Offset(2.0, 10.0))
              ]),
        ),
        SizedBox(
          height: 30.0,
        )
      ]),
    );
  }
}
