import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ismusic/widgets/custom_drawer.dart';
 import '../model/music_model.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  final String? title;

  const HomePage({Key? key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:[
          Icon(Icons.music_note),
          SizedBox(
            width: 20,
          )
        ],
        centerTitle: true,
        elevation: 0,
        title: Text(widget.title!),
      ),
      drawer: CustomDrawer(),
      body: Container(
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
        child: Center(
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/musics.json'),
                builder: (context, snapshot) {
                  var musics = json.decode(snapshot.data.toString());
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: musics.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                DetailsPage.routeName,
                                arguments: MusicModel(
                                  musics[index]["artista"],
                                  musics[index]["foto"],
                                  musics[index]["musica"],
                                  musics[index]["duracao"],
                                  musics[index]["likes"],
                                  musics[index]["dislikes"],
                                  musics[index]["plays"],
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Card(
                                color: Color(0xFFFFFFFF).withOpacity(0.5),
                                elevation: 1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Material(
                                        borderRadius:
                                        BorderRadius.circular(45.0),
                                        elevation: 4,
                                        child: CircleAvatar(
                                          radius: 45.0,
                                          backgroundImage: NetworkImage(
                                              "${musics[index]["foto"]}"),
                                          backgroundColor: Colors.transparent,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${musics[index]["artista"]}",
                                              overflow: TextOverflow.clip,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                           SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "${musics[index]["musica"]}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Ocorreu um erro..."),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                })),
      ),
    );
  }
}
