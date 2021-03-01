function login(){
    var _uname=uname.value;
    var _upwd=upwd.value;
    var xhr=new XMLHttpRequest();
    xhr.onreadystatechange=function(){
        if(xhr.readyState==4&&xhr.status==200){
            var r=xhr.responseText;
            if(r==1){
                alert('登录成功');
                location.href="index.html";
            }else{
                alert('用户名或密码错误');
            }
        }
    }
    xhr.open('get',`/v1/users/login/${_uname}&${_upwd}`,true);
    xhr.send();
}