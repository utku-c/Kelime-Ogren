import 'package:flutter/material.dart';

import '../../../../project/widgets/app_bar_widget.dart';
import 'widget/tema_sayfasi_body.dart';

class TemaSayfasi extends StatelessWidget {
  const TemaSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        title: const Text("Tema Ayarları"),
        leading: const AppBarLeadingWidget(),
        actions: const [
          // AppBarCloseWidget(),
        ],
      ),
      body: const TemaSayfasiBody(),
    );
  }
}
