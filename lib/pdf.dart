import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdf extends StatelessWidget {
  const Pdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SfPdfViewer.network(
            'https://firebasestorage.googleapis.com/v0/b/ymca-all-in-one.appspot.com/o/5.%20Process%20Synchronisation.pdf?alt=media&token=26758293-930a-4193-adaf-1d39e312c3db'),
      ),
    );
  }
}
