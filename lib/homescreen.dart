import 'package:flutter/material.dart';

import 'dart:convert'; 
import 'package:flutter/services.dart' show rootBundle;

import 'main_titles.dart';
import 'side_titles_gallery.dart';
 

List _contentList= [];
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/pages_content.json');
    final data = await json.decode(response);
    
    setState(() {      
      _contentList = data["list"];
     
    });
  }
  
  @override
  void initState() {
    super.initState();
    readJson(); 
  }

  @override
  Widget build(BuildContext context) {
    return const PageZero();
  }
}

class PageZero extends StatelessWidget {
  const PageZero({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children:[
          InkWell(
            splashColor: Colors.black26,
            onTap: () {
              Navigator.push(
                          context,
                          
                          MaterialPageRoute(
                            builder: (context) => PageTemplate(content:_contentList, parentContent: const [],),
                          ),
                      );
            },
            child: Ink.image(
                image:const AssetImage('assets/images/giris.jpg'),
                fit: BoxFit.fitWidth,
                
            ),
          ),
        ]
      ),
    );
  }
}

class PageTemplate extends StatelessWidget {

  const PageTemplate({
    super.key,
    required this.content,
    required this.parentContent,
  });

  final List content;
  final List parentContent;

  @override
  Widget build(BuildContext context) {

    
    return  Scaffold(
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children:[
            
            if (content[0]["content_type"]=="main_titles")...
            [
              Container(
                color:Colors.amber,
                child: Image.asset(content[0]["bg"], fit: BoxFit.fitHeight,),
              ),
               MainTitles(content:content),
            ]
            else if (content[0]["content_type"]=="side_titles")...
            [
              SideTitlesGallery(content:content, parentContent:parentContent),
            ]
          ]
        ),
      )
    );
  }
}
