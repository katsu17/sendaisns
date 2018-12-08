import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  WelcomePageState createState() {
    return WelcomePageState();
  }
}

class WelcomePageState extends State<WelcomePage> {
  int _currentPage = 0;
  List<Widget> _pages = [];
  PageController _pageController = PageController();

  @override
  void initState() {
    _pages.add(createPage(
      "仙台SNSへようこそ",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjSYCOG7717bpZL7Cl0f4OZ593KnkKwtnAQsetmQ6d_p-HgOtb",
      "このSNSは仙台を愛してやまない人のためのSNSです。",
    ));
    _pages.add(createPage(
      "仙台の魅力をどんどん発掘！",
      "http://www.t-bird-sendai.co.jp/image/index/main-image5.jpg",
      "みんなで仙台のいいところをたくさん見つけてどんどん発信していきましょう！",
    ));
    setState(() {});
    super.initState();
  }

  Widget createPage(String title, String imageUrl, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          Container(
            height: 12.0,
          ),
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          Container(
            height: 12.0,
          ),
          Text(description),
        ],
      ),
    );
  }

  Widget dot(int index, BuildContext context) {
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index
            ? Theme.of(context).primaryColor
            : Theme.of(context).primaryColor.withAlpha(90),
      ),
    );
  }

  Widget dots() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_pages.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: dot(index, context),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  _currentPage = page.toInt();
                  setState(() {});
                },
                children: _pages,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  child: _currentPage == 0 ? Container() : Text("戻る"),
                  onPressed: () {
                    if (_currentPage == 0) return;
                    _pageController.animateToPage(
                      _currentPage - 1,
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: dots(),
                ),
                FlatButton(
                  child:
                      Text(_currentPage == (_pages.length - 1) ? "閉じる" : "次へ"),
                  onPressed: () {
                    if (_currentPage == (_pages.length - 1)) {
                      Navigator.pop(context);
                      return;
                    }
                    print(_currentPage);
                    print(_pages.length);
                    _pageController.animateToPage(
                      _currentPage + 1,
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
