$env.PATH = (
  $env.PATH 
  | split row (char esep) 
  | prepend [
    '/opt/homebrew/bin',
    '/opt/homebrew/sbin',
    '/Users/jvt/.local/bin',
    '/Users/jvt/.cargo/bin',
    '/opt/homebrew/lib/node_modules/@vue/language-server/bin',
    '/usr/local/bin',
  ]
)
$env.EDITOR = 'hx'
$env.BAT_THEME = 'ansi'
