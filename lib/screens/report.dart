import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vim/models/carInfo.dart';
import 'package:vim/models/localInfo.dart';
import 'package:vim/providers/vim_provider.dart';

class ReportScreen extends StatefulWidget {
  static String routeName = '/reportScreen';
  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String CurrentCarInfoKey = "CurrentCarInfo";
  List<String> _notFoundProperties = [];
  bool loaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text("Report"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              FutureBuilder<CarInfo>(
                future: loadInfo(),

                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return  Column(
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: Colors.green.withOpacity(.5),
                          size: 85,
                        ),
                        Text("Reading Information"),
                        SizedBox(height: 10,),
                        LinearProgressIndicator(color: Colors.green,backgroundColor: Colors.white,),
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return const Text("Error");
                  }

                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                        
                        // loaded = true;
                    return Column(
                      children: [
                        // DataTable(
                        //   columnSpacing: MediaQuery.of(context).size.width*.2,
                        //   dividerThickness: 3,

                        //   border: TableBorder(

                        //     borderRadius: BorderRadius.circular(10),
                        //     // horizontalInside: BorderSide(width: 12)
                        //   ),
                        //   columns: [
                        //   DataColumn(

                        //       label: Text('PROPIEDAD',
                        //           style: TextStyle(
                        //               fontSize: 18,
                        //               color: Colors.white,
                        //               backgroundColor: Colors.green,
                        //               fontWeight: FontWeight.bold))),
                        //   DataColumn(
                        //       label: Text('VALOR',
                        //           style: TextStyle(
                        //               fontSize: 18,
                        //               color: Colors.white,
                        //               backgroundColor: Colors.green,
                        //               fontWeight: FontWeight.bold))),
                        // ], rows: [
                          Padding(
                          padding:
                              const EdgeInsets.only(top: 20, left: 8, right: 8),
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Propiedad",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .5),
                                      Column(
                                        children: const [
                                          Text(
                                            "Valor",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                          ),
                        ),
                        _buildProperty(
                            "Marca", snapshot.data!.results![0].make!),
                        _buildProperty(
                            "ID Marca", snapshot.data!.results![0].makeID!),
                        _buildProperty("Fabricante",
                            snapshot.data!.results![0].manufacturer!),
                        _buildProperty("ID Fabricante",
                            snapshot.data!.results![0].manufacturerId!),
                        _buildProperty(
                            "Modelo", snapshot.data!.results![0].model!),
                        _buildProperty(
                            "ID Modelo", snapshot.data!.results![0].modelID!),
                        _buildProperty(
                            "Año", snapshot.data!.results![0].modelYear!),
                        _buildProperty("airBagLocCurtain",
                            snapshot.data!.results![0].airBagLocCurtain!),
                        _buildProperty("airBagLocFront",
                            snapshot.data!.results![0].airBagLocFront!),
                        _buildProperty(
                            "Sistema ABS", snapshot.data!.results![0].aBS!),
                        _buildProperty("activeSafetySysNote",
                            snapshot.data!.results![0].activeSafetySysNote!),
                        _buildProperty("Adaptative Cruise Control",
                            snapshot.data!.results![0].adaptiveCruiseControl!),
                        _buildProperty("adaptiveDrivingBeam",
                            snapshot.data!.results![0].adaptiveDrivingBeam!),
                        _buildProperty("adaptiveHeadlights",
                            snapshot.data!.results![0].adaptiveHeadlights!),
                        _buildProperty("additionalErrorText",
                            snapshot.data!.results![0].additionalErrorText!),

                        _buildProperty("airBagLocKnee",
                            snapshot.data!.results![0].airBagLocKnee!),
                        _buildProperty("airBagLocSeatCushion",
                            snapshot.data!.results![0].airBagLocSeatCushion!),
                        _buildProperty("airBagLocSide",
                            snapshot.data!.results![0].airBagLocSide!),
                        _buildProperty("autoReverseSystem",
                            snapshot.data!.results![0].autoReverseSystem!),
                        _buildProperty(
                            "automaticPedestrianAlertingSound",
                            snapshot.data!.results![0]
                                .automaticPedestrianAlertingSound!),
                        _buildProperty("axleConfiguration",
                            snapshot.data!.results![0].axleConfiguration!),
                        _buildProperty(
                            "axles", snapshot.data!.results![0].axles!),
                        _buildProperty(
                            "basePrice", snapshot.data!.results![0].basePrice!),
                        _buildProperty(
                            "batteryA", snapshot.data!.results![0].batteryA!),
                        _buildProperty("batteryATo",
                            snapshot.data!.results![0].batteryATo!),
                        _buildProperty("batteryCells",
                            snapshot.data!.results![0].batteryCells!),
                        _buildProperty("batteryInfo",
                            snapshot.data!.results![0].batteryInfo!),
                        _buildProperty("batteryKWh",
                            snapshot.data!.results![0].batteryKWh!),
                        _buildProperty("batteryKWhTo",
                            snapshot.data!.results![0].batteryKWhTo!),
                        _buildProperty("batteryModules",
                            snapshot.data!.results![0].batteryModules!),
                        _buildProperty("batteryPacks",
                            snapshot.data!.results![0].batteryPacks!),
                        _buildProperty("batteryType",
                            snapshot.data!.results![0].batteryType!),
                        _buildProperty(
                            "batteryV", snapshot.data!.results![0].batteryV!),
                        _buildProperty("batteryVTo",
                            snapshot.data!.results![0].batteryVTo!),
                        _buildProperty("bedLengthIN",
                            snapshot.data!.results![0].bedLengthIN!),
                        _buildProperty(
                            "bedType", snapshot.data!.results![0].bedType!),
                        _buildProperty("blindSpotIntervention",
                            snapshot.data!.results![0].blindSpotIntervention!),
                        _buildProperty("blindSpotMon",
                            snapshot.data!.results![0].blindSpotMon!),
                        _buildProperty("bodyCabType",
                            snapshot.data!.results![0].bodyCabType!),
                        _buildProperty(
                            "bodyClass", snapshot.data!.results![0].bodyClass!),
                        _buildProperty("brakeSystemDesc",
                            snapshot.data!.results![0].brakeSystemDesc!),
                        _buildProperty("brakeSystemType",
                            snapshot.data!.results![0].brakeSystemType!),
                        _buildProperty("busFloorConfigType",
                            snapshot.data!.results![0].busFloorConfigType!),
                        _buildProperty(
                            "busLength", snapshot.data!.results![0].busLength!),
                        _buildProperty(
                            "busType", snapshot.data!.results![0].busType!),
                        _buildProperty(
                            "cANAACN", snapshot.data!.results![0].cANAACN!),
                        _buildProperty("cIB", snapshot.data!.results![0].cIB!),
                        _buildProperty("cashForClunkers",
                            snapshot.data!.results![0].cashForClunkers!),
                        _buildProperty("chargerLevel",
                            snapshot.data!.results![0].chargerLevel!),
                        _buildProperty("chargerPowerKW",
                            snapshot.data!.results![0].chargerPowerKW!),
                        _buildProperty("coolingType",
                            snapshot.data!.results![0].coolingType!),
                        _buildProperty("curbWeightLB",
                            snapshot.data!.results![0].curbWeightLB!),
                        _buildProperty("customMotorcycleType",
                            snapshot.data!.results![0].customMotorcycleType!),
                        _buildProperty("daytimeRunningLight",
                            snapshot.data!.results![0].daytimeRunningLight!),
                        _buildProperty("destinationMarket",
                            snapshot.data!.results![0].destinationMarket!),
                        _buildProperty("displacementCC",
                            snapshot.data!.results![0].displacementCC!),
                        _buildProperty("displacementCI",
                            snapshot.data!.results![0].displacementCI!),
                        _buildProperty("displacementL",
                            snapshot.data!.results![0].displacementL!),
                        _buildProperty(
                            "doors", snapshot.data!.results![0].doors!),
                        _buildProperty(
                            "driveType", snapshot.data!.results![0].driveType!),
                        _buildProperty("driverAssist",
                            snapshot.data!.results![0].driverAssist!),
                        _buildProperty("dynamicBrakeSupport",
                            snapshot.data!.results![0].dynamicBrakeSupport!),
                        _buildProperty("eDR", snapshot.data!.results![0].eDR!),
                        _buildProperty("eSC", snapshot.data!.results![0].eSC!),
                        _buildProperty("eVDriveUnit",
                            snapshot.data!.results![0].eVDriveUnit!),
                        _buildProperty("electrificationLevel",
                            snapshot.data!.results![0].electrificationLevel!),
                        _buildProperty("engineConfiguration",
                            snapshot.data!.results![0].engineConfiguration!),
                        _buildProperty("engineCycles",
                            snapshot.data!.results![0].engineCycles!),
                        _buildProperty("engineCylinders",
                            snapshot.data!.results![0].engineCylinders!),
                        _buildProperty(
                            "engineHP", snapshot.data!.results![0].engineHP!),
                        _buildProperty("engineHPTo",
                            snapshot.data!.results![0].engineHPTo!),
                        _buildProperty(
                            "engineKW", snapshot.data!.results![0].engineKW!),
                        _buildProperty("engineManufacturer",
                            snapshot.data!.results![0].engineManufacturer!),
                        _buildProperty("engineModel",
                            snapshot.data!.results![0].engineModel!),
                        _buildProperty("entertainmentSystem",
                            snapshot.data!.results![0].entertainmentSystem!),
                        _buildProperty(
                            "errorCode", snapshot.data!.results![0].errorCode!),
                        _buildProperty(
                            "errorText", snapshot.data!.results![0].errorText!),
                        _buildProperty(
                            "forwardCollisionWarning",
                            snapshot
                                .data!.results![0].forwardCollisionWarning!),
                        _buildProperty("fuelInjectionType",
                            snapshot.data!.results![0].fuelInjectionType!),
                        _buildProperty("fuelTypePrimary",
                            snapshot.data!.results![0].fuelTypePrimary!),
                        _buildProperty("fuelTypeSecondary",
                            snapshot.data!.results![0].fuelTypeSecondary!),
                        _buildProperty(
                            "gCWR", snapshot.data!.results![0].gCWR!),
                        _buildProperty(
                            "gCWRTo", snapshot.data!.results![0].gCWRTo!),
                        _buildProperty(
                            "gVWR", snapshot.data!.results![0].gVWR!),
                        _buildProperty(
                            "gVWRTo", snapshot.data!.results![0].gVWRTo!),
                        _buildProperty("keylessIgnition",
                            snapshot.data!.results![0].keylessIgnition!),
                        _buildProperty(
                            "laneCenteringAssistance",
                            snapshot
                                .data!.results![0].laneCenteringAssistance!),
                        _buildProperty("laneDepartureWarning",
                            snapshot.data!.results![0].laneDepartureWarning!),
                        _buildProperty("laneKeepSystem",
                            snapshot.data!.results![0].laneKeepSystem!),
                        _buildProperty(
                            "lowerBeamHeadlampLightSource",
                            snapshot.data!.results![0]
                                .lowerBeamHeadlampLightSource!),
                        _buildProperty("Tipo de chasis de moto",
                            snapshot.data!.results![0].motorcycleChassisType!),
                        _buildProperty(
                            "Tipo de suspencion de moto",
                            snapshot
                                .data!.results![0].motorcycleSuspensionType!),
                        _buildProperty("nCSABodyType",
                            snapshot.data!.results![0].nCSABodyType!),
                        _buildProperty(
                            "nCSAMake", snapshot.data!.results![0].nCSAMake!),
                        _buildProperty("nCSAMapExcApprovedBy",
                            snapshot.data!.results![0].nCSAMapExcApprovedBy!),
                        _buildProperty("nCSAMapExcApprovedOn",
                            snapshot.data!.results![0].nCSAMapExcApprovedOn!),
                        _buildProperty("nCSAMappingException",
                            snapshot.data!.results![0].nCSAMappingException!),
                        _buildProperty(
                            "nCSAModel", snapshot.data!.results![0].nCSAModel!),
                        _buildProperty(
                            "nCSANote", snapshot.data!.results![0].nCSANote!),
                        _buildProperty("nonLandUse",
                            snapshot.data!.results![0].nonLandUse!),
                        _buildProperty(
                            "note", snapshot.data!.results![0].note!),
                        _buildProperty("otherBusInfo",
                            snapshot.data!.results![0].otherBusInfo!),
                        _buildProperty("otherEngineInfo",
                            snapshot.data!.results![0].otherEngineInfo!),
                        _buildProperty("otherMotorcycleInfo",
                            snapshot.data!.results![0].otherMotorcycleInfo!),
                        _buildProperty(
                            "otherRestraintSystemInfo",
                            snapshot
                                .data!.results![0].otherRestraintSystemInfo!),
                        _buildProperty("otherTrailerInfo",
                            snapshot.data!.results![0].otherTrailerInfo!),
                        _buildProperty("parkAssist",
                            snapshot.data!.results![0].parkAssist!),
                        _buildProperty(
                            "pedestrianAutomaticEmergencyBraking",
                            snapshot.data!.results![0]
                                .pedestrianAutomaticEmergencyBraking!),
                        _buildProperty(
                            "plantCity", snapshot.data!.results![0].plantCity!),
                        _buildProperty("plantCompanyName",
                            snapshot.data!.results![0].plantCompanyName!),
                        _buildProperty("plantCountry",
                            snapshot.data!.results![0].plantCountry!),
                        _buildProperty("plantState",
                            snapshot.data!.results![0].plantState!),
                        _buildProperty("possibleValues",
                            snapshot.data!.results![0].possibleValues!),
                        _buildProperty("pretensioner",
                            snapshot.data!.results![0].pretensioner!),
                        _buildProperty(
                            "rearAutomaticEmergencyBraking",
                            snapshot.data!.results![0]
                                .rearAutomaticEmergencyBraking!),
                        _buildProperty("rearCrossTrafficAlert",
                            snapshot.data!.results![0].rearCrossTrafficAlert!),
                        _buildProperty("rearVisibilitySystem",
                            snapshot.data!.results![0].rearVisibilitySystem!),
                        _buildProperty("sAEAutomationLevel",
                            snapshot.data!.results![0].sAEAutomationLevel!),
                        _buildProperty("sAEAutomationLevelTo",
                            snapshot.data!.results![0].sAEAutomationLevelTo!),
                        _buildProperty("seatBeltsAll",
                            snapshot.data!.results![0].seatBeltsAll!),
                        _buildProperty(
                            "seatRows", snapshot.data!.results![0].seatRows!),
                        _buildProperty(
                            "seats", snapshot.data!.results![0].seats!),
                        _buildProperty(
                            "semiautomaticHeadlampBeamSwitching",
                            snapshot.data!.results![0]
                                .semiautomaticHeadlampBeamSwitching!),
                        _buildProperty(
                            "series", snapshot.data!.results![0].series!),
                        _buildProperty(
                            "series2", snapshot.data!.results![0].series2!),
                        _buildProperty("steeringLocation",
                            snapshot.data!.results![0].steeringLocation!),
                        _buildProperty("suggestedVIN",
                            snapshot.data!.results![0].suggestedVIN!),
                        _buildProperty(
                            "tPMS", snapshot.data!.results![0].tPMS!),
                        _buildProperty("topSpeedMPH",
                            snapshot.data!.results![0].topSpeedMPH!),
                        _buildProperty("trackWidth",
                            snapshot.data!.results![0].trackWidth!),
                        _buildProperty("tractionControl",
                            snapshot.data!.results![0].tractionControl!),
                        _buildProperty("trailerBodyType",
                            snapshot.data!.results![0].trailerBodyType!),
                        _buildProperty("trailerLength",
                            snapshot.data!.results![0].trailerLength!),
                        _buildProperty("trailerType",
                            snapshot.data!.results![0].trailerType!),
                        _buildProperty("transmissionSpeeds",
                            snapshot.data!.results![0].transmissionSpeeds!),
                        _buildProperty("transmissionStyle",
                            snapshot.data!.results![0].transmissionStyle!),
                        _buildProperty(
                            "trim", snapshot.data!.results![0].trim!),
                        _buildProperty(
                            "trim2", snapshot.data!.results![0].trim2!),
                        _buildProperty(
                            "turbo", snapshot.data!.results![0].turbo!),
                        _buildProperty("vIN", snapshot.data!.results![0].vIN!),
                        _buildProperty("valveTrainDesign",
                            snapshot.data!.results![0].valveTrainDesign!),
                        _buildProperty("vehicleType",
                            snapshot.data!.results![0].vehicleType!),
                        _buildProperty("wheelBaseLong",
                            snapshot.data!.results![0].wheelBaseLong!),
                        _buildProperty("wheelBaseShort",
                            snapshot.data!.results![0].wheelBaseShort!),
                        _buildProperty("wheelBaseType",
                            snapshot.data!.results![0].wheelBaseType!),
                        _buildProperty("wheelSizeFront",
                            snapshot.data!.results![0].wheelSizeFront!),
                        _buildProperty("wheelSizeRear",
                            snapshot.data!.results![0].wheelSizeRear!),
                        _buildProperty(
                            "wheels", snapshot.data!.results![0].wheels!),
                        _buildProperty(
                            "windows", snapshot.data!.results![0].windows!),
                        // ]),
SizedBox(height: 20,),
                         Text("Not Found Properties"),
                        Container(
                          height: MediaQuery.of(context).size.height * .5,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: _notFoundProperties.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Text(_notFoundProperties[i].toString()),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  }

                  return const Text("No Data");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<CarInfo> loadInfo() async {
    CarInfo finalInfo = CarInfo();
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? info = prefs.getString(CurrentCarInfoKey);
      LocalCarInfo infoObject = LocalCarInfo.fromJson(jsonDecode(info!));
      final vimProvider = Provider.of<VimProvider>(context, listen: false);
      finalInfo =
          await vimProvider.getVimInfo(infoObject.vim!, infoObject.year!);
      return finalInfo;
      print(finalInfo);
    } catch (e) {
      print(e);
      return finalInfo;
    }
  }

  _buildProperty(String s, String t) {
    if (t != "") {
      // return DataTable(
      //         columns: [
      //           DataColumn(label: Text(
      //               'ID',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
      //           )),
      //           DataColumn(label: Text(
      //               'Name',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
      //           )),
      //           DataColumn(label: Text(
      //               'Profession',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
      //           )),
      //         ],
      //         rows: [
      //           DataRow(cells: [
      //             DataCell(Text('1')),
      //             DataCell(Text('Stephen')),
      //             DataCell(Text('Actor')),
      //           ]),
      //           DataRow(cells: [
      //             DataCell(Text('5')),
      //             DataCell(Text('John')),
      //             DataCell(Text('Student')),
      //           ]),
      //           DataRow(cells: [
      //             DataCell(Text('10')),
      //             DataCell(Text('Harry')),
      //             DataCell(Text('Leader')),
      //           ]),
      //           DataRow(cells: [
      //             DataCell(Text('15')),
      //             DataCell(Text('Peter')),
      //             DataCell(Text('Scientist')),
      //           ]),
      //         ],
      //       );
      return 
      // DataRow(cells: [DataCell(Text(s)), DataCell(Text(t))]);

            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 30),
                        child: Text(
                          s,
                          style: const TextStyle(color: Colors.green, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        t,
                        style: const TextStyle(color: Colors.black, fontSize: 18),
                      )
                    ],
                  )
                ],
              ),
          ),
            )
          ;
          
    } else {
      // return SizedBox();
      _notFoundProperties.add(s);
      return SizedBox();
      // Chip(label: Text("Desconocido"));
      // DataRow(selected: true, cells: [
      //   DataCell(Text(s)),
      //   DataCell(Chip(label: Text("Desconocido"))),
      // ]);
    }
  }
}
