const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
var cors = require('cors');
const Todo = require("./models/todo");

const app = express();

app.use(cors());
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

//Database connection
mongoose.connect('mongodb+srv://ceyphe:azerty6969@cluster0.gaczp.mongodb.net/todo-app?retryWrites=true&w=majority',
 (error, done) => {
     if (error) {
         console.log(error);
     }
     if (done) {
         console.log("Connected to db");
         app.listen(3000, ()=> console.log("listening to server.."));
     }
 }
);

//get todos
app.get('/todos', async (req,res) => {
     try {
        await Todo.find().then((result) => {
            res.send(result);
        })
     } catch (error) {
         console.log(error);
     }
      
});
 

//add todo
app.post('/add-todo',(req,res)=>{
    const todo = new Todo({
        title : req.body.title,
        status : req.body.status,
    });
    
    todo.save()
    .then((result) =>{
        res.send(result);
        console.log("Todo added");
    })
    .catch((error) =>{
        console.log(error);
    })
});


//delete todo
app.delete('/delete-todo/:id',async (req,res)=>{
    try {
        await Todo.findByIdAndDelete({_id:req.params.id});
        res.send(res.statusCode);
        console.log("todo deleted");
    } catch (error) {
        console.log(error);
    }
});

//update todo
app.put('/update-todo/:id', async (req,res)=>{
    try {
        await Todo.findByIdAndUpdate({_id: req.params.id},{
            title : req.body.title,
            status : req.body.status,
        });
        res.send(res.statusCode);
        console.log("Todo updated");
    } catch (error) {
        console.log(error);
    }
});