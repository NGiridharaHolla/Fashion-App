import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'Signin.dart';
import 'Signup.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://cdn.shopify.com/s/files/1/0998/9358/products/1001_1_1024x1024.jpg?v=1549441522',
  'https://img.dtcn.com/image/themanual/cufflinks-next-800x800.jpg',
  'https://images.ctfassets.net/u0haasspfa6q/75rXhBFqn4fmeW1cOlAtLt/c4d647c3b2beb46e26bf11735c92efef/matheus-ferrero-ODMNSWjel_I-unsplash',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnDwzDBvZLhMM7HfWhB9-LrZfJ-OxaUg321Q&usqp=CAU'
];

void main() => runApp(Home_page());

final themeMode = ValueNotifier(2);

class Home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          // darkTheme: ThemeData.dark(),
          // themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => ComplicatedImageDemo(),
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}

class DemoItem extends StatelessWidget {
  final String title;
  final String route;
  DemoItem(this.title, this.route);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        // child: Text(
                        //   'No. ${imgList.indexOf(item)} image',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 20.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class ComplicatedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fashion App'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(25, 35, 25, 5),
            child: Text(
              'Shop Now !!!',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(55, 5, 55, 25),
            width: 300,
            child: Text(
              'You can shop your favorites attire here. Just browse through and pick your favorite products.',
              style: TextStyle(height: 1.5),
            ),
          ),
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imageSliders,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 55, 0, 0),
            height: 45,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(25)),
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Signup()));
              },
              child: Text(
                'Start shopping',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 25, 0, 25),
            child: Column(children: [
              Text("Already have an account?"),
              FlatButton(
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Signin()));
                },
                child: Text("Log In",
                    style: TextStyle(color: Colors.black, fontSize: 17)),
              ),
            ]),
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
