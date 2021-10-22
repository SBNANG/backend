const express = require('express')
const {
  getRooms,
  addRoom,
  updateRoom,
  deleteRoom,
} = require('./controller/room')

const {
  getCustomers,
  addCustomer,
  updateCustomer,
  deleteCustomer,
} = require('./controller/customer')

const {
  getAuthorities,
  addAuthorities,
  updateAuthorities,
  deleteAuthorities,
} = require('./controller/authorities')

const { getBooking } = require('./controller/booking')

const app = express()
app.use(express.json())

app.get('/room', getRooms)
app.post('/room', addRoom)
app.put('/room', updateRoom)
app.delete('/room', deleteRoom)

app.get('/customer', getCustomers)
app.post('/customer', addCustomer)
app.put('/customer', updateCustomer)
app.delete('/customer', deleteCustomer)

app.get('/authorities', getAuthorities)
app.post('/authorities', addAuthorities)
app.put('/authorities', updateAuthorities)
app.delete('/authorities', deleteAuthorities)

app.get('/booking', getBooking)
app.listen(3000)
