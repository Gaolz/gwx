#!/usr/bin/env puma

environment 'development'
daemonize false

pidfile 'tmp/pids/puma.pid'
state_path 'tmp/pids/puma.state'

# quiet
threads 0, 16
workers 2

port 3000
