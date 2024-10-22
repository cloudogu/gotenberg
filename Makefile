MAKEFILES_VERSION=9.3.2

.DEFAULT_GOAL:=dogu-release

include build/make/variables.mk
include build/make/self-update.mk
include build/make/release.mk
include build/make/clean.mk
