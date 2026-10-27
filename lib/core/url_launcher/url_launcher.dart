import 'package:url_launcher/url_launcher.dart';

Future<void> openOfficialDocument() async {
  final url = Uri.parse(
    'https://srmangabeiras.ifma.edu.br/wp-content/uploads/sites/26/2015/05/Regimento-Disciplinar-Discente-2.pdf',
  );

  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Não foi possível abrir o documento.');
  }
}