const productModels = require('../models/products')
const helpers = require('../helpers/helpers')

const products = {
  getProductById: (req, res) => {
    const id = req.params.id
    productModels.getProductById(id)
      .then((result) => {
        console.log(result)
        if (result != '') {
          helpers.response(res, null, result, 200, null)
        } else {
          helpers.response(res, null, 'Product not found', 404, 'error')
        }
      })
      .catch((err) => {
        console.log(err)
      })
  },

  getAllproduct: (req, res) => {
    const search = req.query.search
    const sort = req.query.sort
    const order = req.query.order
    const page = req.query.page
    const limit = req.query.limit
    productModels.getAllproduct(search, sort, order, page, limit)
      .then((result) => {
        if (result != '') {
          helpers.response(res, page, result, 200, null)
        } else {
          helpers.response(res, page, 'Product not found', 404, 'error')
        }
      })
      .catch((err) => {
        console.log(err)
      })
  },

  updateProduct: (req, res) => {
    const id = req.params.id
    const { name, price, color, category, size, brand, author, rate, chat, condition, stock, description, idCategory, idSeller } = req.body

    const data = {
      name,
      price,
      color,
      category,
      size,
      brand,
      author,
      rate,
      chat,
      condition,
      stock,
      description,
      idCategory,
      idSeller
    }

    if (req.file) {
      data.image = process.env.BASE_URL + 'uploads/' + req.file.filename
    }

    productModels.updateProduct(id, data)
      .then((result) => {
        const resultProducts = result
        console.log(result)
        helpers.response(res, null, resultProducts, 200, null)
      })
      .catch((err) => {
        console.log(err)
      })
  },
  deleteProduct: (req, res) => {
    const id = req.params.id
    productModels.deleteProduct(id)
      .then((result) => {
        if (result != 'Data not found') {
          helpers.response(res, null, result, 200, null)
        } else {
          helpers.response(res, null, result, 404, 'Not Found')
        }
      })
      .catch((err) => {
        console.log(err)
      })
  },
  insertProduct: (req, res) => {
    console.log(req.file.filename[0])
    const { name, price, color, category, size, brand, author, rate, condition, stock, description, idCategory, idSeller } = req.body
    const data = {
      name,
      image: process.env.BASE_URL + 'uploads/' + req.file.filename,
      price,
      color,
      category,
      size,
      brand,
      author,
      rate,
      condition,
      stock,
      description,
      idCategory,
      idSeller
    }
    productModels.insertProduct(data)
      .then((result) => {
        helpers.response(res, null, result, 200, null)
      })
      .catch((err) => {
        console.log(err)
      })
  }
}

module.exports = products
