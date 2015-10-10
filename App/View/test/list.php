<?php
$data = array(
'title' => 'Controller 边界',  //设置title变量为Welcome
);
View::tplInclude('Frame/header', $data);
?>



<body class="page-body">

<div class="page-container">



	  <div class="main-content">





			<h3 id="layout-variants">
				   Controller
				  <br />
				  <small>Controller的通用方法,对象,数据,视图等等! <a href="1">对象</a> <a href="3">方法</a> <a href="3">函数</a> <a href="3">底层数据</a> <a href="3">配置文件</a></small>
			</h3>


			<div class="row">
				  <div class="col-md-6">

						<div class="panel panel-default">
							  <div class="panel-heading">
									<h3 class="panel-title">对象</h3>
									<div class="panel-options">
										  <a href="#" data-toggle="panel">
												<span class="collapse-icon">&ndash;</span>
												<span class="expand-icon">+</span>
										  </a>
										  <a href="#" data-toggle="remove">
												&times;
										  </a>
									</div>
							  </div>

							  <div class="panel-body panel-border">
									<div class="row">
										  <div class="col-sm-12">

												<!-- Table Model 2 -->
												<strong>对象列表</strong>

												<table class="table table-model-2 table-hover">
													  <thead>
													  <tr>
															<th>#</th>
															<th>对象</th>
															<th>说明</th>
															<th>对象</th>
															<th>调用方法</th>

													  </tr>
													  </thead>

													  <tbody>
													  <tr>
															<td>3</td>
															<td>S</td>
															<td>容器</td>
															<td>$this->S</td>
															<td>内含对象 : </td>
													  </tr>
													  <tr>
															<td>1</td>
															<td>view</td>
															<td>视图</td>
															<td>$this->_view</td>
															<td>

															</td>

													  </tr>

													  
													  <tr>
															<td>2</td>
															<td>db</td>
															<td>数据库</td>
															<td>$this->db</td>
															<td></td>
													  </tr>
														
                                                        <tr>
													    <td>3</td>
													    <td>ST</td>
													    <td>&nbsp;</td>
													    <td>&nbsp;</td>
													    <td></td>
													    </tr>
                                                        
    <tr>
													    <td>4</td>
													    <td>rbac</td>
													    <td>&nbsp;</td>
													    <td>&nbsp;</td>
													    <td></td>
													    </tr>                                                        
                                                        
                                                        <tr>
                                                          <td>5</td>
                                                          <td>table</td>
                                                          <td>&nbsp;</td>
                                                          <td>&nbsp;</td>
                                                          <td></td>
                                                        </tr>
                                                        <tr>
                                                          <td>6</td>
                                                          <td>Model</td>
                                                          <td>&nbsp;</td>
                                                          <td>&nbsp;</td>
                                                          <td></td>
                                                        </tr>
                                                        <tr>
                                                          <td>7</td>
                                                          <td>request</td>
                                                          <td>&nbsp;</td>
                                                          <td>&nbsp;</td>
                                                          <td></td>
                                                        </tr>
                                                      </tbody>
												</table>

										  </div>
									</div>
							  </div>

						</div>

				  </div>

				  <div class="col-md-6">

						<div class="panel panel-default">
							  <div class="panel-heading">
									<h3 class="panel-title">通用的方法</h3>
									<div class="panel-options">
										  <a href="#" data-toggle="panel">
												<span class="collapse-icon">&ndash;</span>
												<span class="expand-icon">+</span>
										  </a>
										  <a href="#" data-toggle="remove">
												&times;
										  </a>
									</div>
							  </div>

							  <div class="panel-body panel-border">
									<div class="row">
										  <div class="col-sm-12">

												<!-- Table Model 2 -->
												<strong>Table Model 2</strong>

												<table class="table table-model-2 table-hover">
													  <thead>
													  <tr>
															<th>#</th>
															<th>对象</th>
															<th>说明</th>
													  </tr>
													  </thead>

													  <tbody>
													  <tr>
															<td>1</td>
															<td>display</td>
															<td></td>
													  </tr>

													  <tr>
															<td>2</td>
															<td>Redirect</td>
															<td></td>
													  </tr>

													  <tr>
													    <td>&nbsp;</td>
													    <td>getaccessRules</td>
													    <td></td>
													    </tr>
													  <tr>
													    <td>&nbsp;</td>
													    <td>G</td>
													    <td></td>
													    </tr>
													  <tr>
													    <td>&nbsp;</td>
													    <td>behaviors</td>
													    <td></td>
													    </tr>
													  <tr>
													    <td>&nbsp;</td>
													    <td>__DisplayPre</td>
													    <td></td>
													    </tr>
													  <tr>
													    <td>&nbsp;</td>
													    <td>__construct</td>
													    <td></td>
													    </tr>
													  <tr>
													    <td>&nbsp;</td>
													    <td>_init</td>
													    <td></td>
													    </tr>
													  <tr>
													    <td>&nbsp;</td>
													    <td>fetch</td>
													    <td></td>
													    </tr>
													  <tr>
													    <td>&nbsp;</td>
													    <td>assign</td>
													    <td></td>
													    </tr>
													  <tr>
															<td>3</td>
															<td>ajaxReturn</td>
															<td></td>
													  </tr>
													  </tbody>
												</table>

										  </div>

									</div>
							  </div>

						</div>

				  </div>



			</div>

			




			<!-- Main Footer -->
			<!-- Choose between footer styles: "footer-type-1" or "footer-type-2" -->
			<!-- Add class "sticky" to  always stick the footer to the end of page (if page contents is small) -->
			<!-- Or class "fixed" to  always fix the footer to the end of page -->
			<footer class="main-footer sticky footer-type-1">

				  <div class="footer-inner">

						<!-- Add your copyright text here -->
						<div class="footer-text">
							  &copy; 2014
							  <strong>Xenon</strong>
							  More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
						</div>


						<!-- Go to Top Link, just add rel="go-top" to any link to add this functionality -->
						<div class="go-up">

							  <a href="#" rel="go-top">
									<i class="fa-angle-up"></i>
							  </a>

						</div>

				  </div>

			</footer>	  </div>




</div>


<!-- Bottom Scripts -->
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/TweenMax.min.js"></script>
<script src="/assets/js/resizeable.js"></script>
<script src="/assets/js/joinable.js"></script>
<script src="/assets/js/xenon-api.js"></script>
<script src="/assets/js/xenon-toggles.js"></script>


<!-- JavaScripts initializations and stuff -->
<script src="/assets/js/xenon-custom.js"></script>



<script language="javascript">
	  $(document).ready(function(){


	  })
</script>



</body>
</html>