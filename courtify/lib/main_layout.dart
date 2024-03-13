// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'appointment_page.dart';
import 'home_page.dart';


class MainLayout extends StatefulWidget{
  const MainLayout({Key? key}) : super(key:key);
  @override 
  State <MainLayout> createState() => _MainLayoutState();

}
class _MainLayoutState extends State<MainLayout>{
  int currentPage =  0;
  final PageController _page = PageController();
  @override 
  Widget build (BuildContext context){
    return Scaffold(
      body: PageView(
      controller:  _page, 
      onPageChanged:((value) {
        setState((){
          currentPage = value;
        });
      }),
      children: const <Widget>[
        HomePage(),
        AppointmentPage(),
      ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (page){
          setState((){
            currentPage = page;
            _page.animateToPage(page, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut,);
          });
        },
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
           icon: Image.asset(
            'assets/home.png', // Replace with the actual path to your image
            width: 24.0, // Adjust the width as needed
            height: 24.0, // Adjust the height as needed
                 ),
      label: 'Home',
          ),
           BottomNavigationBarItem(
           icon: Image.asset(
            'assets/appointment.png', // Replace with the actual path to your image
            width: 24.0, // Adjust the width as needed
            height: 24.0, // Adjust the height as needed
                 ),
      label: 'Reservations',
          )
        ],
      ),
    );

  }
}
