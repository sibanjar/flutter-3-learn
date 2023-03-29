import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../homepage.dart';
import '../utilities/styles.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 5.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : const Color(0xFF7B51D3),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 600.0,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/onboarding0.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Text(
                              '1st Connect people\naround the world',
                              style: kTitleStyle,
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              '1st Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/onboarding0.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Text(
                              '11st Connect people\naround the world',
                              style: kTitleStyle,
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              '11st Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/onboarding1.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Text(
                              '2nd Live your life smarter\nwith us!',
                              style: kTitleStyle,
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              '2 nd Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/onboarding2.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Text(
                              '3 Get a new experience\nof imagination',
                              style: kTitleStyle,
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              '3rd Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: const <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                                ),
                                // SizedBox(width: 6.0),
                                // Icon(
                                //   Icons.arrow_forward,
                                //   color: Colors.white,
                                //   size: 30.0,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : const Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 70.0,
              width: double.infinity,
              color: const Color(0xFF5036D5),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const Text(''),
    );
  }
}
