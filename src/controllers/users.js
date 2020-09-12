const modelUser = require('../models/users')
const helpers = require('../helpers/helpers')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

module.exports = {
  registerSeller: (req, res) => {
    const { name, email, phoneNumber, storeName, password } = req.body

    const data = {
      name,
      email,
      phoneNumber,
      storeName,
      password,
      roleId: 1,
      image: null,
      gender: null,
      dateOfBirth: null,
      storeDescription: null,
      address: null
    }

    bcrypt.genSalt(10, function (_err, salt) {
      bcrypt.hash(data.password, salt, function (_err, hash) {
        data.password = hash
        modelUser.register(data)
          .then((result) => {
            if (result == 'Email is already exists') {
              helpers.response(res, null, result, 403, 'Forbidden')
            } else {
              helpers.response(res, null, 'Register Seller Success', 201, null)
            }
          })
          .catch((err) => {
            console.log(err)
          })
      })
    })
  },

  registerCustommer: (req, res) => {
    const { name, email, password } = req.body

    const data = {
      name,
      email,
      password,
      roleId: 2
    }
    bcrypt.genSalt(10, function (_err, salt) {
      bcrypt.hash(data.password, salt, function (_err, hash) {
        data.password = hash
        modelUser.register(data)
          .then((result) => {
            if (result == 'Email is already exists') {
              helpers.response(res, null, result, 403, 'Forbidden')
            } else {
              helpers.response(res, null, 'Register Custommer Success', 201, null)
            }
          })
          .catch((err) => {
            console.log(err)
          })
      })
    })
  },

  loginSeller: (req, res) => {
    const { email, password } = req.body
    modelUser.login(email)
      .then((result) => {
        if (result.length < 1) return helpers.response(res, null, 'Email not found!', 401, null)

        const user = result[0]
        const hash = user.password
        bcrypt.compare(password, hash).then((resCompare) => {
          if (!resCompare) return helpers.response(res, null, 'Password wrong!', 401, null)
          const payload = {
            id: user.id,
            email: user.email,
            roleId: user.roleId
          }

          jwt.sign(payload, process.env.SECRET_KEY, { expiresIn: '3h' }, (_err, token) => {
            user.token = token

            delete user.password

            if (user.gender == 1) {
              user.gender = 'male'
            } else if (user.gender == 2) {
              user.gender = 'female'
            } else {
              user.gender = null
            }

            if (user.roleId !== 1) {
              helpers.response(res, null, 'You are not a seller', 401)
            } else {
              user.roleId = 'Seller'
              helpers.response(res, null, user, 200)
            }
          })
        })
      })
      .catch((err) => {
        console.log(err)
      })
  },

  loginCustommer: (req, res) => {
    const { email, password } = req.body
    modelUser.login(email)
      .then((result) => {
        if (result.length < 1) return helpers.response(res, null, 'Email not found!', 401, null)

        const user = result[0]
        const hash = user.password
        bcrypt.compare(password, hash).then((resCompare) => {
          if (!resCompare) return helpers.response(res, null, 'Password wrong!', 401, null)
          const payload = {
            id: user.id,
            email: user.email,
            roleId: user.roleId
          }

          jwt.sign(payload, process.env.SECRET_KEY, { expiresIn: '3h' }, (_err, token) => {
            user.token = token

            delete user.password
            delete user.phoneNumber
            delete user.storeName
            delete user.storeDescription
            delete user.address

            if (user.gender == 1) {
              user.gender = 'male'
            } else if (user.gender == 2) {
              user.gender = 'female'
            } else {
              user.gender = null
            }

            if (user.roleId !== 1) {
              user.roleId = 'Custommer'
              helpers.response(res, null, user, 200)
            } else {
              helpers.response(res, null, 'You are not a custommer', 401)
            }
          })
        })
      })
      .catch((err) => {
        console.log(err)
      })
  },

  resetPassword: (req, res) => {
    const id = req.params.id
    const { password } = req.body

    const data = {
      password: password
    }

    bcrypt.genSalt(10, function (_err, salt) {
      bcrypt.hash(data.password, salt, function (_err, hash) {
        data.password = hash
        modelUser.resetPassword(id, data)
          .then((result) => {
            helpers.response(res, null, 'Reset Password Success', 201, null)
          })
          .catch((err) => {
            console.log(err)
          })
      })
    })
  }
}
