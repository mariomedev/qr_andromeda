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
  GenerateCardEntity(title: 'Text', route: '', pathIcon: AppAssets.textIcon),
  GenerateCardEntity(
    title: 'WebSite',
    route: '',
    pathIcon: AppAssets.webSiteIcon,
  ),
  GenerateCardEntity(title: 'Wi-Fi', route: '', pathIcon: AppAssets.wifiIcon),
  GenerateCardEntity(title: 'Event', route: '', pathIcon: AppAssets.eventIcon),
  GenerateCardEntity(
    title: 'Contact',
    route: '',
    pathIcon: AppAssets.contactIcon,
  ),
  GenerateCardEntity(
    title: 'Business',
    route: '',
    pathIcon: AppAssets.businessIcon,
  ),
  GenerateCardEntity(
    title: 'Location',
    route: '',
    pathIcon: AppAssets.locationIcon,
  ),
  GenerateCardEntity(
    title: 'WhatsApp',
    route: '',
    pathIcon: AppAssets.whatsAppIcon,
  ),
  GenerateCardEntity(title: 'Email', route: '', pathIcon: AppAssets.emailIcon),
  GenerateCardEntity(
    title: 'Twitter',
    route: '',
    pathIcon: AppAssets.twitterIcon,
  ),
  GenerateCardEntity(
    title: 'Instagram',
    route: '',
    pathIcon: AppAssets.instagramIcon,
  ),
  GenerateCardEntity(
    title: 'Telephone',
    route: '',
    pathIcon: AppAssets.telephoneIcon,
  ),
];
