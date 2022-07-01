const express = require('express')
const User = require('../models/user.model')
const bcrypt = require('bcrypt')
const router = express.Router()

var Email;
router.post('/signup',(req,res)=>{
    User.findOne({email:req.body.email},async(err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(user==null){
                const user = User({
                    email:req.body.email,
                    password:req.body.password,
                    address:req.body.address,
                })
                const salt = await bcrypt.genSalt(10);
                user.password = await bcrypt.hash(user.password,salt);
                user.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.json()
                    }else{
                        console.log(user)
                        res.json()
                    }
                    
                }).catch((err)=>{
                   console.log(err);
                   res.json()
                })
            }else{

            res.json({
                message:'email is not avilable'
            })   
            }
        }
    })
    
})

router.post('/login',async(req,res)=>{
    Email=req.body.email;
    User.findOne({email:req.body.email},async(err,user)=>{
        if(!user){
            console.log('user does not exist');
            res.json("email");
        }else{
            const validPassword = await bcrypt.compare(req.body.password,user.password);
            if(validPassword){
                res.json();
            } else{
                res.json('password');
            }
        }
    })

});

router.post('/items',(req,res)=>{
    var name=req.body.product_name;
    var num=req.body.no_of_items;

    User.updateOne({"email":Email},{$push:{
            products:{product_name:name,items:num},
        }},(err,user)=>{
        if(err){
            res.json(err);
        }
        else{
            // console.log(user);
            res.json();
        }
    });
})
module.exports = router