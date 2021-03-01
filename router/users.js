const express=require('express');
const r=express.Router();
const pool=require('../pool');
//登录
r.get('/login/:uname&:upwd',(req,res)=>{
    var _uname=req.params.uname;
    var _upwd=req.params.upwd;
    pool.query('select * from xxqx_user where uname=? and upwd=?',[_uname,_upwd],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send('1');
        }else{
            res.send('0');
        }
    })
})
//验证
r.get('/check/:uname',(req,res)=>{
    var _uname=req.params.uname;
    pool.query('select * from xxqx_user where uname=?',[_uname],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send('1');
        }else{
            res.send('0');
        }
    })
})
//注册
r.post('/reg',(req,res)=>{
    var obj=req.body;
            pool.query('insert into xxqx_user set?',[obj],(err,result2)=>{
                if(err) throw err;
                if(result2.affectedRows>0){
                    res.send('1');
                }else{
                    res.send('0');
                }
            })
})
module.exports=r;