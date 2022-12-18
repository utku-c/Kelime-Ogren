import 'package:flutter/material.dart';

import '../../../../project/widgets/app_bar_widget.dart';
import 'widget/bildirim_sayfasi_body.dart';

class BilDirimSayfasi extends StatelessWidget {
  const BilDirimSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        title: const Text("Bildirim Ayarları"),
        leading: const AppBarLeadingWidget(),
        actions: const [
          // AppBarCloseWidget(),
        ],
      ),
      body: const BildirimSayfasiBody(),
    );
  }
}
