import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mountain/models/getposts.dart';
import 'services/networkhelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    print('Sagarmatha');
    getData();
    super.initState();
  }

  getData() async {
    posts = await NetworkHelper().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
            style: TextStyle(
                color: Colors.blue),
            'Home'),
      ),
      backgroundColor: Color.fromARGB(255, 217, 236, 255),
      bottomNavigationBar: bottomNavigationBar,
      body: Visibility(
        visible: isLoaded,
        child: Container(
          child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(
                    posts![index].name ?? 'No Data',
                  ),
                  leading: Image.asset('assets/Rectangle.png'),
                  subtitle: Text(
                    '\Rs. ${posts![index].price?.toString()}',
                  ),
                  trailing: Icon(Icons.arrow_forward),
                ),
              );
            },
          ),
        ),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

Widget get bottomNavigationBar {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(25),
      topLeft: Radius.circular(25),
    ),
    child: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart_fill), label: 'Cart'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bag), label: 'Offers'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled), label: 'Profile'),
      ],
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blue,
      showUnselectedLabels: true,
    ),
  );
}
