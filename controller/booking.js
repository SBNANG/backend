const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

async function getBooking(req, res) {
  const booking = await prisma.booking.findMany({
    include: {
      booking_status: true,
      room: true,
      customer: true,
      payment: true,
      authorities: true,
      Check_in: true,
    },
  })

  res.json(booking)
}

module.exports = {
  getBooking,
}
