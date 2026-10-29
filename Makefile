NAME		:= obsgit
OUTPATH		:= build/
OUTFILE		:= $(addsuffix main.js, $(OUTPATH))
MAIN		:= srcs/main.ts
PLUGINPATH	:= /path/to/your/plugin/directory

CMDPATH		:= ./node_modules/.bin/
ESBUILD		:= $(addsuffix esbuild, $(CMDPATH))
ESFLAGS		:= --bundle --external:obsidian --format=cjs --platform=node
TSC			:= $(addsuffix tsc, $(CMDPATH))
MKD			:= mkdir -p
RM			:= rm -rf

all: $(NAME)

$(NAME): $(OUTFILE) setup

$(OUTFILE):
	$(MKD) $(OUTPATH)
	$(ESBUILD) $(MAIN) $(ESFLAGS) --outfile=$(OUTFILE)
	cp manifest.json $(OUTPATH)
	cp style.css $(OUTPATH)

fclean:
	$(RM) $(OUTPATH)
	$(RM) $(PLUGINPATH)

re: fclean all

setup:
	cp -r $(OUTPATH) $(PLUGINPATH)

.PHONY: all fclean re
