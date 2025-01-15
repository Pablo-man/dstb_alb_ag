import {Router} from 'express'
import os from 'os';

const router = Router()

router.get('/', (req, res)=>{
    const hostname = os.hostname();
    res.send(`Hello you XD :) ${hostname}`)
})

export default router