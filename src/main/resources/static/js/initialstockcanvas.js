     
     var ctx1 = document.getElementById('myChart').getContext('2d');
     var ctx2 = document.getElementById('myChart2').getContext('2d');
     var ctx3 = document.getElementById('myChart3').getContext('2d');
     var ctx4 = document.getElementById('myChart4').getContext('2d');
     var data=[];
     var labels =[];
     var chartColors = 
     {
       red: 'rgb(255, 99, 132)',
       orange: 'rgb(255, 159, 64)',
       yellow: 'rgb(255, 205, 86)',
       green: 'rgb(75, 192, 192)',
       blue: 'rgb(54, 162, 235)',
       purple: 'rgb(153, 102, 255)',
       grey: 'rgb(231,233,237)'
     };
     var chart1 = new Chart(ctx1, {
         type: 'line',
         data: {
             labels: labels,
             datasets: []
         },options: {
          plugins:{
           legend:{
            display:true,
           },
           datalabels:{
            color:chartColors.purple,
            anchor:'end',
            align: 'end',
            font: {
                     weight: 'bold',
                     size: 10,
                   }
           }
          },
          scales: {
           y:{
            beginAtZero:true,
           }
          }
         },plugins:[ChartDataLabels]
              
         });
     var chart2 = new Chart(ctx2, {
         type: 'line',
         data: {
             labels: labels,
             datasets: []
         },options: {
          plugins:{
           legend:{
            display:true,
           },
           datalabels:{
            color:chartColors.purple,
            anchor:'end',
            align: 'end',
            font: {
                     weight: 'bold',
                     size: 10,
                   }
           }
          },
          scales: {
           y:{
            beginAtZero:true,
           }
          }
         },plugins:[ChartDataLabels]
              
         });
     
     var chart3 = new Chart(ctx3, {
         type: 'line',
         data: {
             labels: labels,
             datasets: []
         },options: {
          plugins:{
           legend:{
            display:true,
           },
           datalabels:{
            color:chartColors.purple,
            anchor:'end',
            align: 'end',
            font: {
                     weight: 'bold',
                     size: 10,
                   }
           }
          },
          scales: {
           y:{
            beginAtZero:true,
           }
          }
         },plugins:[ChartDataLabels]
              
         });
     
     var chart4 = new Chart(ctx4, {
         type: 'line',
         data: {
             labels: labels,
             datasets: []
         },options: {
          plugins:{
           legend:{
            display:true,
           },
           datalabels:{
            color:chartColors.purple,
            anchor:'end',
            align: 'end',
            font: {
                     weight: 'bold',
                     size: 10,
                   }
           }
          },
          scales: {
           y:{
            beginAtZero:true,
           }
          }
         },plugins:[ChartDataLabels]
              
         });



