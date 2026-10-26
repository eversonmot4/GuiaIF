import 'package:url_launcher/url_launcher.dart';

Future<void> openOfficialDocument() async {
  final url = Uri.parse(
    'https://github.com/eversonmot4/GuiaIF',
  );

  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Não foi possível abrir o documento.');
  }
}