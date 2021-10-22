const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

async function getAuthorities(req, res) {
  const authorities = await prisma.authorities.findMany()

  res.json(authorities)
}

async function addAuthorities(req, res) {
  const prefix = req.body.authorities_prefix
  const name = req.body.authorities_name
  const surname = req.body.authorities_surname
  const email = req.body.authorities_email
  const password = req.body.authorities_password

  await prisma.authorities.create({
    data: {
      authorities_prefix: prefix,
      authorities_name: name,
      authorities_surname: surname,
      authorities_email: email,
      authorities_password: password,
    },
  })

  res.status(201).end()
}

async function updateAuthorities(req, res) {
  const authoritiesID = req.body.authorities_id
  const prefix = req.body.authorities_prefix
  const name = req.body.authorities_name
  const surname = req.body.authorities_surname
  const email = req.body.authorities_email
  const password = req.body.authorities_password

  await prisma.authorities.update({
    where: {
      authorities_id: authoritiesID,
    },
    data: {
      authorities_prefix: prefix,
      authorities_name: name,
      authorities_surname: surname,
      authorities_email: email,
      authorities_password: password,
    },
  })

  res.status(200).end()
}

async function deleteAuthorities(req, res) {
  const authoritiesID = req.body.authorities_id
  await prisma.authorities.delete({
    where: {
      authorities_id: authoritiesID,
    },
  })

  res.status(204).end()
}

module.exports = {
  getAuthorities,
  addAuthorities,
  updateAuthorities,
  deleteAuthorities,
}
