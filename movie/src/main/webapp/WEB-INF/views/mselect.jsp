<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV::mselect</title>
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$(".movielist").click(function(){
			let selectmovie = $(this).text();
			alert (selectmovie);
			
			
			$(".theaterlist").on("click", function(){
				let area = $(this).text();
				$.ajax({
					url: "./aa",
					type: "post",
					data: {selectmovie : selectmovie, area : area},
					dataType: "json",
					success: function(data){
							let app = '';
							let scity = '';
							for (let i = 0; i < data.city.length; i++) {
								scity = data.city[i].th_city;
								app += "<div class='selecity'>" + scity + "</div>";
							}
							$(".city").html(app);
							
							$(".theaterselect").on("click", function(){
								
							});
							$(".selecity").on("click", function(){
								let selecity = $(this).text();
								alert(selecity);
								let form = $('<form></form>');
								form.attr("action","./mselect");
								form.attr("method", "post");
								form.append($("<input>", {type:"hidden", name:"selecity", value : selecity}));
								form.appendTo(".selecity");
								form.submit();
							});
					},
					error: function(error){
						alert("!");
					}
				});
				
				

			});
		});
		
	});




</script>

<style type="text/css">
	.movie {
		float: left;	
	}
	
	.theater {
		float: left;	
	}
	.area, .city {
		float: left;	
	}
	
</style>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<h1>MSELECT</h1>
	<div>
		<div class="movie">
			<c:forEach begin="0" end="${fn:length(movielist) - 1}" var="row">
				<div class="movielist">${movielist[row].mv_name}</div>
			</c:forEach>
		</div>
	</div>
	<div class = "theater">
		<div class = "area">
			<c:forEach begin="0" end="${fn:length(theaterlist) - 1 }" var="row">
				<div class='theaterlist'>${theaterlist[row].th_area}</div>
			</c:forEach>
		</div>
		<div class="city">
			
		</div>
	
	</div>
	<div>
		<button class="theaterselect">선택완료</button>
	</div>
</body>
</html>