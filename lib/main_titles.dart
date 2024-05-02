
import 'package:flutter/material.dart';
import 'homescreen.dart';

int hexToInteger(String hex) => int.parse(hex, radix: 16);

class MainTitles extends StatelessWidget {
  const MainTitles({
    super.key,
    required this.content,
  });

  final List content;

  @override
  Widget build(BuildContext context) {

    var subList = content[0]["sub_list"];

    return Row(
      children: [
        Container(
          width:MediaQuery.of(context).size.width*0.281,
          color: const Color.fromARGB(0, 233, 30, 98),),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ SizedBox(
                        width:MediaQuery.of(context).size.width*0.46,
                        child: RowTitles(subList: subList, start:0, end:3)
                      ),
                      SizedBox(
                        width:MediaQuery.of(context).size.width*0.636,
                        child: RowTitles(subList: subList, start:3, end:7)
                      ),
                      SizedBox(
                        width:MediaQuery.of(context).size.width*0.47,
                        child:RowTitles(subList: subList, start:7, end:subList.length),
                      ),
            ],
        ),
      ],
    );
  }
}

class RowTitles extends StatelessWidget {
  const RowTitles({
    super.key,
    required this.subList,
    required this.start,
    required this.end,
  });
  final List<dynamic>subList;
  final int start;
  final int end;

  @override
  Widget build(BuildContext context) {

    var rowList = subList.sublist(start,end);
   
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: rowList.map<Widget>((item) {
              
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width:MediaQuery.of(context).size.width*0.126,
                    height:MediaQuery.of(context).size.height*0.28,
                    color: const Color.fromARGB(0, 255, 0, 144),
                    child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                                splashColor: const Color.fromARGB(66, 241, 240, 240),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PageTemplate(content:[item], parentContent:subList ),
                                      ),
                                    );
                                },
                                child: Ink(
                                            child:Container(
                                                alignment: Alignment.bottomLeft,
                                                padding: const EdgeInsets.all(10),
                                                child:Text(item["title"],
                                                          textAlign: TextAlign.start,
                                                          maxLines: 4,
                                                          style: const TextStyle(fontWeight: FontWeight.w900, 
                                                                          color: Color.fromARGB(0, 255, 255, 255),
                                                                          fontSize:15, 
                                                                          height: 1,
                                                                          fontFamily: 'DrukTextHeavy'),),
                                                                      ),
                                        ),
                        ),
                        
                        
                    ),
                  );
                },
              );
            }).toList(),
        
      
    
        );
  }
}
