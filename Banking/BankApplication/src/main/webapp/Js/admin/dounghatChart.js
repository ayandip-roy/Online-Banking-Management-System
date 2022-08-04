const labels = [
    'Active Account',
    'Deactive Account',
    'Close Account'
  ];
  const dataDoughnut = {
    labels: labels,
    datasets: [{
      label: 'Money Credit Chart',
      backgroundColor: ['rgba(255, 99, 132,0.6)',
      'rgba(153, 120, 255,0.6)',
      'rgba(75, 120, 255,0.6)'
    ],
      data: [25, 10, 5],
      borderWidth: 0,
    }]
  };

  const configDoughnut = {
    type: 'doughnut',
    data: dataDoughnut,
    options: {}
  };

  const doughnutChart = new Chart(
    document.getElementById('Accounts'),
    configDoughnut
  );

// Line Chart 

const Linelabels = [
  'one',
  'Two',
  'Three',
  'Four',
  'Five',
  'Six',
  'Seven',
];

const dataLine = {
  labels: Linelabels,
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
  document.getElementById('Customer'),
  configLine
);

