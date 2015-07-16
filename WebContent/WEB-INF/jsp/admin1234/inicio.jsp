<%@ page language="java" contentType="text/html; charset=latin1"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html class="no-js">
  <head>
    <meta charset="UTF-8">
    <title>Panel administración</title>

    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/font-awesome.min.css">

    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/main.min.css">

    <!-- metisMenu stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/metisMenu.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/fullcalendar.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/style-switcher.css">
    <link rel="stylesheet/less" type="text/css" href="${pageContext.request.contextPath}/resources/admin/less/theme.less">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.0/animate.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <!--[if lt IE 9]>
      <script src="${pageContext.request.contextPath}/resources/admin/js/html5shiv/html5shiv.js"></script>
      <script src="${pageContext.request.contextPath}/resources/admin/js/respond.js"></script>
      <![endif]-->

    <!--For Development Only. Not required -->
    <script>
      less = {
        env: "development",
        relativeUrls: false,
        rootpath: "../assets/"
      };
    </script>

    <link rel="stylesheet/less" type="text/css" href="${pageContext.request.contextPath}/resources/admin/less/theme.less">
    <script src="${pageContext.request.contextPath}/resources/admin/js/less.min.js"></script>

    <!--Modernizr-->
    <script src="${pageContext.request.contextPath}/resources/admin/js/modernizr.min.js"></script>
  </head>
  <body class="  ">
    <div class="bg-dark dk" id="wrap">
      <div id="top">

        <%@ include file="components/menuAdmin.jsp" %>

		<div class="main-bar">
            <h3>
              <i class="fa fa-dashboard"></i>&nbsp; Inicio</h3>
          </div><!-- /.main-bar -->
        </header><!-- /.head -->
      </div><!-- /#top -->
      
      <div id="content">
        <div class="outer">
          <div class="inner bg-light lter">
            
            
            <div class="row">
              <div class="col-lg-12">
                <div class="box">
                  <header>
                    <h5>Reservas</h5>
                    <div class="toolbar">
                      
                        <a id="botonnCSV" class='btn'>Descargar datos</a>
                      	
                    </div>
                  </header>
                  <div class="body" id="bar" style="height: 250px;"></div>
                </div>
              </div>
              <div class="col-lg-12">
                <div class="box">
                  <div class="body">
                  <div class="table-responsive">
                  <table class="table table-condensed table-hovered sortableTable"><!-- table-bordered table-condensed table-hover table-striped -->
                    <thead>
                        <tr>
                            <th>Nombre Cliente<i class="fa fa-caret-down"></i></th>
                            <th>Estado</th>
                            <th>Número participantes<i class="fa fa-caret-down"></i></th>
                            <th>Fecha de actividad<i class="fa fa-caret-down"></i></th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    	<c:forEach items="${reservas}" var="reserva">
                          <tr>
                              <td>${reserva.nombreCliente}</td>
                              <td><span class="label label-warning">${reserva.estado}</span></td>
                              <td>${reserva.numParticipantes}</td>
                              <c:set var="fecha" value="${reserva.fechaActividad}" />
                              <td><fmt:formatDate type="date" value="${fecha}"  /></td>

                          </tr>
                        </c:forEach>
                        
                      </tbody>
                    </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <hr>
               
			    
			    
			
            
          </div><!-- /.inner -->
        </div><!-- /.outer -->
      </div><!-- /#content -->

      <!-- Menu lateral derecho (descomentar boton en el menu)
      <div id="right" class="bg-light lter">
        <div class="alert alert-danger">
          <button type="button" class="close" data-dismiss="alert">&times;</button>
          <strong>Warning!</strong>  Best check yo self, you're not looking too good.
        </div>
      </div> /#right -->

    </div><!-- /#wrap -->
    <footer class="Footer bg-dark dker">
      <p>2015 &copy; Project AGG team</p>
    </footer><!-- /#footer -->

    <!-- #helpModal -->
    <div id="helpModal" class="modal fade">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">FAQ - Ayuda</h4>
          </div>
          <div class="modal-body">
            
            <%@ include file="components/ayuda.jsp" %>
            
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal --><!-- /#helpModal -->
    

    <!--jQuery -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.tablesorter.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.sparkline.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.flot.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.flot.selection.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.flot.resize.min.js"></script>
    
    <!--jQuery -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.flot.categories.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.flot.pie.min.js"></script>

    <!--Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js"></script>

    <!-- MetisMenu -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/metisMenu.min.js"></script>

    <!-- Screenfull -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/screenfull.min.js"></script>

    <!-- Metis core scripts -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/core.min.js"></script>

    <!-- Metis demo scripts -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/app.js"></script>
    <script>

      (function($) {
        $(document).ready(function(){

            //Metis.dashboard();
            
        	/* var data = [ ["Enero", 1], ["Febrero", 10], ["Marzo", 8], ["Abril", 4], ["Mayo", 13], ["Junio", 17], ["Julio", 9],
	                     ["Agosto", 9], ["Septiembre", 9], ["Octubre", 9], ["Noviembre", 9], ["Diciembre", 9]]; */
        	
        	
	        var data = ${listaReservas};    
	        
	        var data2 = ${listaMonitores};
	        console.log(data[1]);
	                     
        	//var data2 = [];
    		//for (var i = 0; i < 14; i += 0.1) {
    		//	data2.push([i, Math.sqrt(i * 10)]);
    		//}
    		//var data = [ [1,2], [2,2], [3,2], [4,2], [5,2], [6,2], [7,2]];
    		
        	
			$.plot("#bar", [ 
                 {
                	 label: "Reservas realizadas",                	 
                	 data: data,
                	 bars: { 	
                		 show: true, 
                		 fill: true,
                		 lineWidth: 1	                 
           	             //fillColor: '#AAAAAA'
                	 },      
                 } ,
                 {
                	 label: "Monitores contratados",
					 data: data2,
					 lines: { 
						 show: true },
					 points: { show: false }
				 }
			]);

			//Metis.MetisChart();
			// Add the Flot version string to the footer

		
          	console.log("arrancado");
        });
      })(jQuery);
      
      
	    $('#botonnCSV').click(function(){
	 	        var data = ${listaTotalReservas};
	 	        if(data == '')
	 	            return;
	 	        
	 	        JSONToCSVConvertor(data, "Reservas anuales", true);
	    });


    	function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
    	    //If JSONData is not an object then JSON.parse will parse the JSON string in an Object
    	    var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
    	    
    	    var CSV = '';    
    	    //Set Report title in first row or line
    	    
    	    CSV += ReportTitle + '\r\n\n';

    	    //This condition will generate the Label/Header
    	    if (ShowLabel) {
    	        var row = "";
    	        
    	        //This loop will extract the label from 1st index of on array
    	        for (var index in arrData[0]) {
    	            
    	            //Now convert each value to string and comma-seprated
    	            row += index + ',';
    	        }

    	        row = row.slice(0, -1);
    	        
    	        //append Label row with line break
    	        CSV += row + '\r\n';
    	    }
    	    
    	    //1st loop is to extract each row
    	    for (var i = 0; i < arrData.length; i++) {
    	        var row = "";
    	        
    	        //2nd loop will extract each column and convert it in string comma-seprated
    	        for (var index in arrData[i]) {
    	            row += '"' + arrData[i][index] + '",';
    	        }

    	        row.slice(0, row.length - 1);
    	        
    	        //add a line break after each row
    	        CSV += row + '\r\n';
    	    }

    	    if (CSV == '') {        
    	        alert("Datos incorrectos");
    	        return;
    	    }   
    	    
    	    //Generate a file name
    	    var fileName = "NA_";
    	    //this will remove the blank-spaces from the title and replace it with an underscore
    	    fileName += ReportTitle.replace(/ /g,"_");   
    	    
    	    //Initialize file format you want csv or xls
    	    var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
    	    
    	    // Now the little tricky part.
    	    // you can use either>> window.open(uri);
    	    // but this will not work in some browsers
    	    // or you will not get the correct file extension    
    	    
    	    //this trick will generate a temp <a /> tag
    	    var link = document.createElement("a");    
    	    link.href = uri;
    	    
    	    //set the visibility hidden so it will not effect on your web-layout
    	    link.style = "visibility:hidden";
    	    link.download = fileName + ".csv";
    	    
    	    //this part will append the anchor tag and remove it after automatic click
    	    document.body.appendChild(link);
    	    link.click();
    	    document.body.removeChild(link);
    	}
    	
    </script>

  </body>