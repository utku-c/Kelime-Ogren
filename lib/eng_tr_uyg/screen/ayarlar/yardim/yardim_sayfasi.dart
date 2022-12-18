import 'package:flutter/material.dart';
import '../../../../project/widgets/app_bar_widget.dart';
import 'widget/yardim_sayfasi_body.dart';

class YardimSayfasi extends StatelessWidget {
  const YardimSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        title: const Text("Yardım"),
        leading: const AppBarLeadingWidget(),
        actions: const [
          // AppBarCloseWidget(),
        ],
      ),
      body: const YardimSayfasiBody(),
    );
  }
}
