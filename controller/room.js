const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

async function getRooms(req, res) {
  const rooms = await prisma.room.findMany()

  res.json(rooms)
}

async function addRoom(req, res) {
  const number = req.body.room_number
  const price = req.body.room_price
  const typeID = req.body.room_type_id

  await prisma.room.create({
    data: {
      room_number: number,
      room_price: price,
      room_type_id: typeID,
    },
  })

  res.status(201).end()
}

async function updateRoom(req, res) {
  const roomID = req.body.room_id
  const price = req.body.room_price

  await prisma.room.update({
    where: {
      room_id: roomID,
    },
    data: {
      room_price: price,
    },
  })

  res.status(200).end()
}

async function deleteRoom(req, res) {
  const roomID = req.body.room_id

  await prisma.room.delete({
    where: {
      room_id: roomID,
    },
  })

  res.status(204).end()
}

module.exports = {
  getRooms,
  addRoom,
  updateRoom,
  deleteRoom,
}
