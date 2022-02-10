import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    String name = args['name'].toString();
    String company = args['company'].toString();
    String email = args['email'].toString();

    var states = {
      'company': company,
      'name': name,
      'email': email,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return {'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  onTap: () => Navigator.pop(context),
                  value: choice,
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      Text(choice),
                    ],
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Bienvenido $name',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.business_rounded),
                      title: Text(
                        'Bodegas',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text('Inventario en bodegas'),
                      isThreeLine: true,
                      onTap: () {
                        Navigator.pushNamed(context, 'storages',
                            arguments: states);
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.people_alt_rounded),
                      title: Text(
                        'Empleados',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text('Empleados de la empresa'),
                      isThreeLine: true,
                      onTap: () {
                        //logica de oprimir tarjeta
                        Navigator.pushNamed(context, 'employers',
                            arguments: states);
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.inventory),
                      title: Text(
                        'Productos',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text('Lista de productos existentes'),
                      isThreeLine: true,
                      onTap: () {
                        //logica de oprimir tarjeta
                        Navigator.pushNamed(context, 'productListpage',
                            arguments: states);
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.calendar_today_rounded),
                      title: Text(
                        'Transacciones',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text('Resumen de transacciones realizadas'),
                      isThreeLine: true,
                      onTap: () {
                        Navigator.pushNamed(context, 'transaction',
                            arguments: states);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, 'addProduct',
                        arguments: states);
                  },
                  icon: Icon(Icons.add),
                  label: const Text(
                    'Producto',
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, 'addTransaction',
                        arguments: states);
                  },
                  icon: Icon(Icons.add),
                  label: const Text(
                    'Transacción',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
