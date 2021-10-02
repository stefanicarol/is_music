import 'package:flutter/material.dart';

import 'details_page.dart';
import 'home_page.dart';
import 'model/music_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IS Music',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(title: 'IS Music App'),
      routes: {
        '/home': (_) =>   HomePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == DetailsPage.routeName) {
          final args = settings.arguments as MusicModel;
          return MaterialPageRoute(
            builder: (context) {
              return DetailsPage(
                artista: args.artista,
                foto: args.foto,
                musica: args.musica,
                duracao: args.duracao,
                likes: args.likes,
                dislikes: args.dislikes,
                plays: args.plays,
              );
            },
          );
        }
        assert(false, 'Sem implementação ${settings.name}');
        return null;
      },
    );
  }
}
