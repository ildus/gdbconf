source ~/.gdb.py

#set pagination off
handle SIGUSR1 noprint nostop
handle SIGUSR2 noprint nostop
set history filename /tmp/gdb_history
set history save on
set breakpoint pending on
#set print elements 0
set detach-on-fork off
set schedule-multiple on
set follow-fork-mode child
python gdb.events.exited.connect(lambda x: [gdb.execute("inferior 1"), gdb.post_event(lambda: gdb.execute("continue"))])

macro define __builtin_offsetof(T, F) ((int) &(((T *) 0)->F))
macro define __extension__

define fake_elog
  p elog_start("gdb", 1, "gdb")
  p elog_finish(ERROR, "finished")
end
