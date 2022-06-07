
import 'first.dart';
import 'second.dart';
import 'package:flutter/material.dart';

class QrsPag extends StatefulWidget {
  @override
  State<QrsPag> createState() => _QrsPagState();
}

class _QrsPagState extends State<QrsPag> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.qr_code,
                  size: 40,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.qr_code_scanner,
                  size: 40,
                ),
              ),
            ],
          ),
          title: Text(
            '  QR / Barcode Scanner',
          ),
        ),
        body: TabBarView(
          children: [
            First(),
            Second(),
          ],
        ),
      ),
    );
  }
}