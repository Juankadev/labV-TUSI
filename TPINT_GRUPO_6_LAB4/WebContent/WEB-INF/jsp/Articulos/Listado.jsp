<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Articulos</title>
<!-- ContextPath setting in css, DO NOT TOUCH!!! -->
<style>
    :root {
        --contextPath: "${pageContext.request.contextPath}";
    }
</style>

<!-- STYLESHEETS -->
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap.css"/>'>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/articulos.css"/>'>
<link href="https://cdn.datatables.net/v/bs5/jq-3.6.0/dt-1.13.4/datatables.min.css" rel="stylesheet"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">

<!-- Enlace al archivo CSS de Font Awesome -->
<link rel="stylesheet" href='<c:url value="/resources/fontawesome/css/all.min.css"/>'>

<!-- Enlace opcional a los archivos de fuentes de Font Awesome -->
<link rel="stylesheet" href='<c:url value="/resources/fontawesome/webfonts/fa-brands-400.woff2"/>'>
<link rel="stylesheet" href='<c:url value="/resources/fontawesome/webfonts/fa-regular-400.woff2"/>'>
<link rel="stylesheet" href='<c:url value="/resources/fontawesome/webfonts/fa-solid-900.woff2"/>'>
<!-- Agrega los estilos CSS de Toastr -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">




<!-- scripts -->
<script type="text/javascript" src="https://cdn.datatables.net/v/bs5/jq-3.6.0/dt-1.13.4/datatables.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>




</head>
<body class="">


<jsp:include page="../components/Navbar.jsp"></jsp:include>
<main class="articulosBody d-flex justify-content-center align-items-center flex-column w-100" style="background-image: url('${pageContext.request.contextPath}/resources/img/home-background.jpg');">
	<section class="sectionTable">
	<div class="row justify-content-around">
		<h2>Articulos</h2>
		<p>${Mensaje}</p>
	</div>
	
	<!-- Action Modal -->
	<button type="button" class="btnNewArt " data-bs-toggle="modal" data-bs-target="#newArt">
  		Nuevo Articulo
	</button>
	
	
	<!-- INICIO DATATABLE -->
	<table id="tableArticulos" class="responsive table table-striped dataTables_wraper">
		<thead>
			<tr>
				<th>Nombre</th>
				<th>Descripcion</th>
				<th>Marca</th>
				<th>Tipo</th>
				<th>Precio</th>
				<th>Acciones</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${articulos}" var="item">
				<tr>
				<td>${item.nombre}</label> </td>
				<td>${item.descripcion}</td>
				<td>${item.marca}</td>
				<td>${item.tipo}</td>
				<td>${item.precio}</td>
				<td><button class="btnTableEdit" onclick='editOpen(${item.id})'><i class="fa-solid fa-pencil"></i></button><a style="text-style: none; color: red;" href="<c:url value='/articulos/eliminar/${item.id}' />"  ><i class="fa-solid fa-trash"></i></a></td>
				</tr>
			</c:forEach>
	    </tbody>
	</table>
	</section>
	<!-- END DATATABLE -->
	
	<!-- MODALS -->
	<!-- Modal NUEVO ARTICULO -->
		<div class="modal fade" id="newArt" tabindex="-1" aria-labelledby="newArtlabel" aria-hidden="true">
  			<div class="modal-dialog modal-lg">
    			<div class="modal-content">
      				<div class="modal-header">
        				<h5 class="modal-title" id="newArtlabel">Nuevo Articulo</h5>
        				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      				</div>
      				<div class="modal-body">
      					<form action="${pageContext.request.contextPath}/articulos/crear" method="POST">
      						<input type="hidden" id="estado" value="true" name="estado">
      						<div class="col-md-12">
      							<label class="form-label">Nombre</label>
      							<input id="nombre" type="text" name="nombre" class="form-control">
      						</div>
      						<div class="row">
      							<div class="col-md-6">
      								<label class="form-label">Descripcion</label>
      								<input id="descripcion" type="text" name="descripcion" class="form-control">
      							</div>
      							<div class="col-md-6">
      								<label class="form-label">Marca</label>
      								<input id="marca" type="text" name="marca" class="form-control">
      							</div>
      						</div>
      						<div class="row">
	      						<div class="col-md-6">
	      							<label class="form-label">Tipo</label>
	      							<input id="tipo" type="text" name="tipo" class="form-control">
	      						</div>
	      						<div class="col-md-6">
	      							<label class="form-label">Precio</label>
	      							<input id="precio" type="text" name="precio" class="form-control">
	      						</div>
      						</div>
      						<div class="mt-5">
		        				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        				<button type="submit" class="btn btn-primary">Save changes</button>
							</div>
      					</form>
    			</div>
  			</div>
		</div>
		</div>
		<!-- Modal EDITAR ARTICULO -->
		<div class="modal fade" id="editArt" tabindex="-1" aria-labelledby="editArtLabel" aria-hidden="true">
  			<div class="modal-dialog modal-lg">
    			<div class="modal-content">
      				<div class="modal-header">
        				<h5 class="modal-title" id="editArtLabel">Nuevo Articulo</h5>
        				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      				</div>
      				<div class="modal-body">
      					<form id="formEditar" action="${pageContext.request.contextPath}/articulos/editar" method="POST">
      						<input type="hidden" id="id" name="id">
      						<div class="col-md-12">
      							<label class="form-label">Nombre</label>
      							<input id="nombreEdit" type="text" name="nombre" class="form-control">
      						</div>
      						<div class="row">
      							<div class="col-md-6">
      								<label class="form-label">Descripcion</label>
      								<input id="descripcionEdit" type="text" name="descripcion" class="form-control">
      							</div>
      							<div class="col-md-6">
      								<label class="form-label">Marca</label>
      								<input id="marcaEdit" type="text" name="marca" class="form-control">
      							</div>
      						</div>
      						<div class="row">
	      						<div class="col-md-6">
	      							<label class="form-label">Tipo</label>
	      							<input id="tipoEdit" type="text" name="tipo" class="form-control">
	      						</div>
	      						<div class="col-md-6">
	      							<label class="form-label">Precio</label>
	      							<input id="precioEdit" type="text" name="precio" class="form-control">
	      						</div>
      						</div>
      						<div class="mt-5">
		        				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        				<button type="submit" class="btn btn-primary">Save changes</button>
							</div>
      					</form>
    			</div>
  			</div>
		</div>
		</div>
