+++
title = "So You Want To Know If a Terminal Uses a Dark or Light Theme?"
description = "TODO"
draft = true
+++

## 0. Why?
State goal, show screenshots of delta, etc.

## Ⅰ. Talking to the Terminal
TTY, escape sequences, feature detection.
I wanted to avoid testing the `TERM` env var.

## Ⅱ. Colors
Talk about color formats, terminal differences and perceived lightness detection.

## Ⅲ. Timeout
Polling, `/dev/tty` polling on macos.

## Ⅳ. Race Conditions
*Knock knock! Race Condition! Who's there?*
