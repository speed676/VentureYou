<%@ page language="java" contentType="text/html; charset=latin1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="es" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="es">
<!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<title>NaturAdventure</title>
		<meta name="description" content="web AGG project">
		<meta name="author" content="AGG team">

<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- Favicon -->
		<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/logo.png">
		<meta name="theme-color" content="#7DB338">

		<!-- Web Fonts -->
		<link href="${pageContext.request.contextPath}/resources/css/fonts.css" rel='stylesheet' type='text/css'>
		<link href="${pageContext.request.contextPath}/resources/css/fonts2.css" rel='stylesheet' type='text/css'>

		<!-- Bootstrap core CSS -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet">

		<!-- Font Awesome CSS -->
		<link href="${pageContext.request.contextPath}/resources/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

		<!-- Plugins -->
		<link href="${pageContext.request.contextPath}/resources/css/animations.css" rel="stylesheet">

		<!-- Worthy core CSS file -->
		<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

		<!-- Custom css --> 
		<link href="${pageContext.request.contextPath}/resources/css/customPago.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/blueimp-gallery.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-image-gallery.min.css">
	</head>

	<body class="no-trans">
		<!-- scrollToTop -->
		<!-- ================ -->
		<div class="scrollToTop"><i class="icon-up-open-big"></i></div>

		<!-- header start -->
		<!-- ================ --> 
		<header class="header fixed clearfix navbar navbar-fixed-top">
			<div class="container">
				<div class="row">
					<div class="col-md-4">

						<!-- header-left start -->
						<!-- ================ -->
						<div class="header-left clearfix">

							<!-- logo -->
							<div class="logo smooth-scroll">
								<a href="#banner"><img id="logo" src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo"></a>
							</div>

							<!-- name-and-slogan -->
							<div class="site-name-and-slogan smooth-scroll">
								<div class="site-name"><a href="${pageContext.request.contextPath}/index.html">NaturAdventure</a></div>
								<div class="site-slogan">Disfruta la <a>naturaleza</a>. Vive la <a>aventura</a></div>
							</div>

						</div>
						<!-- header-left end -->

					</div>
					<div class="col-md-8">

						<!-- header-right start -->
						<!-- ================ -->
						<div class="header-right clearfix">

							<!-- main-navigation start -->
							<!-- ================ -->
							<div class="main-navigation animated">

								<!-- navbar start -->
								<!-- ================ -->
								<nav class="navbar navbar-default" role="navigation">
									<div class="container-fluid">

										<!-- Toggle get grouped for better mobile display -->
										<div class="navbar-header">
											<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
												<span class="sr-only">Navegación</span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
											</button>
										</div>

										<!-- Collect the nav links, forms, and other content for toggling -->
										<div class="collapse navbar-collapse scrollspy smooth-scroll" id="navbar-collapse-1">
											<ul class="nav navbar-nav navbar-right">
												<li class="active"><a href="${pageContext.request.contextPath}/index.html#inicio">Inicio</a></li>
												<li><a href="${pageContext.request.contextPath}/index.html#aventuras">Aventuras</a></li>
												<li><a href="${pageContext.request.contextPath}/index.html#quienes_somos">Quiénes somos</a></li>
												<li><a href="${pageContext.request.contextPath}/index.html#contacta">Contacta</a></li>
											</ul>
										</div>

									</div>
								</nav>
								<!-- navbar end -->

							</div>
							<!-- main-navigation end -->

						</div>
						<!-- header-right end -->

					</div>
				</div>
			</div>
		</header>
		<!-- header end -->


		<!--<div class="section">
			<div class="container">
				<div class="separator"></div>
			</div>
		</div>-->

		<br><br><br><br>

		<!-- section start -->
		<!-- ================ -->
		<div class="section clearfix object-visible" data-animation-effect="fadeIn">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="title text-center"><span>${tipo.tipo} </span></h1>
						<div class="space"></div>
						<div class="row">
							<div class="col-md-6" id="links">
							<a href="${pageContext.request.contextPath}/resources/images/${tipo.foto}" title="${tipo.tipo}" data-gallery>
						        <img src="${pageContext.request.contextPath}/resources/images/${tipo.foto}" alt="${tipo.tipo}">
						    	<a href="${pageContext.request.contextPath}/resources/images/${actividad.foto}" title="${actividad.nombre}" data-gallery></a>
							    
						    
						    </a>
								<div class="space"></div>
							</div>
							<div class="col-md-6">
								<p>${tipo.descripcion}</p>
						
								<h5>Requistos:</h5>
								<ul class="list-unstyled">
								<c:choose>
								    <c:when test="${not empty tipo.requisitos}">
								        	<li><i class="fa fa-caret-right pr-10 text-colored"></i> ${tipo.requisitos}</li>
								    </c:when>
								    <c:otherwise>
								        	<li><i class="fa fa-caret-right pr-10 text-colored"></i> Sin requisitos previos</li>
								    </c:otherwise>
								</c:choose>
								
								</ul>
							</div>
						</div>
		
						<div class="row">
							<div class="col-md-12">
								<h2><i class="fa fa-info-circle"></i> Datos de la reserva del cliente ${reserva.nombreCliente} </h2>
								
								<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								
    									
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="heading1">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
												 ${actividad.nombre} 
												</a>
											</h4>
										</div>
										<div id="collapse1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading1">
											<div class="panel-body">
												<ul class="list-unstyled">
																							
													<li><i class="fa fa-caret-right pr-10 text-colored"></i> ${actividad.descripcion} 
														<ul class="list-unstyled">
															<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right pr-10 text-colored"></i> Nivel de la actividad ${reserva.nivel}  </li>
															<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right pr-10 text-colored"></i> Duración de ${actividad.duracionHoras} horas  </li>
															<c:if test="${not empty actividad.localizacion}"> <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right pr-10 text-colored"></i>   <a href="${actividad.localizacion}">¿Donde está?</a> </li></c:if>
															<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right pr-10 text-colored"></i> Número de participantes ${reserva.numParticipantes}  </li>
															<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right pr-10 text-colored"></i> Horario de la actividad ${reserva.horaInicio}  </li>
															<c:set var="fechaActividad" value="${reserva.fechaActividad}" />
					                    					<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right pr-10 text-colored"></i> Fecha de la actividad <fmt:formatDate type="date" value="${fechaActividad}"  />  </li>
					                    					<c:set var="fechaReserva" value="${reserva.fechaReserva}" />
															<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right pr-10 text-colored"></i> Fecha de la reserva <fmt:formatDate type="date" value="${fechaReserva}"  />  </li>
															<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right pr-10 text-colored"></i> Contacto: telefono ${reserva.telefonoCliente} Email ${reserva.emailCliente} </li>
															<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-right pr-10 text-colored"></i> Precio total <fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="2" minFractionDigits="2" value="${precioiva}" /> &euro; </li>
														</ul>
													</li>
													
												
												</ul>
											</div>
										</div>
									</div> 
										
														
								</div>

							</div>
						</div>
					
						
						
					</div>
				</div>
			</div>
		</div>
		<!-- section end -->

			<!-- footer start -->
		<!-- ================ -->
		<footer id="footer">

			<!-- section start -->
			<!-- ================ -->
			<div class="default-bg space">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<p class="text-center">Copyright © 2015 by AGG - Team.</p>
						</div>
					</div>
				</div>
			</div>
			<!-- section end -->

		</footer>

		<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
