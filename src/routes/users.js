const express = require('express')
const userController = require('../controllers/users')
const userForgot = require('../middlewares/forgot_email')
const router = express.Router()

router
  .post('/register/seller', userController.registerSeller)
  .post('/register/custommer', userController.registerCustommer)
  .post('/login/seller', userController.loginSeller)
  .post('/login/custommer', userController.loginCustommer)
  .post('/forgotpassword', userForgot.forgotPass)
  .patch('/resetpassword/:id', userController.resetPassword)

module.exports = router
