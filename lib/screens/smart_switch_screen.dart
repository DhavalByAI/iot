import 'package:flutter/material.dart';
import '../models/device_model.dart';
import '../services/api_service.dart';
import '../services/websocket_service.dart';
import '../widgets/device_switch_card.dart';
import '../widgets/shimmer_loader.dart';

class SmartSwitchScreen extends StatefulWidget {
  const SmartSwitchScreen({super.key});

  @override
  State<SmartSwitchScreen> createState() => _SmartSwitchScreenState();
}

class _SmartSwitchScreenState extends State<SmartSwitchScreen> {
  late Future<List<DeviceModel>> deviceModel;
  List<DeviceModel> deviceModels = []; 

  @override
  void initState() {
    super.initState();
    initializeConnection();
  }

 void initializeConnection() {
  deviceModel = ApiService.fetchDeviceApi().then((models) {
    setState(() {
      deviceModels = models;
    });

    WebSocketService.connect(deviceModels, (updatedModels) {
      setState(() {
        deviceModels = updatedModels; // Update UI when deviceModels changes
      });
    });
    return models;
  });
}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () { 
       return Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
          return const SmartSwitchScreen();
        },));
      },
      child: Scaffold(
        backgroundColor: const Color(0XFF141415),
         appBar: AppBar(
          backgroundColor: const Color(0XFF363a40), centerTitle:true,
          title: const Text('Living Room',style:TextStyle(
            fontSize:17, fontWeight:FontWeight.w500, color:Colors.white),
          ), 
          leading:const Icon(Icons.arrow_back_ios,color:Colors.white,size:16),
          actions: const [
            Icon(Icons.edit_note_rounded,color:Colors.white,size:25),
            SizedBox(width:10)
          ],
        ),
        body: FutureBuilder<List<DeviceModel>>(
          future: deviceModel,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return shimmerLoader();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No devices found.'));
            }
         
            final deviceList = snapshot.data![0].nodes;
      
            return GridView.builder(
              padding: const EdgeInsets.only(top:30, left:12, right:10, bottom:25),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2, mainAxisSpacing:15, crossAxisSpacing:15, childAspectRatio:1,
              ),
              itemCount: deviceList.length,
              itemBuilder: (context, index) {
                return DeviceSwitchCard(
                  label:deviceList[index].label,
                  isOn:deviceList[index].isOn
                );
              },
            );
          },
        ),
      ),
    );
  }
}
