const express = require('express')
const userController = require('../controllers/users')
const router = express.Router()

router
  .post('/register/seller', userController.registerSeller)
  .post('/register/custommer', userController.registerCustommer)
  .post('/login/seller', userController.loginSeller)
  .post('/login/custommer', userController.loginCustommer)

module.exports = router
