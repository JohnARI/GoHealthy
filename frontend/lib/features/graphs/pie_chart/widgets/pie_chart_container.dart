import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_healthy/features/graphs/pie_chart/blocs/pie_chart_bloc.dart';
import 'package:go_healthy/features/graphs/pie_chart/widgets/pie_chart_widget.dart';
import 'package:go_healthy/shared/colors.dart';
import 'package:go_healthy/shared/enums/pie_charts_enums.dart';
import 'package:go_healthy/shared/styles.dart';
import 'package:go_healthy/shared/svg_assets.dart';

// ignore: must_be_immutable
class PieChartContainer extends StatelessWidget {
  const PieChartContainer(
      {super.key,
      required this.type,
      required this.title,
      required this.primaryColor,
      required this.secondaryColor,
      required this.svgAssets});

  final PieChartType type;
  final String title;
  final Color primaryColor;
  final Color secondaryColor;
  final String svgAssets;

  @override
  Widget build(BuildContext context) {
    final PieChartBloc pieChartBloc = PieChartBloc();

    // pieChartBloc.add(PieChartContainerInitialEvent(type: type));

    return BlocConsumer<PieChartBloc, PieChartState>(
      bloc: pieChartBloc,
      listener: (BuildContext context, PieChartState state) {
        if (state is PieChartContainerInitialStateSuccess) {
          // TODO: Fetch from the back the values for the max and min values.
        }
      },
      builder: (BuildContext context, PieChartState state) {
        if (state is PieChartInitialStateSuccess) {
          return _buildInitialState(
              context, primaryColor, secondaryColor, svgAssets);
        } else if (state is PieChartLoadingState) {
          return _buildLoadingState();
        } else if (state is PieChartErrorState) {
          return _buildErrorState();
        } else {
          return _buildInitialState(
              context, primaryColor, secondaryColor, svgAssets);
        }
      },
    );
  }

  Widget _buildInitialState(BuildContext context, Color primaryColor,
      Color secondaryColor, String svgAssets) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[AppStyle.shadow0],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SvgAssets.buildSvg(
                      path: svgAssets,
                      height: 20,
                      colorFilter:
                          ColorFilter.mode(primaryColor, BlendMode.srcIn)),
                  PieChartWidget(
                      minValue: 540,
                      maxValue: 2450,
                      type: type,
                      primaryColor: primaryColor,
                      secondaryColor: secondaryColor,
                      svgAssets: svgAssets),
                ],
              ),
              const SizedBox(width: 10),
              Text(title, style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Baseline(
                baselineType: TextBaseline.alphabetic,
                baseline: 28.0,
                child: Text("540",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: primaryColor,
                        )),
              ),
              Baseline(
                baselineType: TextBaseline.alphabetic,
                baseline: 20.0,
                child: Text(
                  " / 2540cal",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColor.BLACK5,
                      ),
                ),
              ),
            ],
          )
        ],
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
