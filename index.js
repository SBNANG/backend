const express = require('express')
const {
  getRooms,
  addRoom,
  updateRoom,
  deleteRoom,
} = require('./controller/room')

const app = express()
app.use(express.json())

app.get('/room', getRooms)
app.post('/room', addRoom)
app.put('/room', updateRoom)
app.delete('/room', deleteRoom)

app.listen(3000)
