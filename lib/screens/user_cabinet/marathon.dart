import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fl_chart/fl_chart.dart';

class Marafon  extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MarafonState();
  }
}

CalendarController _controller;

class MarafonState extends State<Marafon > {
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        iconTheme: (IconThemeData(color: Colors.black)),
        title: Container(
            child: Text("Марафон",style: TextStyle(color: Colors.black),)),
            backgroundColor: Colors.white,
            elevation: 50.0,
        /*
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.trending_up_rounded, color: Colors.black,),
            onPressed: () {
            },
          ), //IconButton
          //IconButton
        ], //<Widget>[]
        */
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                  todayColor: Colors.red,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Colors.white)
              ),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(22.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,

              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _controller,
            )
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    print(width);
    const cutOffYValue = 0.0;
    const yearTextStyle = TextStyle(
        fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(null),
            ),
            title: Text(
              'Рейтинг',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[],
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: width / 1.5,
              width: width / 1,
              child: Material(
                color: Colors.white,
                elevation: 10.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: SizedBox(
                      width: width / 1,
                      height: width / 1.5,
                      child: LineChart(
                        LineChartData(
                          lineTouchData: LineTouchData(enabled: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 0),
                                FlSpot(1, 1),
                                FlSpot(2, 3),
                                FlSpot(3, 3),
                                FlSpot(4, 5),
                                FlSpot(4, 4)
                              ],
                              isCurved: false,
                              barWidth: 1,
                              colors: [
                                Colors.black,
                              ],
                              belowBarData: BarAreaData(
                                show: true,
                                colors: [Colors.red.withOpacity(0.8)],
                                cutOffY: cutOffYValue,
                                applyCutOffY: true,
                              ),
                              aboveBarData: BarAreaData(
                                show: true,
                                colors: [Colors.red.withOpacity(0.6)],
                                cutOffY: cutOffYValue,
                                applyCutOffY: true,
                              ),
                              dotData: FlDotData(
                                show: false,
                              ),
                            ),
                          ],
                          minY: 0,
                          titlesData: FlTitlesData(
                            bottomTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 7,
                                textStyle: yearTextStyle,
                                getTitles: (value) {
                                  switch (value.toInt()) {
                                    case 0:
                                      return '17.01';
                                    case 1:
                                      return '17.02';
                                    case 2:
                                      return '17.03';
                                    case 3:
                                      return '17.04';
                                    case 4:
                                      return '17.05';
                                    case 5:
                                      return '17.03';
                                    case 6:
                                      return '1fsd04';
                                    case 7:
                                      return '175';

                                    default:
                                      return '';
                                  }
                                }),
                            leftTitles: SideTitles(
                                showTitles: true,
                                getTitles: (value) {
                                  switch (value.toInt()) {
                                    case 0:
                                      return '10%';
                                    case 1:
                                      return '20%';
                                    case 2:
                                      return '30%';
                                    case 3:
                                      return '40%';
                                    case 4:
                                      return '50%';
                                    case 5:
                                      return '60%';
                                    case 6:
                                      return '70%';
                                    case 7:
                                      return '10%';

                                    default:
                                      return '';
                                  }
                                }),
                          ),
                          axisTitleData: FlAxisTitleData(
                              topTitle: AxisTitle(
                                  showTitle: true,
                                  titleText: 'Жүру',
                                  margin: 10,
                                  textStyle: yearTextStyle,
                                  textAlign: TextAlign.left),
                              bottomTitle: AxisTitle(
                                  showTitle: true,
                                  margin: 10,
                                  reservedSize: 2,
                                  titleText: 'Күндер',
                                  textStyle: yearTextStyle,
                                  textAlign: TextAlign.right)),
                          gridData: FlGridData(
                            show: false,
                            checkToShowHorizontalLine: (double value) {
                              return value == 1 ||
                                  value == 2 ||
                                  value == 3 ||
                                  value == 4;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}