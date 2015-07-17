<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/dataTables.bootstrap.css">
    <link rel="stylesheet/less" type="text/css" href="${pageContext.request.contextPath}/resources/admin/less/theme.less">


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

      <%@ include file="../components/menuAdmin.jsp" %>

		<div class="main-bar">
            <h3>
              <i class="fa fa-dashboard"></i>&nbsp; Reservas</h3>
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
            </div>
            <hr>



            <!--Begin Datatables-->
            <div class="row">
              <div class="col-lg-12">
                <div class="box">
                  <header>
                    <div class="icons">
                      <i class="fa fa-table"></i>
                    </div>
                    <h5>Reservas</h5>
                    <!-- .toolbar -->
                    <div class="toolbar">
                      <nav style="padding: 8px;">
                        
                      </nav>
                    </div><!-- /.toolbar -->
                  </header>
                  <div id="collapse4" class="body">
                    <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
                      <thead>
                        <tr>
                        	<th>#</th>
                        	<th>Actividad</th>
                            <th>Cliente</th>
                            <th>Participantes</th>
                            <th>Fecha</th>
                            <th>Estado</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    <c:forEach items="${listadoDeReservas}" var="reserva">
                        <tr class="<c:if test="${ not empty ultimoid && ultimoid==reserva.idReserva }">success</c:if>">
                            <td>${reserva.idReserva}</td>
                            <c:set var="nombre" value="${mapActividades[reserva.idActividad]}" />
                            <td>${nombre}</td>
                            <td>${reserva.nombreCliente}</td>
                            <td>${reserva.numParticipantes}</td>
                            <c:set var="fecha" value="${reserva.fechaActividad}" />
                            <td><fmt:formatDate type="date" value="${fecha}"  /></td>
                            <c:choose>
                            <c:when test="${reserva.estado == 'PENDIENTE'}">
                            <td><span class="label label-warning">&nbsp;&nbsp;${reserva.estado}&nbsp;&nbsp;</span></td>
                            <td>
                            <a href="${pageContext.request.contextPath}/admin1234/reservas/actualizaReserva/aceptar/${reserva.idReserva}.html" class="btn btn-success btn-sm" ><i class="fa fa-pencil-square-o "></i>&nbsp;Aceptar</a>
                            <a href="${pageContext.request.contextPath}/admin1234/reservas//rechazar/${reserva.idReserva}.html" class="btn btn-danger btn-sm" ><i class="fa fa-trash-o " ></i>&nbsp;Rechazar</a>
                            </td>
                            </c:when>
                            <c:when test="${reserva.estado == 'ACEPTADA'}">
                            	<c:choose>
                            	<c:when test="${fecha.time > fechaactual.time}">
                            	<td><span class="label label-success">&nbsp;&nbsp;${reserva.estado}&nbsp;</span></td>
                            	<td>
                            	<a href="${pageContext.request.contextPath}/admin1234/reservas/actualizaReserva/editar/${reserva.idReserva}.html" class="btn btn-warning btn-sm" ><i class="fa fa-pencil-square-o ">&nbsp;</i>&nbsp;Editar&nbsp;&nbsp;</a>
                            	<a href="${pageContext.request.contextPath}/admin1234/reservas/rechazar/${reserva.idReserva}.html" class="btn btn-danger btn-sm" ><i class="fa fa-trash-o " ></i>&nbsp;Rechazar</a>
                            	</td>
                            	</c:when>
                            	<c:otherwise>
       							<td><span class="label label-success">&nbsp;&nbsp;${reserva.estado}&nbsp;</span></td>
                            	<td>
                            	<a href="${pageContext.request.contextPath}/admin1234/reservas/actualizaReserva/ver/${reserva.idReserva}.html" class="btn btn-info btn-sm" ><i class="fa fa-pencil-square-o "></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ver&nbsp;&nbsp;&nbsp;&nbsp;</a>
                            	</td>
    						</c:otherwise>
                            	</c:choose>
                            </c:when>
                            <c:otherwise>
       						<td><span class="label label-danger">${reserva.estado}</span></td>
                            <td>
                            <a href="${pageContext.request.contextPath}/admin1234/reservas/actualizaReserva/ver/${reserva.idReserva}.html" class="btn btn-info btn-sm" ><i class="fa fa-pencil-square-o "></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ver&nbsp;&nbsp;&nbsp;&nbsp;</a>
                            <a href="${pageContext.request.contextPath}/admin1234/reservas/actualizaReserva/editar/${reserva.idReserva}.html" class="btn btn-warning btn-sm" ><i class="fa fa-pencil-square-o ">&nbsp;</i>&nbsp;&nbsp;&nbsp;Editar&nbsp;&nbsp;&nbsp;</a>
                            </td>
    						</c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
                    
                        
                       </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div><!-- /.row -->
            
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
      <p>2015 &copy; Project GAGA team</p>
    </footer><!-- /#footer -->

    <!-- #helpModal -->
    <div id="helpModal" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Modal title</h4>
          </div>
          <div class="modal-body">
            <p>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor
              in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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

    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/dataTables.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.tablesorter.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.ui.touch-punch.min.js"></script>

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


		$(document).ready(function(){
	
			var contexto = "${pageContext.request.contextPath}";
			
			var meses=${reservasMes};
	    	var data = [ ["Enero", meses[0]], ["Febrero", meses[1]], ["Marzo", meses[2]], ["Abril", meses[3]], ["Mayo", meses[4]], ["Junio", meses[5]], ["Julio", meses[6]],
	        ["Agosto", meses[7]], ["Septiembre", meses[8]], ["Octubre", meses[9]], ["Noviembre", meses[10]], ["Diciembre", meses[11]]];
	    	
	    	
	        $.plot("#bar", [ data ],  
			{
				series: {
					bars: {
						show: true,
						barWidth: 0.6,
						align: "center"
					},
				label: "Reservas por mes"
	        
				},
				xaxis: {
					mode: "categories",
					tickLength: 0
				}
				
			}
		);
          
          console.log("arrancado");
        });
        
        $('#botonnCSV').click(function(){
 	        var data = [[1,1]];//${listaTotalReservas};
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