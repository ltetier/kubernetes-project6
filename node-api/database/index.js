const mongoose = require('mongoose');
const mongodbUser = process.env.MONGODB_USER;
const mongodbPassword = encodeURIComponent(process.env.MONGODB_PASSWORD);
const mongodbHost = process.env.MONGODB_HOST;

mongoose.connect('mongodb://${mongodbUser}:${mongodbPassword}@c${mongodbHost}').then(() => {
    console.log('Connected !')
}).catch(e => console.log(e));