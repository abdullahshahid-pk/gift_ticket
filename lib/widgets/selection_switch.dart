import '../constants/dependencies.dart';

class SelectionSwitch extends StatefulWidget {
  bool selected;
  SelectionSwitch({super.key, required this.selected,});

  @override
  State<SelectionSwitch> createState() => _SelectionSwitchState();
}

class _SelectionSwitchState extends State<SelectionSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Add on', style: poppinsPureBlack(size: 14.sp),),
            SizedBox(width: 25.w,),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.selected = !widget.selected;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 40.w,
                height: 20.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: widget.selected ? AppColors.charcoal : AppColors.primaryColor,
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                      left: widget.selected ? 5.w : null,
                      right: widget.selected ? null : 5.w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
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
            Text('Instant gift', style: poppinsPureBlack(size: 14.sp),),
            SizedBox(width: 25.w,),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.selected = !widget.selected;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 40.w,
                height: 20.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: widget.selected ? AppColors.primaryColor : AppColors.charcoal,
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                      left: widget.selected ? null : 5.w,
                      right: widget.selected ? 5.w : null,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
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
    );
  }
}
