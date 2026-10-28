const dgram = require('node:dgram')
const server = dgram.createSocket('udp4')

// Слушаем порт 3000 на конкретном IP ноутбука (из твоих скриншотов)
server.bind(3000, '192.168.0.2', () => {
  console.log('Слушаю UDP 192.168.0.2:3000...')
})

server.on('message', (msg, rinfo) => {
  console.log('Hooray!')

  // Выведем дополнительную инфу для отладки
  console.log(`Получено от: ${rinfo.address}:${rinfo.port}`)
  console.log(`Длина пакета: ${msg.length} байт`)
  console.log(`Данные (HEX): ${msg.toString('hex')}`)
})

server.on('error', err => {
  console.error(`Ошибка сокета:\n${err.stack}`)
  server.close()
})
