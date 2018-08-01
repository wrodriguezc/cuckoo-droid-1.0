#!/bin/bash
kill $(lsof -t -i:2042)
python cuckoo.py