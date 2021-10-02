import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
           UserAccountsDrawerHeader(
            accountName: Text("Carol Souza"),
            accountEmail: Text("carol.souza@rede.ulbra.br"),
            currentAccountPicture: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                'https://files.nsctotal.com.br/s3fs-public/graphql-upload-files/Alok_3.jpg?3Z84Iz1xlsXI5rZqyOOxTiJJMSm.Ko5p',
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favoritas"),
            subtitle: Text("Músicas favoritas"),
            trailing: Icon(Icons.arrow_forward),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.playlist_add),
            title: Text("Playlist"),
            subtitle: Text("Minhas playlist"),
            trailing: Icon(Icons.arrow_forward),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.playlist_play_outlined),
            title: Text("PodCast"),
            subtitle: Text("Meus podcasts"),
            trailing: Icon(Icons.arrow_forward),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Perfil"),
            subtitle: Text("Perfil do usuário"),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text("Voltar"),
              subtitle: Text("Voltar pra home"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}
