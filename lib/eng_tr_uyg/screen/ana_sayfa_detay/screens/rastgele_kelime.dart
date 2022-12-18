import 'package:flutter/material.dart';
import '../../../../project/widgets/app_bar_widget.dart';

class RastgeleKelime extends StatefulWidget {
  const RastgeleKelime({Key? key, required this.baslik}) : super(key: key);
  final String baslik;

  @override
  State<RastgeleKelime> createState() => _RastgeleKelimeState();
}

class _RastgeleKelimeState extends State<RastgeleKelime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeadingWidget(),
        leadingWidth: 90,
        title: Text(widget.baslik),
      ),
    );
  }
}
