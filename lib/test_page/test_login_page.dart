import 'package:flutter/material.dart';
//
// import 'package:amap_flutter_map/amap_flutter_map.dart';
// import 'package:amap_flutter_base/amap_flutter_base.dart';
//
// class CatHomeMap extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _CatHomeMap();
// }
//
// class _CatHomeMap extends State<CatHomeMap> {
//   static const CameraPosition _kInitialPosition = CameraPosition(
//     target: LatLng(39.909187, 116.397451),
//     zoom: 10.0,
//   );
//   List<Widget> _approvalNumberWidget =List.empty();
//   @override
//   Widget build(BuildContext context) {
//     final AMapWidget map = AMapWidget(
//       initialCameraPosition: _kInitialPosition,
//       onMapCreated: onMapCreated,
//     );
//
//     return ConstrainedBox(
//       constraints: BoxConstraints.expand(),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: map,
//           ),
//           Positioned(
//               right: 10,
//               bottom: 15,
//               child: Container(
//                 alignment: Alignment.centerLeft,
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: _approvalNumberWidget),
//               ))
//         ],
//       ),
//     );
//   }
//
//   late AMapController _mapController;
//   void onMapCreated(AMapController controller) {
//     setState(() {
//       _mapController = controller;
//       getApprovalNumber();
//     });
//   }
//
//   /// 获取审图号
//   void getApprovalNumber() async {
//     //普通地图审图号
//     String? mapContentApprovalNumber =
//     await _mapController?.getMapContentApprovalNumber();
//     //卫星地图审图号
//     String? satelliteImageApprovalNumber =
//     await _mapController?.getSatelliteImageApprovalNumber();
//     setState(() {
//       if (null != mapContentApprovalNumber) {
//         _approvalNumberWidget.add(Text(mapContentApprovalNumber));
//       }
//       if (null != satelliteImageApprovalNumber) {
//         _approvalNumberWidget.add(Text(satelliteImageApprovalNumber));
//       }
//     });
//     print('地图审图号（普通地图）: $mapContentApprovalNumber');
//     print('地图审图号（卫星地图): $satelliteImageApprovalNumber');
//   }
// }