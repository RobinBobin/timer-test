const dgram = require('node:dgram')
const fs = require('node:fs')

const server = dgram.createSocket('udp4')

// const LOG_PATH = 'received.bin'
// Открываем поток один раз. 'w' — перезапись, 'a' — дозапись.
// Большой highWaterMark уменьшает число системных вызовов при пике.
// const out = fs.createWriteStream(LOG_PATH, {
//   flags: 'w',
//   highWaterMark: 1024 * 1024 // 1 MiB
// })

let packets = 0
let bytes = 0

let totalPackets = 0
let totalBytes = 0

// out.on('error', e => console.error('write error:', e))

server.bind(3000, '192.168.0.2', () => {
  console.log(`Слушаю UDP 192.168.0.2:3000`)
})

server.on('message', msg => {
  // out.write(msg)

  packets++
  bytes += msg.length

  totalPackets++
  totalBytes += msg.length

  // console.log(msg.toString('hex'))
})

server.on('error', err => {
  console.error(`Ошибка сокета:\n${err.stack}`)
  // out.end(() => server.close())
})

// Периодический отчёт, чтобы не тормозить горячий путь.
setInterval(() => {
  if (packets) {
    console.log(`пакетов: ${packets}, байт: ${bytes}`)

    packets = 0
    bytes = 0
  }
}, 1000).unref()

let shuttingDown = false

function shutdown(signal) {
  if (shuttingDown) {
    return
  }

  shuttingDown = true

  console.log(`\nПолучен ${signal}, останавливаем сервер...`)

  console.log(`пакетов: ${packets}, байт: ${bytes}`)
  console.log(`всего пакетов: ${totalPackets}, всего байт: ${totalBytes}`)

  // Таймаут на случай, если close() зависнет
  setTimeout(() => {
    console.error('Принудительный выход')
    process.exit(1)
  }, 5000).unref()

  server.close(err => {
    if (err) {
      console.error('Ошибка при закрытии сервера:', err)
      process.exit(1)
    }
    console.log('Сервер остановлен, выходим')
    process.exit(0)
  })
}

process.on('SIGINT', () => shutdown('SIGINT')) // Ctrl+C
process.on('SIGTERM', () => shutdown('SIGTERM')) // kill / docker stop
