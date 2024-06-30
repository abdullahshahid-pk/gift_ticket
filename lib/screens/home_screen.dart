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
  late Future<int> counter ;
  TextEditingController agentName = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  
  @override
  void initState() {
    counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
    super.initState();
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
        child: FutureBuilder<int>(
            future: counter,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
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
                        controller: agentName,
                        hintText: "Enter Agent Name",
                        labelText: "Agent Name",
                      ),
                      SizedBox(height: 25.h,),
                      if(_selectedBoxIndex == 0 || _selectedBoxIndex == 1 ||
                          _selectedBoxIndex == 2)
                        InkWell(
                          onTap: printDialog(snapshot.data ?? 0),
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
    });
  }
  void _onBoxTapped1(int index) {
    setState(() {
      _selectedBoxIndex1 = index;
    });
  }
  printDialog(int ticketNo){
    setState(() {
      if(agentName.text == '' || agentName.value == null){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Enter agent name'),
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
        // agentName.clear();
        // _selectedBoxIndex = -1;
        // addOnGift = false;
        // instantGift = false;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Generating Ticket'),
            duration: Duration(milliseconds: 2),
          ),
        );
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
                          Text("Ticket Number AA${ticketNo.toString().padLeft(5, "0")}",
                            style: poppinsPureBlack(size: 14),),
                          SizedBox(height: 10.h),
                          Text("Agent Name XYZ", style: poppinsPureBlack(size: 14),),
                          SizedBox(height: 10.h),
                          Text("Gift Type selected", style: poppinsPureBlack(size: 14),),
                          SizedBox(height: 10.h),
                          Text("Ticket Price 00 AED", style: poppinsPureBlack(size: 14),),
                          SizedBox(height: 10.h),
                          InkWell(
                            onTap: () async {
                              // counter = await _prefs.setInt('counter', counter);
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
    });
  }
}