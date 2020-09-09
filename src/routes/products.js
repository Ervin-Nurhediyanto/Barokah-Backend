const express = require('express')
const productController = require('../controllers/products')
const router = express.Router()
// const { verifyAccess, verifyAccessAdmin } = require('../middlewares/auth')
const { upload } = require('../middlewares/multer')

router
  .get('/:id', productController.getProductById)
  .get('/', productController.getAllproduct)
  .post('/', upload, productController.insertProduct)
  .patch('/:id', upload, productController.updateProduct)
  .delete('/:id', productController.deleteProduct)

module.exports = router
