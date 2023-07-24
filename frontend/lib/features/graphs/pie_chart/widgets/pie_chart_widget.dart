import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/constants.dart';
import '../blocs/pie_chart_bloc.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget(
      {super.key, required this.minValue, required this.maxValue});

  final double minValue;
  final double maxValue;

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  late PieChartBloc _pieChartBloc;
  late double itemWidth = 7;
  late bool isTouched = false;

  late double minValue = 0;
  late double maxValue = 0;

  @override
  void initState() {
    super.initState();
    _pieChartBloc = PieChartBloc();
    _pieChartBloc.add(PieChartInitialEvent(
        minValue: widget.minValue, maxValue: widget.maxValue));
  }

  @override
  void dispose() {
    _pieChartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PieChartBloc, PieChartState>(
      bloc: _pieChartBloc,
      listener: (BuildContext context, PieChartState state) {
        if (state is PieChartInitialStateSuccess) {
          minValue = state.percentValueFilled;
          maxValue = state.percentValueUnfilled;
        }
      },
      builder: (BuildContext context, PieChartState state) {
        if (state is PieChartInitialStateSuccess) {
          return _buildInitialState();
        } else if (state is PieChartLoadingState) {
          return _buildLoadingState();
        } else if (state is PieChartErrorState) {
          return _buildErrorState();
        } else {
          return _buildInitialState();
        }
      },
    );
  }

  Widget _buildInitialState() {
    return SizedBox(
      width: 67,
      height: 67,
      child: PieChart(
        swapAnimationDuration: const Duration(milliseconds: 150),
        swapAnimationCurve: Curves.linear,
        PieChartData(
          pieTouchData: PieTouchData(touchCallback:
              (FlTouchEvent pieTouchEvent, PieTouchResponse? pieTouchResponse) {
            if (pieTouchEvent is FlLongPressMoveUpdate ||
                pieTouchEvent is FlTapDownEvent) {
              setState(() {
                itemWidth = 10;
              });
            }
            if (pieTouchEvent is FlLongPressEnd ||
                pieTouchEvent is FlTapUpEvent ||
                pieTouchEvent is FlPanEndEvent) {
              setState(() {
                itemWidth = 7;
              });
            }
          }),
          sections: <PieChartSectionData>[
            PieChartSectionData(
              color: AppColor.BLUE2,
              value: maxValue,
              radius: 4,
              showTitle: false,
              titleStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff),
              ),
            ),
            PieChartSectionData(
              color: AppColor.BLUE0,
              radius: itemWidth,
              value: minValue,
              showTitle: false,
              titleStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorState() {
    return const Center(
      child: Text('Error'),
    );
  }
}
