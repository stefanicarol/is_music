import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsPage extends StatefulWidget {
  static const routeName = '/DetailsPage';
  final String artista;
  final String foto;
  final String musica;
  final double duracao;
  final String likes;
  final String dislikes;
  final String plays;

  const DetailsPage(
      {Key? key,
        required this.artista,
        required this.foto,
        required this.musica,
        required this.duracao,
        required this.likes,
        required this.dislikes,
        required this.plays})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

    late double _currentSliderValue;
    late double inicio;
    late double fim;
    late bool play;
    late bool avancar;
    late bool voltar;
    late bool repetir;
    late bool aleatorio;

    @override
    void initState() {
      super.initState();
      fim = widget.duracao;
       _currentSliderValue = 0.00;
       inicio = 0.00;
       play = true;
       avancar = false;
       voltar = false;
       repetir = false;
       aleatorio = false;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          actions:   [
            Icon(Icons.playlist_add_rounded, size: 30),
            SizedBox(width: 10),
            Icon(Icons.share_outlined, size: 25),
            SizedBox(width: 10),
            Icon(Icons.more_horiz_outlined, size: 30),
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.blue,
                          Colors.deepOrange,
                        ],
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                    SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.artista,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87),
                        ),
                          SizedBox(height: 10),
                        Text(
                          widget.musica,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87),
                        ),
                          SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${widget.likes} Likes | ",
                              style:   TextStyle(color: Colors.black54),
                            ),
                            Text(
                              "${widget.dislikes} Dislikes | ",
                              style:TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                            ),
                            Text(
                              "${widget.plays} Plays",
                              style:TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                          SizedBox(height: 10),
                        Padding(
                          padding:EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${double.parse((inicio).toStringAsFixed(2))}"
                                    .replaceAll('.', ':'),
                                style:TextStyle(color: Colors.black45),
                              ),
                              Text(
                                "${double.parse((fim).toStringAsFixed(2))}"
                                    .replaceAll('.', ':'),
                                style:TextStyle(color: Colors.black45),
                              ),
                            ],
                          ),
                        ),
                        Slider(
                          activeColor: Color(0XFFFF7F26),
                          value: _currentSliderValue,
                          min: 0,
                          max: widget.duracao,
                          divisions: 5,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                              fim = (_currentSliderValue - widget.duracao)
                                  .toDouble();
                              inicio = (_currentSliderValue).toDouble();
                            });
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    aleatorio = !aleatorio;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.random,
                                  size: 30,
                                  color: aleatorio
                                      ? Colors.deepOrange
                                      : Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    voltar = !voltar;
                                    if (avancar) avancar = false;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.fastBackward,
                                  size: 30,
                                  color:
                                  voltar ? Colors.deepOrange : Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    play = !play;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.solidPauseCircle,
                                  size: 70,
                                  color: play ? Colors.deepOrange : Colors.black,
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      avancar = !avancar;
                                      if (voltar) voltar = false;
                                    });
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.fastForward,
                                    size: 30,
                                    color: avancar
                                        ? Colors.deepOrange
                                        : Colors.black,
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      repetir = !repetir;
                                    });
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.replyAll,
                                    size: 30,
                                    color: repetir
                                        ? Colors.deepOrange
                                        : Colors.black,
                                  )),
                            ],
                          ),
                        ),
                        Text("Duração: ${widget.duracao}")
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.60,
                left: MediaQuery.of(context).size.width * 0.2,
                child: PhysicalModel(
                  color: Colors.black,
                  elevation: 15.0,
                  shape: BoxShape.circle,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      widget.foto,
                    ),
                    radius: 100.0,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

