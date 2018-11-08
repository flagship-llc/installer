#!/bin/bash

LATEST_RUBY=$(rbenv install -l | grep -v - | tail -1)
echo $LATEST_RUBY
