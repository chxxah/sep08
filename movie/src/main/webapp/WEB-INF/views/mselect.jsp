<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV::mselect</title>
<link rel="stylesheet" href="./css/mselect.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$(".movie_list_all").click(function(){
			let selectmovie = $(this).text();
			alert (selectmovie);
			
			
			$(".theater_list_all").on("click", function(){
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
								app += "<div class='theater_list_city'>" + scity + "</div>";
							}
							$(".theater_special_list").html(app);
							
							$(".theater_list_city").on("click", function(){
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
</head>
<body>
	<%@ include file="menu.jsp"%>
	<h1>예매</h1>
	<div class="mselect">
	
		<!-- 영화 선택 -->
		<div class="select_movie">
			<div class="select_title">영화</div>
			<div class="select_content">
				<div class="movie_all">전체</div>
				<div class="movie_list">
					<c:forEach begin="0" end="${fn:length(movielist) - 1}" var="row">
						<div class="movie_list_all">${movielist[row].mv_name}</div>
					</c:forEach>
				</div>
				
				<!-- 선택한 영화 -->
				<div class="movie_selected">
					<div class="selected_poster">사진</div>
					<div class="selected_info">
						<div class="selected_title">MOVIE</div>
						<div class="selected_movie">오펜하이머</div>
						<div class="selected_genre">스릴러,드라마</div>
						<div class="selected_grade">15세 관람가</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 극장 선택 -->
		<div class="select_theater">
			<div class="select_title">극장</div>
			<div class="select_content">
				<div class="theater_all">전체</div>
				<div class="theater_special">특별관</div>
				<div class = "theater_list">
					<c:forEach begin="0" end="${fn:length(theaterlist) - 1 }" var="row">
						<div class='theater_list_all'>${theaterlist[row].th_area}</div>
					</c:forEach>
				</div>
				<div class = "theater_special_list">
					<!-- 도시를 누르면 지역이 나옴 -->
				</div>
				
				<!-- 선택한 극장 -->
				<div class="theater_selected">
					<div class="selected_title">THEATER</div>
					<div class="selected_area">서울</div>
					<div class="selected_city">DREAMBOX 강남점</div>
				</div>
			</div>
		</div>
		
		<!-- 날짜 선택 -->
		
		
		<div>
		
		</div>
		
		
		
		<div>
			<button class="theaterselect">선택완료</button>
		</div>
	</div>
</body>
</html>