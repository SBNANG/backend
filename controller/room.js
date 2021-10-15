const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

async function getRooms(req, res) {
  const rooms = await prisma.room.findMany()

  res.send(rooms)
}

async function addRoom(req, res) {
  const number = req.body.number
  const bedSize = req.body.bedSize
  const price = req.body.price
  const roomTypeID = req.body.roomTypeID

  await prisma.room.create({
    data: {
      room_number: number,
      room_bed_size: bedSize,
      room_price: price,
      room_type_id: roomTypeID,
    },
  })

  res.send('เสร็จสิ้น')
}

async function updateRoom(req, res) {}

async function deleteRoom(req, res) {}

module.exports = {
  getRooms,
  addRoom,
  updateRoom,
  deleteRoom,
}
