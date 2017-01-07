/*
	@description注册表单验证
	@author wsx
	@time 16/10/19
*/
$(document).ready(function(){
	var emailFlag = true;
	var pwdFlag = true;
	
	
	$('#remail').blur(function() {
		if ($(this).val() != '') {
			var reg = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
			if (reg.test($(this).val())) {
				$.ajax({
				 type: "POST",
				 url: "admin/signup.php",
				 data: {email:$(this).val(),type:'email'},
				 async: true,
				 success: function(data){
					if(data == 1){
						$('#dis_em').text('该E-mail已经被注册');
						emailFlag = false;
					}else{
						$('#dis_em').text('');
					    emailFlag = true;
					}
			      }
			 });
			}else{
				$('#dis_em').text('E-mail格式不正确');
				emailFlag = false;
			}
		}else{
			$('#dis_em').text('Email不能为空');
			emailFlag = false;
		}
	});
	$('#password').blur(function(){
		if($(this).val() == ''){
			$('#dis_pwd').text('密码不能为空');
		}else if($(this).val().length < 6 || $(this).val().length > 20){
			$('#dis_pwd').text('密码长度不符');
		}else{
			$('#dis_pwd').text('');
		}
		
	});
	$('#confirm').blur(function(){
		var val=$('#password').val();
		if(val != ''){
			if($(this).val() == ''){
				$('#dis_con_pwd').text('请再输一遍密码');
				pwdFlag = false;
			}else if($(this).val() != val){
				$('#dis_con_pwd').text('输入密码与之前不一致');
				pwdFlag = false;
			}else{
				$('#dis_con_pwd').text('');
				pwdFlag = true;
			}
		}else{
			$('#dis_con_pwd').text('');
			pwdFlag = false;
		}
		
	});
	$('#reg').click(function() {
		if (!(emailFlag && pwdFlag)) {
			alert('信息填写有误，请检查');
			return false;
		}
	});
});