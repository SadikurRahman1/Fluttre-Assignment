import 'package:flutter/material.dart';
import '../widgets/responsive_builder.dart';

class ResScreen extends StatelessWidget {
  const ResScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        mobile: _buildMobileLayout(),
        tablet: _buildTabletLayout(),
        desktop: _buildDesktopLayout());
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "HUMMING \nBIRD.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      drawer: _buildDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _text1(),
            const SizedBox(
              height: 20,
            ),
            _text2(),
            const SizedBox(
              height: 20,
            ),
            _button()
          ],
        ),
      ),
    );
  }
  Widget _buildTabletLayout() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            _navbar(),
            const SizedBox(
              height: 50,
            ),
            _text1(),
            const SizedBox(
              height: 20,
            ),
            _text2(),
            const SizedBox(
              height: 20,
            ),
            _button()
          ],
        ),
      ),
    );
  }
  Widget _buildDesktopLayout() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            _navbar(),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _text1Desktop(),
                      const SizedBox(
                        height: 20,
                      ),
                      _text2Desktop()
                    ],
                  ),
                ),
                _button()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(26, 231, 148, 1.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SKILL UP NOW',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  "TAP HERE",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.video_settings),
            title: Text('Episodes'),
            onTap: () {
              // Navigate to home or perform any action
            },
          ),
          ListTile(
            leading: Icon(Icons.chat_bubble),
            title: Text('About'),
            onTap: () {
              // Navigate to settings or perform any action
            },
          ),
        ],
      ),
    );
  }
  Widget _navbar() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "HUMMING \nBIRD.",
        ),
        Row(
          children: [
            Text('Episodes'),
            SizedBox(
              width: 20,
            ),
            Text('About'),
          ],
        )
      ],
    );
  }
  Widget _text1() {
    return const Text(
      "FLUTTER WEB.\nTHE BASICS",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
  Widget _text1Desktop() {
    return const Text(
      "FLUTTER WEB.\nTHE BASICS",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  Widget _text2() {
    return const Text(
        """In this course we will go over the basics of using Flutter Web for development. Topics will include Responsive Layout, Deploying, Font Changes, Hover functionality, Modals and more.""",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
    );
  }
  Widget _text2Desktop() {
    return const Text(
      """In this course we will go over the basics of using Flutter Web for development. Topics will include Responsive Layout, Deploying, Font Changes, Hover functionality, Modals and more.""",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
  Widget _button() {
    return ElevatedButton(onPressed: () {}, child: const Text("Join course"));
  }
}
