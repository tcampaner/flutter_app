import 'package:flutter/material.dart';

import '../models/espai.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Espai espai = ModalRoute.of(context)?.settings.arguments as Espai;

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/LogoGris.png'),
                    alignment: Alignment.bottomCenter,
                    colorFilter: new ColorFilter.mode(
                        Colors.grey.withOpacity(0.2), BlendMode.dstATop),
                    fit: BoxFit.scaleDown)),
            child: CustomScrollView(
              slivers: [
                _Cap(
                  espai: espai,
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  _Dades(
                    espai: espai,
                  ),
                  _Descripcio(
                    espai: espai,
                  ),
                  _Serveis(
                    espai: espai,
                  )
                ]))
              ],
            )));
  }
}

class _Cap extends StatelessWidget {
  final Espai espai;

  const _Cap({Key? key, required this.espai}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Exactament igual que la AppBaer però amb bon comportament davant scroll
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            espai.nom,
            style: TextStyle(fontSize: 18),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(espai.fotoPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Dades extends StatelessWidget {
  final Espai espai;

  const _Dades({Key? key, required this.espai}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.star_outline, size: 30, color: Colors.cyan),
              SizedBox(
                width: 10,
              ),
              Text(espai.valoracio),
            ],
          ),
          Text(
            espai.adreca,
            style: TextStyle(
              color: Colors.black,
              fontSize: 21,
            ),
          ),
          Text(
            espai.email,
            style: textTheme.headline6,
          ),
        ],
      ),
    );
  }
}

class _Descripcio extends StatelessWidget {
  final Espai espai;
  const _Descripcio({Key? key, required this.espai}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        espai.desc,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

class _Serveis extends StatelessWidget {
  final Espai espai;
  const _Serveis({Key? key, required this.espai}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(espai.serveis.length);
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Serveis",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: ListView.builder(
                itemCount: espai.serveis.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) =>
                    Text(espai.serveis[index].servei.desc)),
          ),
        ],
      ),
    );
  }
}
