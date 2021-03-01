const express=require('express');
const userRouter=require('./router/users')
const bodyParser=require('body-parser');
const app=express();
app.listen(8080);
app.use(express.static('./public'));
app.use(bodyParser.urlencoded({extended:false}));
app.use('/v1/users',userRouter);
