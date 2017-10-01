<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>视频后台管理系统</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

</head>
<body>



	<div class="container">
		<h1>视频管理系统</h1>

		<div id="tabs">
			<ul class="nav nav-tabs" role="tablist">

				<li role="presentation" class="active">
					<a href="#videoManage" aria-controls="home" role="tab" data-toggle="tab">视频管理</a>
				</li>
				<li role="presentation">
					<a href="#speakerManage" aria-controls="profile" role="tab" data-toggle="tab">主讲人管理</a>
				</li>
				<li role="presentation">
					<a href="#CourseManage" aria-controls="messages" role="tab" data-toggle="tab">课程管理</a>
				</li>
			</ul>

			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="videoManage">
					<br />
					<span style="font-size: 25px;">视频管理</span>
					&emsp;
					<button type="button" class="btn btn-info" id="insertVideo" data-toggle="modal" data-target="#insertVideoModal">添加</button>
					<button type="button" class="btn btn-info" id="deleteVideos" onclick="deleteVideos()">批量删除</button>

					<!-- 查询视频 -->

					<div class="text-right">
						<input step="text" style="width: 200px;" placeholder="请输入视频标题" id="videoName">
						<select class="selectSpeaker" id="findBySpeaker" style="width: 150px; height: 26px;">
							<option value="">请选择主讲人</option>
						</select>
						<select class="selectCourse" id="findByCourse" style="width: 150px; height: 26px;">
							<option value="">请选择课程名</option>
						</select>
						<button type="submit" class="btn btn-primary" onclick="selectVideo(1)">查询</button>
					</div>



					<form>
						<table class="table table-hover table-bordered" id="videos">
							<tr>
								<th></th>
								<th>序号</th>
								<th>名称</th>
								<th>介绍</th>
								<th>讲师</th>
								<th>时长</th>
								<th>播放次数</th>
								<th>编辑</th>
								<th>删除</th>
							</tr>
						</table>
					</form>

					<!-- 页码 -->
					<div class="col-md-12  text-right">
						<nav aria-label="Page navigation">
							<ul class="pagination" style="text-align: center;" id="pageManage">

							</ul>
						</nav>
					</div>

				</div>

				<!-- --------------------------------------------------------------------------主讲人 -->
				<div role="tabpanel" class="tab-pane" id="speakerManage">
					<br />
					<span style="font-size: 25px;">主讲人管理</span>
					<button type="button" class="btn btn-info" id="insertVideo" data-toggle="modal" data-target="#insertSpeakerModal">添加</button>
					<table class="table table-hover table-bordered" id="speakers">
						<tr>
							<th>序号</th>
							<th>名称</th>
							<th>职位</th>
							<th>简介</th>
							<th>编辑</th>
							<th>删除</th>
						</tr>
					</table>
				</div>

				<!-- --------------------------------------------------------------------------课程 -->

				<div role="tabpanel" class="tab-pane" id="CourseManage">
					<br>
					<span style="font-size: 25px;">课程管理</span>
					<button type="button" class="btn btn-info" id="insertCourse" data-toggle="modal" data-target="#insertCourseModal">添加</button>

					<table class="table table-hover table-bordered" id="courses">
						<tr>
							<th>序号</th>
							<th>标题</th>
							<th>简介</th>
							<th>编辑</th>
							<th>删除</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>



	<!-- 增加视频弹窗 -->
	<div class="modal fade" id="insertVideoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">添加视频信息</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="control-label">视频标题</label>
							<input type="text" class="form-control" id="name">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">主讲人</label>
							<select id="speakerId" class="form-control selectSpeaker">
								<option value="">请选择主讲人</option>
							</select>
						</div>

						<div class="form-group">
							<label for="recipient-name" class="control-label">所属课程</label>
							<select id="courseId" class="form-control selectCourse">
								<option value="">请选择所属课程</option>
							</select>
						</div>

						<div class="form-group">
							<label for="recipient-name" class="control-label">视频时长（秒）</label>
							<input type="number" class="form-control" id="length">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">封面图片地址</label>
							<input type="text" class="form-control" id="coverUrl">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">视频播放地址</label>
							<input type="text" class="form-control" id="videoUrl">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">备注</label>
							<textarea class="form-control" rows="3" id="describe"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary" onclick="saveVideo()">添加</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改视频信息弹窗 -->
	<div class="modal fade" id="updateVideoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">修改视频信息</h4>
				</div>
				<div class="modal-body">
					<form>
						<input type="hidden" id="updateVideoId">
						<div class="form-group">
							<label for="recipient-name" class="control-label">视频标题</label>
							<input type="text" class="form-control" id="updateName">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">主讲人</label>
							<select id="updateVideoSpeakerId" class="form-control selectSpeaker">
							</select>
						</div>

						<div class="form-group">
							<label for="recipient-name" class="control-label">所属课程</label>
							<select id="updateVideoCourseId" class="form-control selectCourse">
							</select>
						</div>

						<div class="form-group">
							<label for="recipient-name" class="control-label">视频时长（秒）</label>
							<input type="number" class="form-control" id="updateLength">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">封面图片地址</label>
							<input type="text" class="form-control" id="updateCoverUrl">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">视频播放地址</label>
							<input type="text" class="form-control" id="updateVideoUrl">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">备注</label>
							<textarea class="form-control" rows="3" id="updateDescribe"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary" onclick="updateVideo()">修改</button>
				</div>
			</div>
		</div>
	</div>


	<!-- ---------------------------------------------------------主讲人增加 -->
	<!-- 增加主讲人弹窗 -->
	<div class="modal fade" id="insertSpeakerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">添加主讲人信息</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="control-label">姓名</label>
							<input type="text" class="form-control" id="insertSpeakerName">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">职位</label>
							<input type="text" class="form-control" id="insertSpeakerPosition">
						</div>

						<div class="form-group">
							<label for="recipient-name" class="control-label">头像地址</label>
							<input type="text" class="form-control" id="insertSpeakerImage">
						</div>

						<div class="form-group">
							<label for="recipient-name" class="control-label">简介</label>
							<input type="text" class="form-control" id="insertSpeakerDescribe">
						</div>


					</form>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary" onclick="saveSpeaker()">添加</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 编辑主讲人弹窗 -->
	<div class="modal fade" id="updateSpeakerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">编辑主讲人信息</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" id="updateSpeakerId">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="control-label">姓名</label>
							<input type="text" class="form-control" id="updateSpeakerName">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">职位</label>
							<input type="text" class="form-control" id="updateSpeakerPosition">
						</div>

						<div class="form-group">
							<label for="recipient-name" class="control-label">头像地址</label>
							<input type="text" class="form-control" id="updateSpeakerImage">
						</div>

						<div class="form-group">
							<label for="recipient-name" class="control-label">简介</label>
							<input type="text" class="form-control" id="updateSpeakerDescribe">
						</div>


					</form>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary" onclick="updateSpeaker()">更新</button>
				</div>
			</div>
		</div>
	</div>





	<!-- ---------------------------------------------课程 -->
	<!-- ---------------------增加课程 -->
	<div class="modal fade" id="insertCourseModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">增加课程信息</h4>
				</div>
				<div class="modal-body">
					<form>

						<div class="form-group">
							<label for="message-text" class="control-label">所属学科</label>
							<select id="subjectId" class="form-control selectSubject">
								<option value="">请选择学科</option>
							</select>
						</div>

						<div class="form-group">
							<label for="recipient-name" class="control-label">标题</label>
							<input type="text" class="form-control" id="insertCourseName">
						</div>

						<div class="form-group">
							<label for="recipient-name" class="control-label">简介</label>
							<textarea class="form-control" rows="3" id="insertCourseDescribe"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary" onclick="saveCourse()">添加</button>
				</div>
			</div>
		</div>
	</div>

	<!-- --------------------------------------------编辑课程 -->
	<div class="modal fade" id="updateCourseModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">修改课程信息</h4>
				</div>
				<div class="modal-body">
					<form>
						<input type="hidden" id="updateCourseId">

						<div class="form-group">
							<label for="message-text" class="control-label">所属学科</label>
							<select id="updateSubject" class="form-control selectSubject">
							</select>
						</div>

						<div class="form-group">
							<label for="recipient-name" class="control-label">标题</label>
							<input type="text" class="form-control" id="updateCourseName">
						</div>

						<div class="form-group">
							<label for="recipient-name" class="control-label">简介</label>
							<textarea class="form-control" rows="3" id="updateCourseDescribe"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary" onclick="updateCourse()">更新</button>
				</div>
			</div>
		</div>
	</div>


	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script type="text/javascript">
		//获得所有数据
		var videos = null;
		var speakers = null;
		var courses = null;

		$(document).ready(function() {

			loadVideo(1);
			loadSpeaker();
			loadCourse();
			loadSubject();
			getCount("loadVideo"); // 加载页码
		})
		///拼装页码
		function getCount(methodName, videoTitle, videoSpeaker, videoSource) {

			$.ajax({
						type : 'POST',

						url : 'http://localhost:8080/video/video/count',

						async : true,

						contentType : 'application/json',

						data : JSON.stringify({

							"videoTitle" : videoTitle,
							"videoSpeaker" : videoSpeaker,
							"videoSource" : videoSource

						}),

						dataType : 'json',

						success : function(data) {

							count = (data + 9) / 10;

							$("#pageManage")
									.append(
											"<li><a href='#' aria-label='Previous' ><span aria-hidden='true'>&laquo;</span></a></li>")

							for (var i = 1; i <= count; i++) {
								$("#pageManage").append(
										"<li><span onclick='" + methodName
												+ "(" + i + ")'>" + i
												+ "</span></li>")
							}

							$("#pageManage")
									.append(
											"<li><a href='#' aria-label='Next'> <span aria-hidden='true'>&raquo;</span></a></li>")

						},

						error : function(msg) {
							alert(JSON.stringify(msg));
						}
					});

		}

		// video列表
		function loadVideo(pageNum) {

			stantIndex = (pageNum - 1) * 10;

			$.ajax({
						type : 'POST',

						url : 'http://localhost:8080/video/video/list',

						async : true,

						contentType : 'application/json',

						data : JSON.stringify({

							"page" : stantIndex

						}),

						dataType : 'json',

						success : function(data) {

							videos = data;

							$("#videos tr:not(:first)").empty("");

							$.each(
											data,
											function(index, obj) {
												$("#videos")
														.append(
																"<tr><td><input type='checkbox' onclick='clickCheckbox()' name='deleteVideoId' value='"
																		+ obj.id
																		+ "'></td><td>"
																		+ (index + 1)
																		+ "</td><td>"
																		+ obj.name
																		+ "</td><td>"
																		+ obj.describe
																				.substring(
																						0,
																						25)
																		+ "...</td><td>"
																		+ obj.speakerName
																		+ "</td><td>"
																		+ obj.length
																		+ "</td><td>"
																		+ obj.playCount
																		+ "</td><td><a class='glyphicon glyphicon-edit' aria-hidden='true' onclick='fullInVideo("
																		+ index
																		+ ")'></a>"
																		+ "</td><td><a class='glyphicon glyphicon-trash' aria-hidden='true' onclick='deleteVideo("
																		+ obj.id
																		+ ")'></a>"
																		+ "</td></tr>")
											})

						},

						error : function(msg) {
							alert(JSON.stringify(msg));
						}
					});
		}

		// 主讲人列表
		function loadSpeaker() {
			$.ajax({
						type : 'POST',

						url : 'http://localhost:8080/video/speaker/list',

						async : true,

						contentType : 'application/json',

						data : JSON.stringify({
							"speakerName" : '',
							"speakerPosition" : ''

						}),

						dataType : 'json',

						success : function(data) {

							speakers = data;

							$
									.each(
											data,
											function(index, obj) {
												$("#speakers")
														.append(
																"<tr><td>"
																		+ (index + 1)
																		+ "</td><td>"
																		+ obj.name
																		+ "</td><td>"
																		+ obj.position
																		+ "</td><td>"
																		+ obj.describe
																				.substring(
																						0,
																						25)
																		+ "...</td><td><a class='glyphicon glyphicon-edit' aria-hidden='true' onclick='fullInSpeaker("
																		+ index
																		+ ")' ></a>"
																		+ "</td><td><a class='glyphicon glyphicon-trash' aria-hidden='true' onclick='deleteSpeaker("
																		+ obj.id
																		+ ")'></a>"
																		+ "</td></tr>")

											})
							// video的搜索，需要主讲人的姓名的select
							$.each(data, function(index, obj) {
								$(".selectSpeaker").append(
										"<option value='"+obj.id+"' >"
												+ obj.name + "</option>");
							})

						},

						error : function(msg) {
							alert(JSON.stringify(msg));
						}
					});
		}

		//课程列表
		function loadCourse() {
			$.ajax({
						type : 'GET',

						url : 'http://localhost:8080/video/course/list',

						async : true,

						success : function(data) {

							courses = data;

							$
									.each(
											data,
											function(index, obj) {
												$("#courses")
														.append(
																"<tr><td>"
																		+ (index + 1)
																		+ "</td><td>"
																		+ obj.name
																		+ "</td><td>"
																		+ obj.describe
																				.substring(
																						0,
																						25)
																		+ "...</td><td><a class='glyphicon glyphicon-edit' aria-hidden='true' onclick='fullInCourse("
																		+ index
																		+ ")'></a>"
																		+ "</td><td><a class='glyphicon glyphicon-trash' aria-hidden='true'onclick='deleteCourse("
																		+ obj.id
																		+ ")'></a>"
																		+ "</td></tr>")
											})

							// video的搜索，需要课程的名字的select
							$.each(data, function(index, obj) {
								$(".selectCourse").append(
										"<option value='"+obj.id+"' >"
												+ obj.name + "</option>");
							})
						},

						error : function(msg) {
							alert(JSON.stringify(msg));
						}
					});
		}

		//学科列表
		function loadSubject() {
			$.ajax({
				type : 'GET',

				url : 'http://localhost:8080/video/subject/list',

				async : true,

				success : function(data) {

					// video的搜索，需要课程的名字的select
					$.each(data, function(index, obj) {
						$(".selectSubject").append(
								"<option value='"+obj.id+"' >" + obj.name
										+ "</option>");
					})
				},

				error : function(msg) {
					alert(JSON.stringify(msg));
				}
			});
		}

		// 查找视频
		function selectVideo(pageNum) {

			$.ajax({
						type : 'POST',

						url : 'http://localhost:8080/video/video/list',

						async : true,

						contentType : 'application/json',

						data : JSON.stringify({

							"page" : pageNum,
							"videoTitle" : $("#videoName").val(),
							"videoSpeaker" : $("#findBySpeaker").val(),
							"videoSource" : $("#findByCourse").val()

						}),

						dataType : 'json',

						success : function(data) {
							//先清除table， 再填充
							$("#videos tr:not(:first)").empty("");

							videos = data;

							$
									.each(
											data,
											function(index, obj) {
												$("#videos")
														.append(
																"<tr><td><input type='checkbox' onclick='clickCheckbox()' name='deleteVideoId' value='"
																		+ obj.id
																		+ "'></td><td>"
																		+ (index + 1)
																		+ "</td><td>"
																		+ obj.name
																		+ "</td><td>"
																		+ obj.describe
																				.substring(
																						0,
																						25)
																		+ "...</td><td>"
																		+ obj.speakerName
																		+ "</td><td>"
																		+ obj.length
																		+ "</td><td>"
																		+ obj.playCount
																		+ "</td><td><a class='glyphicon glyphicon-edit' aria-hidden='true' onclick='fullInVideo("
																		+ index
																		+ ")'></a>"
																		+ "</td><td><a class='glyphicon glyphicon-trash' aria-hidden='true' onclick='deleteVideo("
																		+ obj.id
																		+ ")'></a>"
																		+ "</td></tr>")
											})
							/////////////查找的页码////////////////////////////////////////////////////////
							$("#pageManage").empty("");
							getCount("selectVideo", $("#videoName").val(), $(
									"#findBySpeaker").val(), $("#findByCourse")
									.val());

						},

						error : function(msg) {
							alert(JSON.stringify(msg));
						}
					});
		}

		//增加视频
		function saveVideo() {
			$.ajax({
						type : 'POST',

						url : 'http://localhost:8080/video/video/save',

						async : true,

						contentType : 'application/json',

						data : JSON.stringify({
							"name" : $("#name").val(),
							"describe" : $("#describe").val(),
							"length" : $("#length").val(),
							"coverUrl" : $("#coverUrl").val(),
							"videoUrl" : $("#videoUrl").val(),
							"speakerId" : $("#speakerId").val(),
							"courseId" : $("#courseId").val()

						}),

						dataType : 'json',

						success : function(data) {
							$("#insertVideoModal").modal('hide');
							alert(JSON.stringify(data.message));
							// 向页面填充数据
							$("#videos")
									.append(
											"<tr><td><input type='checkbox' name='deleteVideoId' value='"+data.data.id+"'></td><td>"
													+ $('#videos tr').length
													+ "</td><td>"
													+ data.data.name
													+ "</td><td>"
													+ data.data.describe
															.substring(0, 25)
													+ "...</td><td>"
													+ $(
															"select[name=#speakerId] option[selected]")
															.text()
													+ "</td><td>"
													+ data.data.length
													+ "</td><td>"
													+ data.data.playCount
													+ /////////////////////增加的无法编辑/////////////////////////////
													"</td><td><a class='glyphicon glyphicon-edit' aria-hidden='true'></a>"
													+ "</td><td><a class='glyphicon glyphicon-trash' aria-hidden='true' onclick='deleteVideo("
													+ data.data.id
													+ ")'></a>"
													+ "</td></tr>")

						},

						error : function(msg) {
							alert(JSON.stringify(msg));
						}
					});
		}

		//删除批量video
		function deleteVideos() {

			var chk_value = new Array();

			$('input[name="deleteVideoId"]:checked').each(function() {
				chk_value.push($(this).val());
			});
			if (chk_value.length == 0) {
				alert('你还没有选择任何内容！');
				return;
			}

			$.ajax({
				type : 'DELETE',

				url : 'http://localhost:8080/video/video/remove',

				async : true,

				contentType : 'application/json',

				data : JSON.stringify({

					"id" : chk_value

				}),

				dataType : 'json',

				success : function(data) {

					//清空
					$("#videos tr:not(:first)").empty("");
					$("#pageManage").empty(""); // 清除某个标签
					// 填充///////////////////////////////删除选中的行////////////////////////////////////
					$("#deleteVideos").html("批量删除");
					$("#deleteVideos").attr("disabled", "disabled"); //失去能力
					loadVideo();
					getCount("loadVideo");
				},

				error : function(msg) {
					alert(JSON.stringify(msg));
				}
			});
		}

		// 动态获取选中数
		function clickCheckbox() {

			var inputs = $('input[name="deleteVideoId"]:checked');

			var length = inputs.length;

			if (length == 0) {
				// 不能被选中
				$("#deleteVideos").html("批量删除");
				$("#deleteVideos").attr("disabled", "disabled");
			} else {
				$("#deleteVideos").html("批量删除（" + length + "）");
				$("#deleteVideos").removeAttr("disabled");
			}
		}

		//删除video
		function deleteVideo(id) {

			var chk_value = new Array();

			chk_value.push(id);

			$.ajax({
				type : 'DELETE',

				url : 'http://localhost:8080/video/video/remove',

				async : true,

				contentType : 'application/json',

				data : JSON.stringify({

					"id" : chk_value

				}),

				dataType : 'json',

				success : function(data) {
					//清空
					$("#videos tr:not(:first)").empty("");
					$("#pageManage").empty("");
					// 填充,////////////////////////////////////////删除指定的行/////////////////////////////////////////////////
					$("#deleteVideos").html("批量删除");
					$("#deleteVideos").attr("disabled", "disabled");
					loadVideo();
					getCount("loadVideo");
				},

				error : function(msg) {
					alert(JSON.stringify(msg));
				}
			});
		}

		//给更新视频信息，填充信息
		function fullInVideo(index) {
			var video = videos[index];

			//唤醒弹窗
			$("#updateVideoModal").modal({});
			// 给弹窗赋值
			$("#updateSpeakerId").val(video.id);
			$("#updateName").val(video.name);

			$("#updateVideoSpeakerId option").each(function() {

				if ($(this).text() == video.speakerName) {

					$(this).attr("selected", "selected");
				} else {

					$(this).removeAttr("selected", "selected");
				}
			});

			$("#updateVideoCourseId option").each(function() {

				if ($(this).text() == video.courseName) {

					$(this).attr("selected", "selected");
				} else {

					$(this).removeAttr("selected", "selected");
				}

			});

			$("#updateLength").val(video.length);
			$("#updateCoverUrl").val(video.coverUrl);
			$("#updateVideoUrl").val(video.videoUrl);
			$("#updateDescribe").val(video.describe);

		}

		// 更新视频信息
		function updateVideo() {
			$.ajax({
				type : 'PUT',

				url : 'http://localhost:8080/video/video/update',

				async : true,

				contentType : 'application/json',

				data : JSON.stringify({
					"id" : $("#updateVideoId").val(),
					"name" : $("#updateName").val(),
					"describe" : $("#updateDescribe").val(),
					"length" : $("#updateLength").val(),
					"coverUrl" : $("#updateCoverUrl").val(),
					"videoUrl" : $("#updateVideoUrl").val(),
					"speakerId" : $("#updateSpeakerId").val(),
					"courseId" : $("#updateCourseId").val()

				}),

				dataType : 'json',

				success : function(data) {
					$("#updateVideoModal").modal('hide');
					alert(JSON.stringify(data.message));
					// ////////////////////////////////////////////////////修改指定行的内容-//////////////////////////////////////
					$("#videos tr:not(:first)").empty("");
					loadVideo();

				},

				error : function(msg) {
					alert(JSON.stringify(msg));
				}
			});
		}

		//////////////////////////////////主讲人
		//增加主讲人
		function saveSpeaker() {
			$.ajax({
						type : 'POST',

						url : 'http://localhost:8080/video/speaker/save',

						async : true,

						contentType : 'application/json',

						data : JSON.stringify({
							"name" : $("#insertSpeakerName").val(),
							"describe" : $("#insertSpeakerDescribe").val(),
							"position" : $("#insertSpeakerPosition").val(),
							"imageUrl" : $("#insertSpeakerImage").val()
						}),

						dataType : 'json',

						success : function(data) {
							$("#insertSpeakerModal").modal('hide');
							// 向页面填充数据--------------------------------------------------------
							$("#speakers")
									.append(
											"<tr><td>"
													+ ($("#speakers tr").length)
													+ "</td><td>"
													+ data.data.name
													+ "</td><td>"
													+ data.data.position
													+ "</td><td>"
													+ data.data.describe
															.substring(0, 25)
													+ ///////////////////////////////////增加的东西无法编辑///////////////////
													"...</td><td><a class='glyphicon glyphicon-edit' aria-hidden='true' ></a>"
													+ "</td><td><a class='glyphicon glyphicon-trash' aria-hidden='true' onclick='deleteSpeaker("
													+ data.data.id + ")'></a>"
													+ "</td></tr>")
						},

						error : function(msg) {
							alert(JSON.stringify(msg));
						}
					});
		}

		//删除主讲人
		function deleteSpeaker(id) {

			$.ajax({
				type : 'DELETE',

				url : 'http://localhost:8080/video/speaker/remove',

				async : true,

				contentType : 'application/json',

				data : JSON.stringify({

					"id" : id

				}),

				dataType : 'json',

				success : function(data) {
					//清空
					$("#speakers tr:not(:first)").empty("");
					// 填充,//////////////////////////删除指定的行////////////////////////////////////////////////
					loadSpeaker();
				},

				error : function(msg) {
					alert(JSON.stringify(msg));
				}
			});
		}

		$('#tabs a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		})

		//给更新  主讲人 信息，填充信息
		function fullInSpeaker(index) {
			var speaker = speakers[index];

			//唤醒弹窗
			$("#updateSpeakerModal").modal({});
			// 给弹窗赋值
			$("#updateSpeakerId").val(speaker.id);
			$("#updateSpeakerName").val(speaker.name);
			$("#updateSpeakerPosition").val(speaker.position);
			$("#updateSpeakerImage").val(speaker.imageUrl);
			$("#updateSpeakerDescribe").val(speaker.describe);

		}

		// 更新主讲人
		function updateSpeaker() {
			$.ajax({
				type : 'PUT',

				url : 'http://localhost:8080/video/speaker/update',

				async : true,

				contentType : 'application/json',

				data : JSON.stringify({
					"id" : $("#updateSpeakerId").val(),
					"name" : $("#updateSpeakerName").val(),
					"describe" : $("#updateSpeakerDescribe").val(),
					"position" : $("#updateSpeakerPosition").val(),
					"imageUrl" : $("#updateSpeakerImage").val()
				}),

				dataType : 'json',

				success : function(data) {
					$("#updateSpeakerModal").modal('hide');
					//////////////////////////////////// 修改指定行的数据/////////////////////////////////
					alert(data.message);
					$("#speakers tr:not(:first)").empty("");
					loadCourse();
				},

				error : function(msg) {
					alert(JSON.stringify(msg));
				}
			});
		}

		//---------------------------------------增加课程
		function saveCourse() {
			$.ajax({
						type : 'POST',

						url : 'http://localhost:8080/video/course/save',

						async : true,

						contentType : 'application/json',

						data : JSON.stringify({
							"subjectId" : $("#subjectId").val(),
							"describe" : $("#insertCourseDescribe").val(),
							"name" : $("#insertCourseName").val(),
						}),

						dataType : 'json',

						success : function(data) {
							$("#insertCourseModal").modal('hide');
							// 向页面填充数据--------------------------------------------------------
							$("#courses")
									.append(
											"<tr><td>"
													+ ($("#courses tr").length)
													+ "</td><td>"
													+ data.data.name
													+ "</td><td>"
													+ data.data.describe
															.substring(0, 25)
													+ ///////////////////////刚增加的无法编辑////////////////////////////////
													"...</td><td><a class='glyphicon glyphicon-edit' aria-hidden='true' onclick='fullInCourse("
													+ ($('#courses tr').length - 1)
													+ ")'></a></td><td><a class='glyphicon glyphicon-trash' aria-hidden='true' onclick='deleteCourse("
													+ data.data.id + ")'></a>"
													+ "</td></tr>")
						},

						error : function(msg) {
							alert(JSON.stringify(msg));
						}
					});
		}

		//删除课程
		function deleteCourse(id) {
			$.ajax({
				type : 'DELETE',

				url : 'http://localhost:8080/video/course/remove',

				async : true,

				contentType : 'application/json',

				data : JSON.stringify({

					"id" : id

				}),

				dataType : 'json',

				success : function(data) {
					//清空
					$("#courses tr:not(:first)").empty("");
					// 填充,/////////////////////////////删除指定的行/////////////////////////////////
					loadCourse();
				},

				error : function(msg) {
					alert(JSON.stringify(msg));
				}
			});

		}

		//给更新的课程填充信息
		function fullInCourse(index) {
			var course = courses[index];

			//唤醒弹窗
			$("#updateCourseModal").modal({});
			// 给弹窗赋值
			$("#updateCourseId").val(course.id);
			$("#updateCourseName").val(course.name);
			$("#updateCourseDescribe").val(course.describe);

			$("#updateSubject option").each(function() {

				if ($(this).text() == course.subjectName) {

					$(this).attr("selected", "selected");
				} else {

					$(this).removeAttr("selected", "selected");
				}
			});

		}

		//更新课程
		function updateCourse() {
			$.ajax({
				type : 'PUT',

				url : 'http://localhost:8080/video/course/update',

				async : true,

				contentType : 'application/json',

				data : JSON.stringify({
					"id" : $("#updateCourseId").val(),
					"name" : $("#updateCourseName").val(),
					"describe" : $("#updateCourseDescribe").val(),
					"subjectId" : $("#updateSubject").val()
				}),

				dataType : 'json',

				success : function(data) {
					$("#updateCourseModal").modal('hide');
					// /////////////////////////////////////////修改指定行的数据--------------------------------------------------------
					alert(data.message);
					$("#courses tr:not(:first)").empty("");
					loadCourse();
				},

				error : function(msg) {
					alert(JSON.stringify(msg));
				}
			});
		}
	</script>
</body>
</html>