let-env PATH = (
  $env.PATH 
  | split row (char esep) 
  | prepend [
    '/opt/homebrew/bin',
    '/opt/homebrew/sbin',
    '/Users/jvt/.local/bin',
    '/Users/jvt/.cargo/bin',
    '/usr/local/bin',
  ]
)
let-env EDITOR = 'hx'
let-env BAT_THEME = 'ansi'
