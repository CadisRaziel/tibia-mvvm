import 'package:flutter/material.dart';
import 'package:tibia/model/mount_info_model.dart';
import 'package:tibia/constants/constants_color.dart';

class DetailsMountView extends StatefulWidget {
  final MountInfoModel? mount;
  const DetailsMountView({super.key, this.mount});

  @override
  State<DetailsMountView> createState() => _DetailsMountViewState();
}

class _DetailsMountViewState extends State<DetailsMountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 32),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 300,
                  ),
                  Text(
                    widget.mount!.name.toString(),
                    style: TextStyle(
                        fontSize: 55,
                        fontFamily: 'martel',
                        color: title,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                  const Divider(
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.mount!.description.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'martel',
                        color: contentTextColor,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left,
                    maxLines: 60,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 500),
              child: Hero(
                tag: widget.mount!.position,
                child: Image.asset(
                  widget.mount!.iconImage.toString(),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new))
        ],
      )),
    );
  }
}
