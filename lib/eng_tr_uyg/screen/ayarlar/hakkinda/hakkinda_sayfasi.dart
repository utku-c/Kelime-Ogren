import 'package:flutter/material.dart';

import '../../../../project/widgets/app_bar_widget.dart';
import 'widget/hakkinda_sayfasi_body.dart';

class HakkindaSayfasi extends StatelessWidget {
  const HakkindaSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        title: const Text("Hakkında Sayfası"),
        leading: const AppBarLeadingWidget(),
        actions: const [
          // AppBarCloseWidget(),
        ],
      ),
      body: const HakkindaSayfasiBody(),
    );
  }
}
