# Store interactive Python shell history in ~/.cache/python_history
# instead of ~/.python_history.
# https://docs.python.org/3/library/readline.html#example

import atexit
import os
import readline

histfile = os.path.join(os.getenv("XDG_CACHE_HOME", os.path.expanduser("~/.cache")), "python_history")
try:
    readline.read_history_file(histfile)
    # default history len is -1 (infinite), which may grow unruly
    readline.set_history_length(1000)
except FileNotFoundError:
    pass

atexit.register(readline.write_history_file, histfile)
