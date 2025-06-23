import '../../../../core/core.dart';

class GenerateCardEntity {
  final String title;
  final String route;
  final String pathIcon;

  GenerateCardEntity({
    required this.title,
    required this.route,
    required this.pathIcon,
  });
}

List<GenerateCardEntity> itemsGeneraCard = [
  GenerateCardEntity(
    title: 'Text',
    route: '/generate_qr/text_code',
    pathIcon: AppAssets.textIcon,
  ),
  GenerateCardEntity(
    title: 'WebSide',
    route: '/generate_qr/web_code',
    pathIcon: AppAssets.webSiteIcon,
  ),
  GenerateCardEntity(
    title: 'Wi-Fi',
    route: '/generate_qr/wifi',
    pathIcon: AppAssets.wifiIcon,
  ),
  /* GenerateCardEntity(
    title: 'Event',
    route: '/generate_qr/event',
    pathIcon: AppAssets.eventIcon,
  ),
  GenerateCardEntity(
    title: 'Contact',
    route: '/generate_qr/contact',
    pathIcon: AppAssets.contactIcon,
  ),
  GenerateCardEntity(
    title: 'Business',
    route: '/generate_qr/business',
    pathIcon: AppAssets.businessIcon,
  ), 
  GenerateCardEntity(
    title: 'Location',
    route: '/generate_qr/',
    pathIcon: AppAssets.locationIcon,
  ),*/
  GenerateCardEntity(
    title: 'WhatsApp',
    route: '/generate_qr/whatsapp',
    pathIcon: AppAssets.whatsAppIcon,
  ),
  GenerateCardEntity(
    title: 'Email',
    route: '/generate_qr/email',
    pathIcon: AppAssets.emailIcon,
  ),
  GenerateCardEntity(
    title: 'Twitter',
    route: '/generate_qr/twitter',
    pathIcon: AppAssets.twitterIcon,
  ),
  GenerateCardEntity(
    title: 'Instagram',
    route: '/generate_qr/instagram',
    pathIcon: AppAssets.instagramIcon,
  ),
  GenerateCardEntity(
    title: 'Telephone',
    route: '/generate_qr/',
    pathIcon: AppAssets.telephoneIcon,
  ),
];
