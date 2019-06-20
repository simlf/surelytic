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
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
        datasets: [{
          label: 'My First dataset',
          backgroundColor: 'white',
          borderColor: 'blue',
          data: [12,11,10,9,8,7],
          fill: false,
        }, {
          label: 'My Second dataset',
          fill: false,
          backgroundColor: 'white',
          borderColor: 'blue',
          data: [8,6,4,12,7,5],
        }]
      },
      options: {
        responsive: true,
        title: {
          display: true,
          text: 'Chart.js Line Chart'
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
              labelString: 'Month'
            }
          }],
          yAxes: [{
            display: true,
            scaleLabel: {
              display: true,
              labelString: 'Value'
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







