EMACS = emacs
EMACSFLAGS =

SRCS = fancy-battery.el
OBJS = $(SRCS:.el=.elc)

PHONY: compile

# Build targets
compile: $(OBJS)

# File targets
%.elc : %.el
	$(EMACS) -Q --batch $(EMACSFLAGS) -f batch-byte-compile $<
