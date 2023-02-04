import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/contents_onboard.dart';
import 'home_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 249, 249, 249),
        ])),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Image.asset(contents[i].image),
                          const SizedBox(height: 20),
                          Text(
                            contents[i].text,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            contents[i].descripcion,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    contents.length, (index) => buildPage(index, context))),
            Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.all(40),
              child: MaterialButton(
                onPressed: () async {
                  if (currentIndex == contents.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  }
                  _controller.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                
                color: const Color.fromARGB(255, 255, 255, 255),
                textColor: const Color.fromARGB(193, 105, 81, 81),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color.fromARGB(193, 105, 81, 81)),
                  borderRadius: BorderRadius.circular(28.0),
                ),
                child: Text(
                  currentIndex == contents.length - 1
                      ? "Continuar"
                      : "Siguiente",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildPage(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      //duration: kThemeAnimationDuration,
      width: currentIndex == index ? 30 : 20,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:
            currentIndex == index ? const Color.fromARGB(255, 255, 35, 35) : const Color.fromARGB(255, 201, 182, 182).withOpacity(0.4),
      ),
    );
  }
}