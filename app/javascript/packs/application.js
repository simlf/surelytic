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

// Chart JS setup
const chartLabels = document.getElementById('chart').dataset.chartLabels;
const chartIncorrectValues = document.getElementById('chart').dataset.chartIncorrect;
const chartCorrectValues = document.getElementById('chart').dataset.chartCorrect;
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
  var ctx = document.getElementById('chart').getContext('2d');
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







