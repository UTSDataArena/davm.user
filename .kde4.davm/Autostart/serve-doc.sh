#!/bin/bash

#old Doc
# /local/davm.doc/serve.sh

# new wordpress Docs
/home/davm/wordpress*/ctlscript.sh start

firefox-bin http://localhost:8080 &
