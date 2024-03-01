import express  from 'express'
import {Router} from "express";

const router = Router();

const PORT = 3000;
const HOST = '0.0.0.0';

const app = express()
app.use('/', router)

router.get('/', (req, res)=>{
    res.send('Hello World')
})

app.listen(PORT, HOST); 