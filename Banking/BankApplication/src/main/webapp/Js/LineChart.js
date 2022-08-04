const labels = [
  'one',
  'Two',
  'Three',
  'Four',
  'Five',
  'Six',
  'Seven',
];

const dataLine = {
  labels: labels,
  datasets: [{
    label: 'Weekly Money Transaction Chart ',
    backgroundColor: ['rgba(255, 99, 132,0.6)',
    'rgba(54, 99, 132,0.6)',
    'rgba(255, 206, 86,0.6)',
    'rgba(75, 192, 192,0.6)',
    'rgba(153, 120, 255,0.6)',
    'rgba(75, 120, 255,0.6)'
  ],
    data: [400, 1010, 500, 2000, 5000, 3000, 2000],
  }]
};

const configLine = {
  type: 'line',
  data: dataLine,
  options: {}
};

const lineChart = new Chart(
  document.getElementById('LineChart'),
  configLine
);

