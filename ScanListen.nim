import net

proc main(): void =
  var l: Socket
  var conn: Socket
  var err: OSError

  l, err = newTcpListener("0.0.0.0", "238")
  
  if err != NoError:
    echo err
  else:
    pass
    
  while:
    conn, err = l.accept()
    if err != nil:
      break
    
    spawn handleConnection(conn)
    
proc handleConnection(conn: Socket) =
  var bufChk: seq[uint8]
  var ipInt: uint32
  var portInt: uint16
  
  try:
    conn = newSocket()
    conn.connect("example.com", 80)
    conn.setDeadline(now() + seconds(10))

  # Defer conn.Close() behavior
  finally:
    conn.close()

  # Read data
  bufChk = readXBytes(conn, 1)
  if bufChk.isNil:
    raise newException(OSError, "Read error")
  except OSError as err:
    # Handle the error
    return
   
