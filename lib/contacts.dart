import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components/custom_buttom.dart';

import 'styles/dark.dart' as dark_mode;
import 'styles/light.dart' as light_mode;

class ContactsView extends StatelessWidget {
  const ContactsView({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: 0.9 * height,
      color: isDarkMode ? dark_mode.background : light_mode.background,
      child: Column(children: [
        Container(
          color: isDarkMode ? dark_mode.background : light_mode.background,
          width: width,
          height: 0.2 * height,
          child: _buildHeader(),
        ),
        Center(
          child: Container(
            color: isDarkMode ? dark_mode.background : light_mode.background,
            width: 0.5 * width,
            height: 0.7 * height,
            child: _buildInputColumn(width, height),
          ),
        ),
      ]),
    );
  }

  Widget _buildHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 50),
          Text(
            'Contacts',
            style: GoogleFonts.palanquinDark(
              color: Colors.indigo,
              fontSize: 75,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      );

  Widget _buildInputColumn(double width, double height) => SizedBox(
        width: 0.25 * width,
        height: 0.6 * height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLocationlRow(
                icon: Icons.location_on, text: 'Manaus, Amazonas, Brazil'),
            const SizedBox(height: 10),
            TextField(
              style: TextStyle(
                  color:
                      isDarkMode ? dark_mode.secondary : light_mode.secondary),
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Bruce Lee...',
                hintStyle: GoogleFonts.nunito(
                  color: Colors.grey[350],
                  fontWeight: FontWeight.w700,
                ),
                labelStyle: GoogleFonts.nunito(
                  color: Colors.indigo,
                  fontWeight: FontWeight.w700,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              style: TextStyle(
                  color:
                      isDarkMode ? dark_mode.secondary : light_mode.secondary),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'example@gmail.com',
                hintStyle: GoogleFonts.nunito(
                  color: Colors.grey[350],
                  fontWeight: FontWeight.w700,
                ),
                labelStyle: GoogleFonts.nunito(
                  color: Colors.indigo,
                  fontWeight: FontWeight.w700,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 160,
              child: TextField(
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: isDarkMode
                        ? dark_mode.secondary
                        : light_mode.secondary),
                keyboardType: TextInputType.emailAddress,
                maxLines: 15,
                decoration: InputDecoration(
                  labelText: 'Message',
                  hintText: '...',
                  hintStyle: GoogleFonts.nunito(
                    color: Colors.grey[350],
                    fontWeight: FontWeight.w700,
                  ),
                  labelStyle: GoogleFonts.nunito(
                    color: Colors.indigo,
                    fontWeight: FontWeight.w700,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Colors.indigo),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Colors.indigo),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            HoverButton(
                onTap: () {},
                hoverColor:
                    isDarkMode ? dark_mode.secondary : light_mode.secondary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Send',
                        style: TextStyle(
                          color: isDarkMode
                              ? dark_mode.background
                              : light_mode.background,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Icon(Icons.send,
                        color: isDarkMode
                            ? dark_mode.background
                            : light_mode.background),
                  ],
                )),
          ],
        ),
      );

  Widget _buildLocationlRow({
    required IconData icon,
    required String text,
  }) =>
      Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.indigo,
              shape: BoxShape.circle,
            ),
            child: Icon(icon,
                color:
                    isDarkMode ? dark_mode.background : light_mode.background),
          ),
          const SizedBox(width: 20),
          Text(
            text,
            style: GoogleFonts.nunito(
              color: isDarkMode
                  ? dark_mode.secondary
                  : light_mode.secondary, //Colors.white,
              fontSize: 18,
              fontWeight: isDarkMode ? null : FontWeight.w600,
            ),
          ),
        ],
      );
}
