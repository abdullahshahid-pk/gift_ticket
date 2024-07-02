import 'package:intl/intl.dart';
import 'package:gift_ticket/constants/dependencies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedBoxIndex = -1;
  int _selectedBoxIndex1 = -1;
  bool instantGift = false;
  bool addOnGift = false;
  int price = 0;
  String giftName = "";
  String dateTime = "";
  late Future<String> counter ;
  TextEditingController transactionCode = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List availableBluetoothDevices = [];
  
  @override
  void initState() {
    counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('counter') ?? "477468981902863000";
    });
    initBluetooth();
    super.initState();
  }

  Future<void> initBluetooth() async {
    final List? bluetooths = await BluetoothThermalPrinter.getBluetooths;
    setState(() {
      availableBluetoothDevices = bluetooths!;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        backgroundColor: AppColors.pureWhite,
        centerTitle: true,
        title: Text("Gift Ticket",
          style: poppinsPureBlack(size: 20),
        ),
      ),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: FutureBuilder<String>(
            future: counter,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h, right: 15.w, left: 15.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(child: Text(
                        'Ticket Price', style: poppinsPureBlack(size: 14
                          .sp),),),
                      SizedBox(height: 15.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(3, (index) {
                          return GestureDetector(
                            onTap: () => _onBoxTapped(index),
                            child: Container(
                              width: 75.w,
                              height: 75.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.r),
                                  topRight: Radius.circular(25.r),
                                  bottomLeft: Radius.circular(25.r),
                                  bottomRight: Radius.circular(25.r),
                                ),
                                color: _selectedBoxIndex == index ? AppColors
                                    .primaryColor : AppColors.charcoal,
                              ),
                              child: Center(
                                child: Text(
                                  index == 0 ? "5 AED" : index == 1
                                      ? "10 AED"
                                      : "20 AED",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 50.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Add on',
                                style: poppinsPureBlack(size: 14.sp),),
                              SizedBox(width: 25.w,),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (instantGift) {
                                      instantGift = false;
                                    }
                                    if (addOnGift) {
                                      _selectedBoxIndex1 = -1;
                                    }
                                    addOnGift = !addOnGift;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: 40.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: addOnGift
                                        ? AppColors.primaryColor
                                        : AppColors.charcoal,
                                  ),
                                  child: Stack(
                                    children: [
                                      AnimatedPositioned(
                                        duration: const Duration(
                                            milliseconds: 200),
                                        curve: Curves.easeIn,
                                        left: addOnGift ? null : 5.w,
                                        right: addOnGift ? 5.w : null,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.h),
                                          child: Container(
                                            width: 15.w,
                                            height: 15.h,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.pureWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Instant gift',
                                style: poppinsPureBlack(size: 14.sp),),
                              SizedBox(width: 25.w,),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (addOnGift) {
                                      addOnGift = false;
                                      _selectedBoxIndex1 = -1;
                                    }
                                    instantGift = !instantGift;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: 40.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: instantGift
                                        ? AppColors.primaryColor
                                        : AppColors.charcoal,
                                  ),
                                  child: Stack(
                                    children: [
                                      AnimatedPositioned(
                                        duration: const Duration(
                                            milliseconds: 200),
                                        curve: Curves.easeIn,
                                        left: instantGift ? null : 5.w,
                                        right: instantGift ? 5.w : null,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.h),
                                          child: Container(
                                            width: 15.w,
                                            height: 15.h,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.pureWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h,),
                      if(addOnGift)
                        Wrap(
                          spacing: 15.w,
                          runSpacing: 15.h,
                          children: List.generate(4, (index) {
                            return GestureDetector(
                              onTap: () => _onBoxTapped1(index),
                              child: Column(
                                children: [
                                  Container(
                                    width: 150.w,
                                    height: 75.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25.r),
                                        topRight: Radius.circular(25.r),
                                        bottomLeft: Radius.circular(25.r),
                                        bottomRight: Radius.circular(25.r),
                                      ),
                                      color: _selectedBoxIndex1 == index
                                          ? AppColors.primaryColor
                                          : AppColors.charcoal,
                                    ),
                                    child: Center(
                                      child: Text(
                                        index == 0 ? "Headphone" : index == 1
                                            ? "Charger"
                                            :
                                        index == 2 ? "Cover" : "Base",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15.h,),
                                ],
                              ),
                            );
                          }),
                        ),
                      TextInputBox(
                        controller: transactionCode,
                        hintText: "Enter Transaction Code",
                        labelText: "Transaction Code",
                      ),
                      SizedBox(height: 25.h,),
                      if(_selectedBoxIndex == 0 || _selectedBoxIndex == 1 ||
                          _selectedBoxIndex == 2)
                        InkWell(
                          onTap: (){
                            if(transactionCode.text == '' || transactionCode.value == null){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Enter Transaction Code'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                            else if(addOnGift && _selectedBoxIndex1 == -1){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Select Add On Gift'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                            else{
                              // transactionCode.clear();
                              // _selectedBoxIndex = -1;
                              // addOnGift = false;
                              // instantGift = false;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Generating Ticket'),
                                  duration: Duration(milliseconds: 2),
                                ),
                              );
                              printDialog(snapshot.data ?? "No define");
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.charcoal,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r),
                                bottomLeft: Radius.circular(20.r),
                                bottomRight: Radius.circular(20.r),
                              ),
                            ),
                            child: Center(
                              child: Text('Generate Ticket',
                                style: poppinsPrimary(size: 16),),
                            ),
                          ),
                        ),
                      SizedBox(height: 25.h,),
                    ],
                  ),
                ),
              );
            },
        ),
      ),
    );
  }
  void _onBoxTapped(int index) {
    setState(() {
      _selectedBoxIndex = index;
      if(_selectedBoxIndex == 0){
        price = 5;
      }
      else if(_selectedBoxIndex == 1){
        price = 10;
      }
      else if(_selectedBoxIndex == 2){
        price = 20;
      }
    });
  }
  void _onBoxTapped1(int index) {
    setState(() {
      _selectedBoxIndex1 = index;
      if(_selectedBoxIndex1 == 0){
        giftName = "Headphone";
      }
      else if(_selectedBoxIndex1 == 1){
        giftName = "Charger";
      }
      else if(_selectedBoxIndex1 == 2){
        giftName = "Cover";
      }
      else if(_selectedBoxIndex1 == 2){
        giftName = "Base";
      }
    });
  }
  printDialog(String ticketNo){
    dateTime = DateFormat('EEE, MMM d, y • h:mm:ss a').format(DateTime.now());
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          elevation: 10,
          insetPadding: EdgeInsets.all(20.r),
          backgroundColor: AppColors.pureWhite,
          child: StatefulBuilder(
            builder: (context, setter) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 10.w,),
                          Text("Ticket Details", style: poppinsPureBlack(size: 16),),
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.clear, size: 25.h, color: AppColors.pureBlack,),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            height: 25.h,
                            width: 25.w,
                            image: const AssetImage(AppImages.logoImage),
                          ),
                          SizedBox(width: 10.w,),
                          Text("DOUBLE DREAM DUBAI", style: poppinsPureBlack(size: 16),),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(dateTime, style: poppinsPureBlack(size: 14),),
                      SizedBox(height: 10.h),
                      Column(
                        children: [
                          Text("Lucky Draw Ticket Number", style: poppinsPureBlack(size: 14),),
                          Text(ticketNo, style: poppinsPureBlack(size: 14),),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Transaction Code", style: poppinsPureBlack(size: 14),),
                          Text(transactionCode.text, style: poppinsPureBlack(size: 14),),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ticket Price", style: poppinsPureBlack(size: 14),),
                          Text("$price AED", style: poppinsPureBlack(size: 14),),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      if(addOnGift || instantGift)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(addOnGift ? "Add On Gift" : "Instant Gift", style: poppinsPureBlack(size: 14),),
                            if(addOnGift)
                              Text(giftName, style: poppinsPureBlack(size: 14),),
                          ],
                        ),
                      SizedBox(height: 10.h),
                      InkWell(
                        onTap: () async {
                          // counter = await _prefs.setInt('counter', counter);
                          if (availableBluetoothDevices.isNotEmpty) {
                            String mac = availableBluetoothDevices[0].split("#")[1];
                            _connectAndPrint(mac);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('No available Bluetooth devices')),
                            );
                          }
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 40.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                            color: AppColors.charcoal,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                              bottomLeft: Radius.circular(20.r),
                              bottomRight: Radius.circular(20.r),
                            ),
                          ),
                          child: Center(
                            child: Text('Print Ticket', style: poppinsPrimary(size: 16),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _connectAndPrint(String mac) async {
    final String? result = await BluetoothThermalPrinter.connect(mac);
    if (result != null) {
      List<int> bytes = await getTicket();
      final result = await BluetoothThermalPrinter.writeBytes(bytes);
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not connect to the printer')),
      );
    }
  }

  Future<List<int>> getTicket() async {
    List<int> bytes = [];
    CapabilityProfile profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);

    bytes += generator.text("Demo Shop",
        styles: PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ),
        linesAfter: 1);

    bytes += generator.text(
        "18th Main Road, 2nd Phase, J. P. Nagar, Bengaluru, Karnataka 560078",
        styles: PosStyles(align: PosAlign.center));
    bytes += generator.text('Tel: +919591708470',
        styles: PosStyles(align: PosAlign.center));

    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
          text: 'No',
          width: 1,
          styles: PosStyles(align: PosAlign.left, bold: true)),
      PosColumn(
          text: 'Item',
          width: 5,
          styles: PosStyles(align: PosAlign.left, bold: true)),
      PosColumn(
          text: 'Price',
          width: 2,
          styles: PosStyles(align: PosAlign.center, bold: true)),
      PosColumn(
          text: 'Qty',
          width: 2,
          styles: PosStyles(align: PosAlign.center, bold: true)),
      PosColumn(
          text: 'Total',
          width: 2,
          styles: PosStyles(align: PosAlign.right, bold: true)),
    ]);

    bytes += generator.row([
      PosColumn(text: "1", width: 1),
      PosColumn(
          text: "Tea",
          width: 5,
          styles: PosStyles(
            align: PosAlign.left,
          )),
      PosColumn(
          text: "10",
          width: 2,
          styles: PosStyles(
            align: PosAlign.center,
          )),
      PosColumn(text: "1", width: 2, styles: PosStyles(align: PosAlign.center)),
      PosColumn(text: "10", width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);

    bytes += generator.row([
      PosColumn(text: "2", width: 1),
      PosColumn(
          text: "Sada Dosa",
          width: 5,
          styles: PosStyles(
            align: PosAlign.left,
          )),
      PosColumn(
          text: "30",
          width: 2,
          styles: PosStyles(
            align: PosAlign.center,
          )),
      PosColumn(text: "1", width: 2, styles: PosStyles(align: PosAlign.center)),
      PosColumn(text: "30", width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);

    bytes += generator.row([
      PosColumn(text: "3", width: 1),
      PosColumn(
          text: "Masala Dosa",
          width: 5,
          styles: PosStyles(
            align: PosAlign.left,
          )),
      PosColumn(
          text: "50",
          width: 2,
          styles: PosStyles(
            align: PosAlign.center,
          )),
      PosColumn(text: "1", width: 2, styles: PosStyles(align: PosAlign.center)),
      PosColumn(text: "50", width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);

    bytes += generator.row([
      PosColumn(text: "4", width: 1),
      PosColumn(
          text: "Rova Dosa",
          width: 5,
          styles: PosStyles(
            align: PosAlign.left,
          )),
      PosColumn(
          text: "70",
          width: 2,
          styles: PosStyles(
            align: PosAlign.center,
          )),
      PosColumn(text: "1", width: 2, styles: PosStyles(align: PosAlign.center)),
      PosColumn(text: "70", width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);

    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(
          text: 'TOTAL',
          width: 6,
          styles: PosStyles(
            align: PosAlign.left,
            height: PosTextSize.size4,
            width: PosTextSize.size4,
          )),
      PosColumn(
          text: "160",
          width: 6,
          styles: PosStyles(
            align: PosAlign.right,
            height: PosTextSize.size4,
            width: PosTextSize.size4,
          )),
    ]);

    bytes += generator.hr(ch: '=', linesAfter: 1);

    // ticket.feed(2);
    bytes += generator.text('Thank you!',
        styles: PosStyles(align: PosAlign.center, bold: true));

    bytes += generator.text("26-11-2020 15:22:45",
        styles: PosStyles(align: PosAlign.center), linesAfter: 1);

    bytes += generator.text(
        'Note: Goods once sold will not be taken back or exchanged.',
        styles: PosStyles(align: PosAlign.center, bold: false));
    bytes += generator.cut();
    return bytes;
  }


}