const labels = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
  ];
  const dataBar2 = {
    labels: labels,
    datasets: [{
      label: 'Money Credit Chart',
      backgroundColor: ['rgba(255, 99, 132,0.6)',
      'rgba(54, 99, 132,0.6)',
      'rgba(255, 206, 86,0.6)',
      'rgba(75, 192, 192,0.6)',
      'rgba(153, 120, 255,0.6)',
      'rgba(75, 120, 255,0.6)'
    ],
      data: [0, 10100, 5000, 200, 2300, 3000, 4500],
    }]
  };

  const configBar2 = {
    type: 'bar',
    data: dataBar2,
    options: {}
  };

  const barChart = new Chart(
    document.getElementById('BarChart'),
    configBar2
  );