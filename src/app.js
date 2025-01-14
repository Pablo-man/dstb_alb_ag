import express from 'express'
import router from './routes/hello.routes.js'

const app = express()
const PORT = 3000 || process.env.PORT

app.use(router)

app.listen(PORT, ()=>{
    console.log(`Server on port ${PORT}`)
})