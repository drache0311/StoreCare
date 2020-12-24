google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

       var data = google.visualization.arrayToDataTable([
        ['department_name', '처리 수','미처리 수', { role: 'annotation' } ],
        ['본점', 20, 24, ''],
        ['잠실점', 50, 44,''],
        ['미아점', 80, 2, '']
      ]);

      var options = {
        width: '50%',
        height: 400,
        legend: { position: 'top', maxLines: 4 },
        bar: { groupWidth: '75%' },
        isStacked: true,
        hAxis: {
			title: '전체 백화점 문의 내역',
			titleTextStyle: {
		        fontSize: 20,
		        bold: true
			}
		},
      };

      var chart = new google.visualization.ColumnChart(
        document.getElementById('chart_div'));

      chart.draw(data, options);
    }
    
$(window).resize(function(){
   drawBasic();
   });

// 30000 -> 30초 마다 갱신하기    / 되는지는 미확인
google.charts.setOnLoadCallback(function(){
setInterval(drawBasic(),10000);

}); 