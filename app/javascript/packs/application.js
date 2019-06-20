import 'bootstrap';
import Chart from 'chart.js';

// New test dynamic dropdown
if (document.getElementById('test_ga_report_type')) {
  let formValue;
  let reportSelector = document.getElementById('test_ga_report_type');

  reportSelector.addEventListener('change', (event) => {
    for (var i = reportSelector.options.length - 1; i >= 0; i--) {
      if (reportSelector.options[i].selected){
        formValue = reportSelector.options[i].value;
        document.querySelectorAll('.test_selector').forEach((test) => {
            test.style.display = 'none';
          });
        document.getElementById(formValue).style.display = 'inline';
      }
    }
  });
}

// Chart JS setup - Stacked bars

if (document.getElementById('chart-double-bar')){
  const chartLabels = document.getElementById('chart-double-bar').dataset.chartLabels;
  const chartIncorrectValues = document.getElementById('chart-double-bar').dataset.chartIncorrect;
  const chartCorrectValues = document.getElementById('chart-double-bar').dataset.chartCorrect;
  const barChartData = {
        labels: JSON.parse(chartLabels),
        datasets: [{
          label: 'Incorrect results',
          backgroundColor: 'red',
          data: JSON.parse(chartIncorrectValues)
        }
        , {
          label: 'Correct results',
          backgroundColor: '#40539A',
          data: JSON.parse(chartCorrectValues)
        }]
      };

  window.onload = function() {
    var ctx = document.getElementById('chart-double-bar').getContext('2d');
    window.myBar = new Chart(ctx, {
      type: 'bar',
      data: barChartData,
      options: {
        title: {
          display: true,
          // text: 'Previous 5 runs results'
        },
        tooltips: {
          mode: 'index',
          intersect: false
        },
        responsive: true,
        scales: {
          xAxes: [{
            stacked: true,
          }],
          yAxes: [{
            stacked: true
          }]
        }
      }
    });
  };
}

// Chart JS setup - Simple line

if (document.getElementById('chart-line')){
 var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    var config = {
      type: 'line',
      data: {
        labels: ['06/14', '06/15', '06/16', '06/17', '06/18', '06/19', '06/20'],
        datasets: [{
          label: '',
          fill: false,
          backgroundColor: '#F1F9FB',
          borderColor: '#405398',
          data: [20,21,23,20,32,20,28],
        }]
      },
      options: {
        responsive: true,
        title: {
          display: false
        },
        tooltips: {
          mode: 'index',
          intersect: false,
        },
        hover: {
          mode: 'nearest',
          intersect: true
        },
        scales: {
          xAxes: [{
            display: true,
            scaleLabel: {
              display: true,
              labelString: 'Date'
            }
          }],
          yAxes: [{
            display: true,
            scaleLabel: {
              display: true,
              labelString: 'Credits consumed'
            }
          }]
        }
      }
    };

    window.onload = function() {
      var ctx = document.getElementById('chart-line').getContext('2d');
      window.myLine = new Chart(ctx, config);
    };
}







