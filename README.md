# mirai.daymo

A new private mirai variant distributed over 20 zero-day exploits

## purpose

This is a technical research repository for ethical pentesting purposes. I wanted to see how I can modify a mirai variation, so that it wont be detected by yara scanners.

I have hard-coded certain values that are essential to compile this botnet, so that no script kiddie can simply use it for black-hat purposes. I also want to emphasise, that I wont be liable for any kind of damage caused by mirai.daymo.


## features

- 6 ways to achieve persistence
- fileless memory-ran capabilities
- process hollowing with LD_PRELOAD
- modifying network traffic to keep it hidden using eBPF packet injection
- custom command and control written ln nim
- anti-yara and anti upx techniques
- hardcoded to gtfo skiddos
- active exploitation of 20+ 0days
