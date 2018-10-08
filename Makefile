MOD_VER := Hakchi_Speed_Booster_RC1
MOD_NAME := Hakchi Speed Booster RC1
MOD_CATEGORY := Hakchi Core Mods
MOD_CREATOR := Swingflip & MadMonkey

GIT_COMMIT := $(shell echo "`git rev-parse --short HEAD``git diff-index --quiet HEAD -- || echo '-dirty'`")

all: out/$(MOD_VER).hmod

out/$(MOD_VER).hmod:
	mkdir -p out/ temp/
	rsync -a mod/ temp/ --links --delete
	
	printf "%s\n" \
	"---" \
	"Name: $(MOD_NAME)" \
	"Creator: $(MOD_CREATOR)" \
	"Category: $(MOD_CATEGORY)" \
	"Version: $(MOD_VER)" \
	"Built on: $(shell date)" \
	"Git commit: $(GIT_COMMIT)" \
	"---" > temp/readme.md
	
	sed 1d mod/readme.md >> temp/readme.md
	cd temp/; tar -czvf "../$@" *
	rm -r temp/
	touch "$@"

clean:
	-rm -rf out/

.PHONY: clean