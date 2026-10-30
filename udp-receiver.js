const dgram = require('node:dgram')
const fs = require('node:fs')

const server = dgram.createSocket('udp4')

const LOG_PATH = 'received.bin'
// Открываем поток один раз. 'w' — перезапись, 'a' — дозапись.
// Большой highWaterMark уменьшает число системных вызовов при пике.
const out = fs.createWriteStream(LOG_PATH, {
  flags: 'w',
  highWaterMark: 1024 * 1024 // 1 MiB
})

let packets = 0
let bytes = 0

out.on('error', e => console.error('write error:', e))

server.bind(3000, '192.168.0.2', () => {
  console.log(`Слушаю UDP 192.168.0.2:3000, пишу в ${LOG_PATH}`)
})

server.on('message', msg => {
  out.write(msg)

  packets++
  bytes += msg.length

  // console.log(msg.toString('hex'))
})

server.on('error', err => {
  console.error(`Ошибка сокета:\n${err.stack}`)
  out.end(() => server.close())
})

// Периодический отчёт, чтобы не тормозить горячий путь.
setInterval(() => {
  if (packets) {
    console.log(`пакетов: ${packets}, байт: ${bytes}`)

    packets = 0
    bytes = 0
  }
}, 1000)
