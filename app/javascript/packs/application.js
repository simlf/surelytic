import "bootstrap";

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

