MOD_VER := Hakchi_Memory_Booster_v1_0_0
MOD_NAME := Hakchi Memory Booster v1.0.0
MOD_CATEGORY := Hakchi Core Mods
MOD_CREATOR := Swingflip

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