</main>	
<!-- SCRIPTS INIT -->
<script>
$(document).ready( function () {
    $('#tableArticulos').DataTable();
    
    
    $('#formEditar').on("submit", function(e){
        e.preventDefault();
        let action = e.target.getAttribute('action');
        let data = {
            id: Number($('#id').val()),
			nombre: $('#nombreEdit').val(),
			descripcion: $('#descripcionEdit').val(),
			marca: $('#marcaEdit').val(),
		    tipo: $('#tipoEdit').val(),
			precio: $('#precioEdit').val()
        }

        $.ajax({
            url: action,
            method: "POST",
            data,
            success: function(data){
                console.log(data);
                let res = JSON.parse(data);

                if(res.status == 'ok'){
                    mostrarNotificacionYRecargar(res.message + ". Refrescando sitio...");
                }
            },
            error: function(res, error) {
                console.log(res);
                console.log(error);
                mostrarNotificacionYRecargar(res.message + ". Refrescando sitio...");
            }
        })
	});
});


function editOpen(id){
	$.ajax({
		url: "${pageContext.request.contextPath}/articulos/getArticulo/"+id,
		method: "GET",
		success: function(json){
			let res = JSON.parse(json);
			console.log(res);
			$('#id').val(res.id);
			$('#nombreEdit').val(res.nombre);
			$('#descripcionEdit').val(res.descripcion);
			$('#marcaEdit').val(res.marca);
			$('#tipoEdit').val(res.tipo);
			$('#precioEdit').val(res.precio);
		},
		complete: function() {
			$('#editArt').modal('toggle');
		}
		
	})
}

function mostrarNotificacionYRecargar(mensaje) {
    // Configura la notificación Toastr
    toastr.options = {
        closeButton: true,
        progressBar: true,
        positionClass: "toast-top-right",
        timeOut: 2000 // Duración de la notificación en milisegundos (3 segundos en este caso)
    };

    // Muestra la notificación Toastr
    toastr.success(mensaje, "Éxito", {
        onHidden: function () {
            // Recarga la página después de que se cierre la notificación
            window.location.reload();
        }
    });
}
</script>
<c:if test="${not empty sessionScope.mensaje}">
    <%-- Configurar la notificación Toastr --%>
    <script>
    mostrarNotificacionYRecargar("${sessionScope.mensaje}")
    </script>

    <%-- Limpiar el mensaje de la sesión para que no se muestre nuevamente en futuras peticiones --%>
    <% session.removeAttribute("mensaje"); %>
</c:if>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

</body>

</html>