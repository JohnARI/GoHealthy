import 'package:flutter/material.dart';
import 'package:go_healthy/features/graphs/pie_chart/widgets/pie_chart_widget.dart';
import 'package:go_healthy/shared/colors.dart';
import 'package:go_healthy/shared/styles.dart';
import 'package:go_healthy/shared/svg_assets.dart';
import 'package:go_healthy/utils/build_context_extensions.dart';

class PieChartContainer extends StatelessWidget {
  const PieChartContainer({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[AppStyle.shadow0],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: SizedBox(
        width: context.screenWidth / 2 - 40,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SvgAssets.buildSvg(
                        path: SvgAssets.carbs,
                        height: 30,
                        colorFilter: const ColorFilter.mode(
                            AppColor.BLUE0, BlendMode.srcIn)),
                    const PieChartWidget(minValue: 540, maxValue: 2450),
                  ],
                ),
                const SizedBox(width: 10),
                Text(title, style: Theme.of(context).textTheme.titleMedium),
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
                            color: AppColor.BLUE0,
                          )),
                ),
                Baseline(
                  baselineType: TextBaseline.alphabetic,
                  baseline: 20.0,
                  child: Text(
                    " / 2540cal",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColor.BLACK5,
                        ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
