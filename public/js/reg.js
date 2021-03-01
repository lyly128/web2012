function uname_check(){
    var _uname=uname.value;
    if(!_uname){
        uname_msg.innerHTML="* 用户名不能为空";
    }else if(_uname.length<3){
        uname_msg.innerHTML="- 用户名长度不能低于3"
    }else{
        var xhr=new XMLHttpRequest();
        xhr.onreadystatechange=function(){
        if(xhr.readyState==4&&xhr.status==200){
            console.log('3');
            var r=xhr.responseText;
            if(r==1){
                uname_msg.innerHTML="* 该用户名已存在";
            }else{
                uname_msg.innerHTML="√";
            }
        }
    }
    xhr.open('get',`/v1/users/check/${_uname}`,true);
    xhr.send();
    }     
}
function email_check(){
    var _email=email.value;
    if(!_email){
        email_msg.innerHTML="* 邮箱不能为空";
    }else{
        email_msg.innerHTML="√";
    }
}
function upwd_check(){
    var _upwd=upwd.value;
    if(!_upwd){
        upwd_msg.innerHTML="* 密码不能为空";
    }else if(_upwd.length<6){
        upwd_msg.innerHTML="- 密码长度不能低于6";
    }else{
        upwd_msg.innerHTML="√";
    }
    cpwd_check();
}
function cpwd_check(){
    var _upwd=upwd.value;
    var _cpwd=cpwd.value;
    if(!_cpwd){
        cpwd_msg.innerHTML="* 密码不能为空";
    }else if(_cpwd===_upwd){
        cpwd_msg.innerHTML="√";
    }else{
        cpwd_msg.innerHTML="- 两次密码不一致";
    }
}
function reg(){
    var _uname=uname.value;
    var _upwd=upwd.value;
    var _email=email.value;
    if(uname_msg.innerHTML!=="√"||email_msg.innerHTML!=="√"||upwd_msg.innerHTML!=="√"||cpwd_msg.innerHTML!=="√"){
        alert("输入信息有误!");
        return;
    }else{
        var xhr=new XMLHttpRequest();
    xhr.onreadystatechange=function(){
        if(xhr.readyState===4&&xhr.status==200){
            var r=xhr.responseText;
            if(r==1){
                alert('注册成功！');
            }else{
                alert('注册失败！');
            }
        }
    }
    xhr.open('post',`/v1/users/reg`,true);
    var formdata=`uname=${_uname}&upwd=${_upwd}&email=${_email}`;
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    xhr.send(formdata);
    }      
}