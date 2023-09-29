#!/bin/bash
# sends a request to that URL
curl -sI $@ | grep "Content-Length" | cut -d ' ' -f2
