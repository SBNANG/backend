const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

async function getCustomers(req, res) {
  const customers = await prisma.customer.findMany()

  res.json(customers)
}

async function addCustomer(req, res) {
  const prefix = req.body.customer_prefix
  const name = req.body.customer_name
  const surname = req.body.customer_surname
  const email = req.body.customer_email
  const password = req.body.customer_password

  await prisma.customer.create({
    data: {
      customer_prefix: prefix,
      customer_name: name,
      customer_surname: surname,
      customer_email: email,
      customer_password: password,
    },
  })

  res.status(201).end()
}

async function updateCustomer(req, res) {
  const customerID = req.body.customer_id
  const prefix = req.body.customer_prefix
  const name = req.body.customer_name
  const surname = req.body.customer_surname
  const email = req.body.customer_email
  const password = req.body.customer_password

  await prisma.customer.update({
    where: {
      customer_id: customerID,
    },
    data: {
      customer_prefix: prefix,
      customer_name: name,
      customer_surname: surname,
      customer_email: email,
      customer_password: password,
    },
  })

  res.status(200).end()
}

async function deleteCustomer(req, res) {
  const customerID = req.body.customer_id

  await prisma.customer.delete({
    where: {
      customer_id: customerID,
    },
  })

  res.status(204).end()
}

module.exports = {
  getCustomers,
  addCustomer,
  updateCustomer,
  deleteCustomer,
}
