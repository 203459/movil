import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/contents_onboard.dart';
import '../components/on_boarding_slide.dart';
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
    return SafeArea(
      child: Column(children: [
        Expanded(
          flex: 20,
          child: PageView.builder(
            onPageChanged: (value) => {
              setState(() {
                currentIndex = value;
              })
            },
            itemBuilder: (context, index) => OnBoardingSlide(
              imagen: contents[index]["imagen"],
              titulo: contents[index]["titulo"],
              descripcion: contents[index]["descripcion"],
            ),
            itemCount: contents.length,
            controller:_controller,
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => buildPage(index: index, currentePage: currentIndex),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: SizedBox(
                  width: 350,
                  height: 60,
                  child: OutlinedButton(
                    onPressed: () {
                      currentIndex == contents.length - 1
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            )
                          :  _controller.nextPage(
                              curve: Curves.easeInSine,
                              duration: const Duration(milliseconds: 500));
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: currentIndex == contents.length - 1
                            ? const Color.fromARGB(255, 136, 201, 45)
                            : const Color.fromARGB(255, 255, 255, 255),
                        side: BorderSide(
                            width: 2.0,
                            color: currentIndex == contents.length - 1
                                ? const Color.fromARGB(255, 136, 201, 45)
                                : const Color.fromARGB(193, 105, 81, 81)),
                        textStyle: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                        )),
                    child: Text(
                      "Siguiente",
                      style: TextStyle(
                        color: currentIndex == contents.length - 1
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : Color.fromARGB(193, 101, 18, 18),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

  Container buildPage({required int index, required int currentePage}) {
    return Container(
     margin: const EdgeInsets.only(right: 10),
    width: currentePage == index ? 30 : 20,

    height: 5,
    decoration: BoxDecoration(
        color: currentePage == index
            ? const Color.fromARGB(255, 255, 35, 35)
            : const Color.fromARGB(255, 201, 182, 182),
        borderRadius: BorderRadius.circular(20)),
  );
}