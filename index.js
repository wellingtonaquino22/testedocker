"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const express_2 = require("express");
const router = (0, express_2.Router)();
const PORT = 3000;
const HOST = '0.0.0.0';
const app = (0, express_1.default)();
app.use('/', router);
router.get('/', (req, res) => {
    res.send('Hello World');
});
app.listen(PORT, HOST);
