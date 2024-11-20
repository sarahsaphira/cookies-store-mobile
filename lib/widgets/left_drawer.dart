import 'package:flutter/material.dart';
import 'package:cookies_store/screens/menu.dart';
import 'package:cookies_store/screens/item_form.dart';
import 'package:cookies_store/screens/list_itementry.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'Cookies Store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Let's Try Our Cookies",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.store),
              title: const Text('Tambah Item'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemFormPage(),
                  ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_reaction_rounded),
              title: const Text('Daftar Item'),
              onTap: () {
                  // Route menu ke halaman item
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ItemEntryPage()),
                  );
              },
          ),
        ],
      ),
    );
  }
}