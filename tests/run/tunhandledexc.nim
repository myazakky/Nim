discard """
  file: "tunhandledexc.nim"
  outputsub: "Error: unhandled exception: bla [ESomeOtherErr]"
  exitcode: "1"
"""
type
  ESomething = object of E_Base
  ESomeOtherErr = object of E_Base

proc genErrors(s: string) =
  if s == "error!":
    raise newException(ESomething, "Test")
  else:
    raise newException(EsomeotherErr, "bla")

when True:
  try:
    genErrors("errssor!")
  except ESomething:
    echo("Error happened")
  


