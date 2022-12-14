import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/my_flutter_app_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'styles/dark.dart' as dark_mode;
import 'styles/light.dart' as light_mode;

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.isDarkMode,
    required this.changeMode,
  });

  final bool isDarkMode;
  final VoidCallback changeMode;

  // Colors
  static const primary = Colors.indigo;
  static const secondary = Color.fromARGB(255, 30, 30, 30);

  // Strings
  static const aboutMe =
      "Hi! I'm an electrical engineering student from Brazil who loves coding and someone who loves build my own tools.";
  static const aboutMe2 =
      "During the day I study on college and at my free time I work in my own projects. My majority interests are mobile and games development. I also have tried desktop aplications. When I'm not studying then I'm playing something else.";

  static const urls = <String, String>{
    "linkedin": "https://www.linkedin.com/in/gabriel-bento-da-silva-250291172/",
    "github": "https://github.com/gotneb",
    "twitter": "https://twitter.com/Gabriel36509504",
    'cv':
        'https://raw.githubusercontent.com/gotneb/gotneb.github.io/03229d0b9318155a2ab48709137df2620e9878ab/resources/gabriel_bento_da_silva.pdf',
  };

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    if (width <= 600) {
      return SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(children: [
              Container(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                color: isDarkMode ? dark_mode.primary : light_mode.primary,
                height: 0.3 * height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // My name written largely
                    SelectableText('Gabriel Bento',
                        style: GoogleFonts.sacramento(
                          color: isDarkMode
                              ? dark_mode.background
                              : light_mode.background,
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        )),
                    // Change mode button
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: Icon(
                        isDarkMode ? Icons.dark_mode : Icons.light_mode,
                        color: isDarkMode
                            ? dark_mode.background
                            : light_mode.background,
                        size: 24,
                      ),
                      onPressed: changeMode,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0.1 * width),
                color:
                    isDarkMode ? dark_mode.background : light_mode.background,
                width: width,
                height: 0.7 * height,
                child: SizedBox(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 0.15 * height),
                        FittedBox(
                          fit: BoxFit.fitHeight,
                          child: SelectableText(
                            'Flutter Developer',
                            style: isDarkMode
                                ? dark_mode.subTitleStyle
                                : light_mode.subTitleStyle,
                          ),
                        ),
                        const SizedBox(height: 6),
                        FittedBox(
                          fit: BoxFit.fitHeight,
                          child: SelectableText(
                            'Gabriel Bento',
                            style: isDarkMode
                                ? dark_mode.titleStyle
                                : light_mode.titleStyle,
                          ),
                        ),
                        // Small warning advising this is not done yet
                        const SizedBox(height: 24),
                        SelectableText(
                          aboutMe,
                          style:
                              isDarkMode ? dark_mode.about : light_mode.about,
                        ),
                        const SizedBox(height: 18),
                        SelectableText(
                          aboutMe2,
                          style:
                              isDarkMode ? dark_mode.about : light_mode.about,
                        ),
                        const SizedBox(height: 22),
                        ElevatedButton(
                          onPressed: () async =>
                              await launchUrl(Uri.parse(urls['cv']!)),
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            foregroundColor: isDarkMode
                                ? dark_mode.background
                                : light_mode.background,
                            backgroundColor: primary,
                            padding: const EdgeInsets.all(20),
                            fixedSize: const Size(180, 50),
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          child: const FittedBox(
                            fit: BoxFit.none,
                            child: Text('Download CV'),
                          ),
                        ),
                      ]),
                ),
              ),
            ]),
            Positioned(
              top: 0.3 * height - 1 / 8 * height,
              child: CircleAvatar(
                backgroundColor:
                    isDarkMode ? dark_mode.background : light_mode.background,
                radius: 1 / 8 * height + 8,
                child: CircleAvatar(
                  foregroundImage: const AssetImage('assets/images/me.jpg'),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  radius: 1 / 8 * height,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          // Build left and right panels
          Row(
            children: [
              SizedBox(
                width: 0.35 * width,
                height: height,
                child: _buildLeftPanel(),
              ),
              SizedBox(
                width: 0.65 * width,
                height: height,
                child: _buildRightPanel(width, height),
              ),
            ],
          ),
          // Build my profile photo
          Positioned(
            top: 0.25 * height,
            left: 0.22 * width,
            child: Card(
              elevation: 18.0,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                radius: 0.135 * MediaQuery.of(context).size.width,
                foregroundImage: const AssetImage('assets/images/me.jpg'),
              ),
            ),
          ),
          // Build button toggle theme
          Positioned(
            top: 0.04 * height,
            right: 0.02 * width,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: isDarkMode ? primary : secondary,
                size: 24,
              ),
              onPressed: changeMode,
            ),
          ),
        ],
      ),
    );
  }

  // ===============================================================
  // Widgets for large screen's width
  // ===============================================================
  Widget _buildLeftPanel() => Container(
        padding: const EdgeInsets.fromLTRB(40, 20, 0, 15),
        color: primary,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SelectableText(
            'Gabriel Bento',
            style: GoogleFonts.sacramento(
              color: isDarkMode ? dark_mode.background : light_mode.background,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Wrap(
              direction: Axis.horizontal,
              runSpacing: 10,
              spacing: 10,
              children: [
                _buildSocialButton(
                  icon: MyFlutterApp.linkedin,
                  messageTip: 'Linkedin',
                  url: urls["linkedin"]!,
                ),
                _buildSocialButton(
                  icon: MyFlutterApp.github,
                  messageTip: 'GitHub',
                  url: urls["github"]!,
                ),
                _buildSocialButton(
                  icon: MyFlutterApp.twitter,
                  messageTip: 'Twitter',
                  url: urls["twitter"]!,
                ),
              ]),
        ]),
      );

  Widget _buildSocialButton({
    required IconData icon,
    required String url,
    required String messageTip,
  }) =>
      IconButton(
          onPressed: () async => await launchUrl(Uri.parse(url)),
          tooltip: messageTip,
          icon: Icon(
            icon,
            color: isDarkMode ? dark_mode.background : light_mode.background,
          ));

  Widget _buildRightPanel(double screenWidth, double screenHeight) => Container(
        color: isDarkMode ? dark_mode.background : light_mode.background,
        child: Row(
          children: [
            SizedBox(width: 0.2 * screenWidth),
            SizedBox(
              width: 0.34 * screenWidth,
              height: screenHeight,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText(
                      'Flutter Developer',
                      style: isDarkMode
                          ? dark_mode.subTitleStyle
                          : light_mode.subTitleStyle,
                    ),
                    const SizedBox(height: 6),
                    SelectableText(
                      'Gabriel Bento',
                      style: isDarkMode
                          ? dark_mode.titleStyle
                          : light_mode.titleStyle,
                    ),
                    // Small warning advising this is not done yet
                    const SizedBox(height: 24),
                    SelectableText(
                      aboutMe,
                      style: isDarkMode ? dark_mode.about : light_mode.about,
                    ),
                    const SizedBox(height: 18),
                    SelectableText(
                      aboutMe2,
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        color: isDarkMode ? Colors.grey[400] : secondary,
                      ),
                    ),
                    const SizedBox(height: 22),
                    ElevatedButton(
                      onPressed: () async =>
                          await launchUrl(Uri.parse(urls['cv']!)),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        foregroundColor: isDarkMode ? secondary : Colors.white,
                        backgroundColor: primary,
                        padding: const EdgeInsets.all(20),
                        fixedSize: const Size(140, 40),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      child: const Text('Download CV'),
                    ),
                  ]),
            ),
          ],
        ),
      );
  // ===============================================================

  // ===============================================================
  // Widgets for small screen's width
  // ===============================================================
}