<div id="blueimp-gallery" class="blueimp-gallery">
    <!-- The container for the modal slides -->
    <div class="slides"></div>
    <!-- Controls for the borderless lightbox -->
    <h3 class="title"></h3>
    <a class="prev">&laquo</a>
    <a class="next">&raquo;</a>
    <a class="close">Cerrar</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
    <!-- The modal dialog, which will be used to wrap the lightbox content -->
    <div class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body next"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left prev">
                        <i class="glyphicon glyphicon-chevron-left"></i>
                        Previous
                    </button>
                    <button type="button" class="btn btn-primary next">
                        Next
                        <i class="glyphicon glyphicon-chevron-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
		<!-- footer end -->

		<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
		<!-- Jquery and Bootstap core js files -->
		<script type="text/javascript">
		
			var contexto = "${pageContext.request.contextPath}";
		
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>

		<!-- Modernizr javascript -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/modernizr.js"></script>

		<!-- Isotope javascript -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/isotope/isotope.pkgd.min.js"></script>
		
		<!-- Backstretch javascript -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/jquery.backstretch.min.js"></script>

		<!-- Appear javascript -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/jquery.appear.js"></script>

		<!-- Initialization of Plugins -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/template.js"></script>

		<!-- Custom Scripts -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/customPago.js"></script>
<!--<script src="${pageContext.request.contextPath}/resources/js/bootstrap-image-gallery.js"></script>-->
		<script src="${pageContext.request.contextPath}/resources/js/jquery.blueimp-gallery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

	</body>
</html>
