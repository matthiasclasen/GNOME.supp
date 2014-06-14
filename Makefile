glib_supp_FILES := $(wildcard glib/*.supp)
gio_supp_FILES := $(wildcard gio/*.supp)
pango_supp_FILES := $(wildcard pango/*.supp)
gail_supp_FILES := $(wildcard gail/*.supp)
gdk_supp_FILES := $(wildcard gdk/*.supp)
gtk_supp_FILES := $(wildcard gtk+/*.supp)
gtk3_supp_FILES := gtk.supp $(wildcard gtk+/3.x/*.supp)
gtksourceview_supp_FILES := $(wildcard gtksourceview/*.supp)

BASE_GENERATED_SUPP_FILES = glib.supp gio.supp pango.supp gail.supp gdk.supp gtk3.supp gtksourceview.supp
base_supp_FILES = glibc.supp fontconfig.supp $(BASE_GENERATED_SUPP_FILES)

ALL_GENERATED_SUPP_FILES = $(BASE_GENERATED_SUPP_FILES) gtk.supp base.supp

.PHONY: all clean

all: $(ALL_GENERATED_SUPP_FILES)

clean:
	$(RM) $(ALL_GENERATED_SUPP_FILES)

glib.supp: $(glib_supp_FILES)
	cat -- $^ | sed '/^#/d' >$@
gio.supp: $(gio_supp_FILES)
	cat -- $^ | sed '/^#/d' >$@
pango.supp: $(pango_supp_FILES)
	cat -- $^ | sed '/^#/d' >$@
gail.supp: $(gail_supp_FILES)
	cat -- $^ | sed '/^#/d' >$@
gdk.supp: $(gdk_supp_FILES)
	cat -- $^ | sed '/^#/d' >$@
gtk.supp: $(gtk_supp_FILES)
	cat -- $^ | sed '/^#/d' >$@
gtk3.supp: $(gtk3_supp_FILES)
	cat -- $^ | sed '/^#/d' >$@
gtksourceview.supp: $(gtksourceview_supp_FILES)
	cat -- $^ | sed '/^#/d' >$@
base.supp: Makefile $(base_supp_FILES)
	cat -- $(filter %.supp,$^) | sed '/^#/d' >$@
