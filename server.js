const express=require("express");
const mysql=require("mysql2");
const get_routes = require("./router/route");


const app=express();


app.use("/api", get_routes);
const machineStatus = require("./controller/status");
machineStatus.machine_status


// starting a server
 app.listen(8080,()=>{
    console.log("server is listening on port 8080");
 })
