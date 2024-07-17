#!/bin/bash

gpg -o restic_env.enc --armor --symmetric --cipher-algo AES256 restic.env