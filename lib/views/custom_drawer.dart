import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color:
                  Theme.of(
                    context,
                  ).colorScheme.primary, // Usa el color primario del tema
            ),
            child: const Text(
              'Menú',
              style: TextStyle(
                color:
                    Colors
                        .white, // Texto blanco para contrastar con el color primario
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              //context.go('/'); // Navega a la ruta principal
              //Reemplaza la ruta actual en la pila de navegación.
              //No permite volver atrás automáticamente, ya que no agrega la nueva ruta a la pila.
              //Útil para navegación sin historial, como en barra de navegación o cambiar de pestañas.
              context.go('/'); // Navega a la ruta principal
              Navigator.pop(context); // Cierra el drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Gridview'),
            onTap: () {
              //context.push(String route)
              //Añade la nueva ruta a la pila de navegación.
              //Permite volver atrás con context.pop().
              //Ideal para flujos donde el usuario puede regresar, como navegar a una pantalla de detalles.
              context.go('/gridview'); // Navega a la ruta principal
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Tab Bar'),
            onTap: () {
              //context.replace(String route)
              //Similar a go(), pero en este caso reemplaza la ruta actual sin eliminar el historial anterior.
              //Útil si quieres evitar que el usuario regrese a la pantalla anterior
              //pero manteniendo la posibilidad de navegar hacia otras rutas en la pila
              context.replace('/tabbar'); // Navega a la pantalla de perfil
              Navigator.pop(context); // Cierra el drawer
            },
          ),
          //!PASO DE PARAMETROS
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Paso de Parámetros'),
            onTap: () {
              context.go('/paso_parametros');
            },
          ),
          ListTile(
            leading: const Icon(Icons.loop),
            title: const Text('Ciclo de Vida'),
            onTap: () {
              context.go('/ciclo_vida');
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Lista de estudiantes'),
            onTap: () => context.goNamed('future'),
          ),
          //!TIMER
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Timer'),
            onTap: () {
              context.goNamed('timerView');
            },
          ),

          //!ISOLATE
          ListTile(
            leading: const Icon(Icons.task_sharp),
            title: const Text('Tarea Pesada'),
            onTap: () {
              //Navega a la ruta con nombre 'isolate'
              context.goNamed('isolate');
            },
          ),
          /* ListTile(
            leading: Icon(Icons.catching_pokemon),
            title: Text('profesionales'),
            onTap: () {
              context.goNamed('profesionales');
            },
          ),*/
        ],
      ),
    );
  }
}
