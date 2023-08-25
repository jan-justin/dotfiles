export def main [] {
	^zellij attach --create (pwd | path basename)
}

export def ls [] {
	^zellij list-sessions | lines | parse "{session}"
}

export def as [session_nr: int] {
	^zellij attach (to_session_name $session_nr)
}

export def ka [] {
	^zellij kill-all-sessions
}

export def ks [session_nr: int] {
	^zellij kill-session (to_session_name $session_nr)
}

def to_session_name [session_nr: int] {
	ls | get $session_nr | get session
}
