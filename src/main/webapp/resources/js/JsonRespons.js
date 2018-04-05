$(function () {
    debugger;
    // Create a Bar Chart with Morris
    var chart = Morris.Area({
        // ID of the element in which to draw the chart.
        element: 'jsonGraphQuick1-chart',
        data: [{ connectorName: '2017 Q1', ciId: 2666, soFar: 2666 }], // Set initial data (ideally you would provide an array of default data)
        xkey: 'ciId', // Set the key for X-axis
        ykeys: ['connectorName', 'soFar'], // Set the key for Y-axis
        labels: ['Connector Name', 'So Far'], // Set the label when bar is rolled over
        lineColors: ['#a0d0e0', '#3c8dbc'],
        hideHover: 'auto'
    });
    debugger;
    // Fire off an AJAX request to load the data
    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "http://localhost:55237/JsonResponse.aspx/GetProducts", // This is the URL to the API
        data: '{}' // Passing a parameter to the API to specify number of days
    }).done(function (data) {
        // When the response to the AJAX request comes back render the chart with new data
        //debugger;
        //alert(data);
        //chart.setData(data);
    }).fail(function () {
        // If there is no communication between the server, show an error
        //alert("error occured");
    });


    debugger;
    //$.ajax(
    //{
    //    type: 'POST',
    //    dataType: 'json',
    //    contentType: 'application/json',
    //    url: 'http://localhost:55237/JsonResponse.aspx/GetProducts',
    //    data: '{}',
    //    success: function (response) {
    //        debugger;
    //        alert(response.d);
    //        var area = new Morris.Area({
    //            element: 'jsonGraphQuick1-chart',
    //            resize: true,
    //            data: response.d,
    //            xkey: 'ciId',
    //            ykeys: ['connectorName', 'soFar'],
    //            labels: ['Connector Name', 'So Far'],
    //            lineColors: ['#a0d0e0', '#3c8dbc'],
    //            hideHover: 'auto'
    //        });
    //    },
    //    error: function (xhr) {
    //        alert(xhr.responseText);
    //    }
    //});

    //var area = new Morris.Area({
    //    element: 'jsonGraphQuick1-chart',
    //    resize: true,
    //    data: [
    //      { connectorName: '2017 Q1', ciId: 2666, soFar: 2666 },
    //      { connectorName: '2016 Q2', ciId: 2294, soFar: 2294 },
    //      { connectorName: '2018 Q3', ciId: 1969, soFar: 1969 },
    //      { connectorName: '2010 Q4', ciId: 4, soFar: 2000 },
    //      { connectorName: '2010 Q4', ciId: 4, soFar: 2032 },
    //      { connectorName: '2010 Q4', ciId: 4, soFar: 2058 },
    //      { connectorName: '2020 Q4', ciId: 4, soFar: 2017 }
    //    ],
    //    xkey: 'ciId',
    //    ykeys: ['connectorName', 'soFar'],
    //    labels: ['Connector Name', 'So Far'],
    //    lineColors: ['#a0d0e0', '#3c8dbc'],
    //    hideHover: 'auto'
    //});

    //var area = new Morris.Area({
    //    element: 'jsonGraphQuick2-chart',
    //    resize: true,
    //    data: [
    //      { connectorName: '2016 Q1', ciId: 2866, soFar: 2666 },
    //      { connectorName: '2016 Q2', ciId: 2084, soFar: 2294 },
    //      { connectorName: '2018 Q3', ciId: 1969, soFar: 1969 },
    //      { connectorName: '2016 Q4', ciId: 4, soFar: 2000 },
    //      { connectorName: '2010 Q4', ciId: 4, soFar: 2032 },
    //      { connectorName: '2016 Q4', ciId: 2666, soFar: 2058 },
    //      { connectorName: '2020 Q4', ciId: 2666, soFar: 2017 }
    //    ],
    //    xkey: 'ciId',
    //    ykeys: ['connectorName', 'soFar'],
    //    labels: ['Connector Name', 'So Far'],
    //    lineColors: ['#a0d0e0', '#3c8dbc'],
    //    hideHover: 'auto'
    //});

});