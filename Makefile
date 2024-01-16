fmt:
	echo "===> Formatting"
	stylua lua/ --config-path=.stylua.toml
	stylua after/ --config-path=.stylua.toml

lint:
	echo "===> Linting"
	luacheck lua/ --globals vim
	luacheck after/ --globals vim

all:
	make fmt lint
