<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="devinette.model.Jeu"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Jeu De Devinette</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
	integrity="sha512-c42qTSw/wPZ3/5LBzD+Bw5f7bSF2oxou6wEb+I/lqeaKV5FDIfMvvRp772y4jcJLKuGUOpbJMdg/BTl50fJYAw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<%
	Jeu jouer;
	HttpSession s = request.getSession();
	jouer = (Jeu) s.getAttribute("partie");
	if (request.getParameter("nombre") != null) {
		jouer.getResultat(Integer.parseInt(request.getParameter("nombre")));
	}
	%>
	<div class="container-fluid text-center">
		<div class="col-lg-6 mx-auto" style="margin-top: 10%">
			<h4>Jouer au devinette</h4>
			<p>
				Deviner un nombre entre <strong>1</strong> et <strong>10</strong>
			</p>

			<c:choose>
				<c:when test="${partie.getStatus().equals(\"en cours\")}">
					<div class="card card-body">
						<form action="partie.path" method="post">
							<div class="input-group mb-4">
								<span class="input-group-text">Devinez le nombre !</span> <input
									type="number" min="1" max="10" name="nombre"
									class="form-control" required placeholder="Entre 1 et 10">
							</div>
							<div>
								<button type="submit" class="btn btn-primary">Jouer</button>
							</div>
						</form>
						<hr>
						<c:choose>
							<c:when test="${partie.getEssai() < 3}">
								<h6
									class="alert alert-warning animate__animated animate__fadeInRight">Raté
									il vous reste ${ partie.getEssai() } essais</h6>
							</c:when>
							<c:otherwise>
								<h6
									class="alert alert-warning animate__animated animate__fadeInRight">A
									vous de jouer ! Vous avez 3 essais.</h6>
							</c:otherwise>
						</c:choose>
					</div>
				</c:when>

				<c:when test="${partie.getStatus().equals(\"gagné\")}">
					<div class="card card-body">
						<h6
							class="alert alert-success animate__animated animate__rubberBand animate__repeat-2">Bravo
							vous avez gagné, le était bien ${ partie.getMistere() }</h6>
						<div align="center">
							<a href="rejouer.path" class="btn btn-secondary">Nouvelle
								partie</a>
						</div>
					</div>
				</c:when>
				<c:when test="${partie.getStatus().equals(\"perdu\")}">
					<div class="card card-body">
						<h6 class="alert alert-danger animate__animated animate__jello">Dommage
							vous avez perdu, la valeur secret a devine est : ${ partie.getMistere() }</h6>
						<div align="center">
							<a href="rejouer.path" class="btn btn-secondary">Nouvelle
								partie</a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div align="center">
						<a href="rejouer.path" class="btn btn-secondary">Nouvelle
							partie</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
</html>


