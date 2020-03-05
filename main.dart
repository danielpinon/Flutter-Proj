import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'My First App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  //static const double IconSize = 200;
  static List<Widget> _widgetOptions = <Widget>[
    /**
     * Classes de Páginas do Aplicativo 
     * */
    InicioPage(),
    PedidosPage(),
    PerfilPage(),
  ];
  /* *
   *  Ação ao clicar no botão inferior
   * */
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /* *
   *  Criação do menu inferior com botões
   * */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Point do Açaí Delivery'),
      ),
      body: Center(
        // Exibe no conteúdo da página o botao selecionado
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Início'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            title: Text('Pedidos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Perfil'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        showUnselectedLabels: false,
        // Ação ao clicar no botão
        onTap: _onItemTapped,
      ),
    );
  }
}

/* *
 *  Classe da Página Inicial
 * */

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retorna uma lista
    return ListView(
      // Retorna alguns widget
      children: <Widget>[
        // Cria um container
        new Container(
          // Define a margem
          margin: const EdgeInsets.all(10),
          // Define o conteúdo do container
          child: Center(
            // Define o card
            child: Card(
              // Configura a coluna
              child: Column(
                // Define o tamanho da largura
                mainAxisSize: MainAxisSize.min,
                // Define o conteúdo o card
                children: <Widget>[
                  // Cria uma lista
                  const ListTile(
                    leading: Icon(
                      Icons.album,
                      size: 100,
                    ),
                    // Define um Titulo
                    title: Text('Açaí Médio - Meio Litro'),
                    // Define um subTitulo
                    subtitle: Text('Porção de Açaí contendo 500 ML'),
                  ),
                  // Adiciona uma barra de botões
                  ButtonBar(
                    // Define o contúdo da barra
                    children: <Widget>[
                      // Adiciona o primeiro botão
                      FlatButton(
                        child: const Text('COMPRAR'),
                        onPressed: () {
                          // Ação ao clicar no botão
                          showAlertDialog(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/* *
 *  Classe Página de Pedidos 
 * */

class PedidosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retorna uma lista
    return ListView(
      // Retorna alguns widget
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.all(20),
          child: Text(
            "SEUS PEDIDOS",
            style: TextStyle(fontSize: 20),
          ),
        ),
        // Cria um container
        new Container(
          // Define a margem
          margin: const EdgeInsets.all(10),
          // Define o conteúdo do container
          child: Center(
            // Define o card
            child: Card(
              // Configura a coluna
              child: Column(
                // Define o tamanho da largura
                mainAxisSize: MainAxisSize.min,
                // Define o conteúdo o card
                children: <Widget>[
                  // Cria uma lista
                  const ListTile(
                    leading: Icon(
                      Icons.album,
                      size: 100,
                    ),
                    // Define um Titulo
                    title: Text('Açaí Médio - Meio Litro'),
                    // Define um subTitulo
                    subtitle: Text('Porção de Açaí contendo 500 ML'),
                  ),
                  // Adiciona uma barra de botões
                  ButtonBar(
                    // Define o contúdo da barra
                    children: <Widget>[
                      // Adiciona o primeiro botão
                      FlatButton(
                        child: const Text('Ver Pedido'),
                        onPressed: () {
                          // Ação ao clicar no botão
                          showAlertDialog(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/* *
 *  Classe Página de Perfil
 * */
class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retorna uma lista
    return ListView(
        // Retorna alguns widget
        children: <Widget>[
          Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
          Card(
            child: ListTile(
              title: Text('One-line with trailing widget'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
        ]);
  }
}

/* *
 * Funçao do Diálogo 
 * */

showAlertDialog(BuildContext context) {
  // Configurações ao clicar em "OK"
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      //Fechar Diálogo
      Navigator.of(context).pop();
    },
  );
  // Configurações para Modal Alert
  AlertDialog alert = AlertDialog(
    title: Text("Compra concluído"),
    content: Text(
        "Sua compra foi concluído com sucesso! Abra a aba Pedido para acompanhar seu pedido."),
    actions: [
      okButton,
    ],
  );
  // Exibir Dialogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
