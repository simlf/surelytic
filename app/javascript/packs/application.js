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

// Chart JS setup - Simple bars

if (document.getElementById('chart-simple-bar')){
  const chartLabels = document.getElementById('chart-simple-bar').dataset.chartLabels;
  const chartIncorrectValues = document.getElementById('chart-simple-bar').dataset.chartErrors;

  window.onload = function() {
    const ctx = document.getElementById('chart-simple-bar').getContext('2d');
    window.myBar = new Chart(ctx, {
      type: 'bar',
      data: {
        labels : JSON.parse(chartLabels),
        datasets: [{
        label: '',
        data : JSON.parse(chartIncorrectValues),
        backgroundColor: [
          'red','red','red','red','red','red'
        ],
        borderWidth: 1
        }]
      },
      options: {
        responsive: false,
        scales: {
          xAxes: [{
            ticks: {
              maxRotation: 90,
              minRotation: 80
            }
          }],
          yAxes: [{
            ticks: {
              beginAtZero: true
            }
          }]
        }
      }
    });
  };
}







