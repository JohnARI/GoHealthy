import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_healthy/shared/enums/pie_charts_enums.dart';

import '../blocs/pie_chart_bloc.dart';

/// PieChartWidget
///
/// Arguments:
///
/// * `minValue` (required) - double
/// * `maxValue` (required) - double
/// * `type` (required) - double (0 = carbs, 1 = proteins, 2 = lipids, 3 = calories)
class PieChartWidget extends StatefulWidget {
  const PieChartWidget(
      {super.key,
      required this.minValue,
      required this.maxValue,
      required this.type,
      required this.primaryColor,
      required this.secondaryColor,
      required this.svgAssets});

  final double minValue;
  final double maxValue;
  final PieChartType type;
  final Color primaryColor;
  final Color secondaryColor;
  final String svgAssets;

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  late PieChartBloc _pieChartBloc;
  late double itemWidth = 7;
  late bool isTouched = false;
  late PieChartType type;

  late double minValue = 0;
  late double maxValue = 0;
  late Color piePrimaryColor = Colors.white;
  late Color pieSecondaryColor = Colors.white;
  late String svgAssets = "";

  @override
  void initState() {
    super.initState();
    _pieChartBloc = PieChartBloc();
    _pieChartBloc.add(PieChartInitialEvent(
        minValue: widget.minValue,
        maxValue: widget.maxValue,
        type: widget.type));
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
      width: 50,
      height: 50,
      child: PieChart(
        swapAnimationDuration: const Duration(milliseconds: 150),
        swapAnimationCurve: Curves.linear,
        PieChartData(
          pieTouchData: PieTouchData(touchCallback:
              (FlTouchEvent pieTouchEvent, PieTouchResponse? pieTouchResponse) {
            if (pieTouchEvent is FlLongPressMoveUpdate ||
                pieTouchEvent is FlTapDownEvent) {
              setState(() {
                itemWidth = 7;
              });
            }
            if (pieTouchEvent is FlLongPressEnd ||
                pieTouchEvent is FlTapUpEvent ||
                pieTouchEvent is FlPanEndEvent) {
              setState(() {
                itemWidth = 5;
              });
            }
          }),
          sections: <PieChartSectionData>[
            PieChartSectionData(
              color: widget.secondaryColor,
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
              color: widget.primaryColor,
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
