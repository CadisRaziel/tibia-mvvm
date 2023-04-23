import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:tibia/data/mount_datas.dart';
import 'package:tibia/constants/constants_color.dart';
import 'package:tibia/views/details_mount_view.dart';

class MountPage extends StatefulWidget {
  const MountPage({super.key});

  @override
  State<MountPage> createState() => _MountPageState();
}

class _MountPageState extends State<MountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      'Montarias',
                      style: TextStyle(
                          fontFamily: 'martel',
                          fontSize: 40,
                          color: title,
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 700,
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Swiper(
                itemCount: mount.length,
                fade: 0.3,
                itemWidth: MediaQuery.of(context).size.width - 2 * 80,
                layout: SwiperLayout.STACK,
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                                  activeColor: Colors.transparent,
                    color: Colors.transparent,
                    space: 0,
                  ),
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 200,
                          ),
                          Card(
                            shape: BeveledRectangleBorder(
                             
                              side: BorderSide(
                                color: title,
                                width:2,
                              ),
                            ),
                            elevation: 8,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 26, left: 32, right: 32, bottom: 32),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 100,
                                  ),
                                  SizedBox(
                                    height: 100,
                                    child: Text(
                                      mount[index].name.toString(),
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: 'martel',
                                          color: title,
                                          fontWeight: FontWeight.w900),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  InkWell(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            opaque: false,
                                            pageBuilder: (context, a, b) =>
                                                DetailsMountView(
                                              mount: mount[index],
                                            ),
                                            transitionsBuilder:
                                                (BuildContext context,
                                                    Animation<double> animation,
                                                    Animation<double>
                                                        secondaryAnimation,
                                                    Widget child) {
                                              return FadeTransition(
                                                opacity: animation,
                                                child: child,
                                              );
                                            },
                                          ));
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "Como domar",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'martel',
                                              color: primaryTextColor,
                                              fontWeight: FontWeight.w400),
                                          textAlign: TextAlign.left,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_rounded,
                                          color: title,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Hero(
                          tag: mount[index].position,
                          child: Image.asset(
                            mount[index].iconImage.toString(),
                            height: 420,
                          ))
                    ],
                  );
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
