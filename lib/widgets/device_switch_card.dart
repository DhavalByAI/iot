import 'package:flutter/material.dart';

class DeviceSwitchCard extends StatelessWidget {
  final String label;
  final bool isOn;

  const DeviceSwitchCard({super.key, required this.label, required this.isOn});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(vertical:15, horizontal:10),
      decoration: BoxDecoration(
        color:const Color(0XFF363a40),
        borderRadius:BorderRadius.circular(15)
      ),
      child: Column(  
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor:Colors.black,
                child: Transform.scale(
                  scaleX:0.4, scaleY:0.33,
                  child: Switch(
                    inactiveThumbColor:Colors.white,
                    inactiveTrackColor:Colors.transparent,
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings_rounded, color:Colors.white),
              ),
            ],
          ),
          const SizedBox(height:5),

          Text(label, style:const TextStyle(color:Colors.white, fontSize:14)),
          const SizedBox(height:5),

          Transform.scale(
            scale: 0.9,
            child: Switch(
              activeColor: const Color(0XFF6fc1c5),
              activeTrackColor: const Color(0XFF527d84),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.black,
              value: isOn,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
