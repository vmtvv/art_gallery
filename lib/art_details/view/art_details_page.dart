import 'package:art_gallery/art_details/view/view.dart';
import 'package:flutter/material.dart';

class ArtDetailsPage extends StatefulWidget {
  const ArtDetailsPage({Key? key}) : super(key: key);

  static Route<void> route({ArtDetailsArguments? arguments}) {
    return MaterialPageRoute(
      builder: (context) => const ArtDetailsPage(),
      settings: RouteSettings(
        arguments: arguments,
      ),
    );
  }

  @override
  ArtDetailsPageState createState() {
    return ArtDetailsPageState();
  }
}

class ArtDetailsPageState extends State<ArtDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ArtDetailsArguments;
    return Scaffold(
      body: SafeArea(
        left: false,
        top: false,
        right: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: args.image != null && args.image!.url.isNotEmpty
                          ? FadeInImage.assetNetwork(
                              placeholder:
                                  'assets/images/image_placeholder.jpg',
                              placeholderFit: BoxFit.fill,
                              image: args.image!.url,
                              fit: BoxFit.fitWidth,
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 16, top: 32),
                child: Text(args.title),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
