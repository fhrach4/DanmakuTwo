#!/usr/bin/make -f
##############################################################################
# This makefile originally created by gmakemake, Tue Oct  2 19:29:26 EDT 2012
# 
# Note: documentation for (GNU) make can be found online at 
#       http://www.gnu.org/software/make/manual/make.html
##############################################################################

####
#### Special (built-in) targets for make/gmake
####

.SUFFIXES:	$(SUFFIXES:.cc=.cpp)
.SUFFIXES:	$(SUFFIXES:.cc+=.C .cp)

# The following target stops commands from being displayed during execution
# .SILENT:

# The following target is only supported for GNU make, and indicates that 
# certain other targets don't actually produce a result in the file system 
# an object file, or an executable program), and instead they are just 
# 'convenience targets' to support what the programmer is doing.
.PHONY: clean purge reallyclean realclean all objs docs archive unarchive help \

####
#### Macros (variables) that will be used by make/gmake
####

# The various source files for our program(s)
MAIN_CPP_FILES  = danmakutwo.cpp 
OTHER_CPP_FILES =
CORE_CPP_FILES= entity.cpp bulletmanager.cpp collidable_entity.cpp
ENTITY_CPP_FILES = bullet.cpp

MAIN_C_FILES  = 
OTHER_C_FILES = 

HFILES =
CORE_HFILES = entity.h bulletmanager.h collidable_entity.h
ENTITY_HFILES = bullet.h

# Other files for your project, such as a 'ReadMe', etc.
OTHER_FILES =

# Compilers and compiler settings
INCLUDE_DIRS += 
LIB_DIRS     += 

COMMONFLAGS += -Wall -Wextra -Wundef -g -ggdb  \
               -Wcast-qual -Wcast-align -Wconversion -Wreturn-type

# Almost every major error and warning usable in gcc
# This is for "make warn"
WARNINGFLAGS = -pedantic -Wall -Wextra \
               -Wcast-align -Wcast-qual -Wctor-dtor-privacy -Wdisabled-optimization \
               -Wformat=2 -Winit-self -Wlogical-op -Wmissing-declarations \
               -Wmissing-include-dirs -Wnoexcept -Wold-style-cast -Woverloaded-virtual \
               -Wredundant-decls -Wshadow -Wsign-conversion -Wsign-promo \
               -Wstrict-null-sentinel -Wstrict-overflow=5 -Wswitch-default \
               -Wundef -Werror -Wno-unused -Wswitch-enum -Wsign-conversion -Wsign-promo \
               -Wstrict-aliasing=1 -Wzero-as-null-pointer-constant

CXX      = g++
CXXFLAGS += -Wold-style-cast \
            -Wsign-promo \
            -Wctor-dtor-privacy \
            -Woverloaded-virtual -Wnon-virtual-dtor \
            -Wno-deprecated

CC       ?= gcc
CFLAGS   += -Wmissing-declarations -g -ggdb  


LDFLAGS += -lm -g -ggdb `pkg-config --libs allegro-5.0`

# The subdirectory where intermediate files (.o, etc.) will be stored
OBJDIR = obj


# The extension used for object code files on this system
OBJEXT = o


# The subdirectory where executable files (.EXE under Windows) will be stored
EXEDIR = bin

# Documentation building
DOCTOOL = doxygen
DOCFILE = Doxyfile
DOCDIR = docs

####
# Other environmental detection/set-up
#

# The target platform.  This will default to whatever the 'uname' command 
# reports as the hardware/OS name for the current system when 'make' is 
# run, but can be manually overridden if you're using a cross-compiler, 
# etc.
ARCH := $(shell uname -m)
OS := $(shell uname)


#-------------------------------------------------------------------
# The values for the rest of the macro variables are generated from 
# the settings above (or are typically "well-known" values).
#-------------------------------------------------------------------

# Updating preproc/library paths to cover extra directories
COMMONFLAGS += $(patsubst %,-I%,$(INCLUDE_DIRS))
LDFLAGS     += $(patsubst %,-L%,$(LIB_DIRS))

# Tying common flags into C/C++ compiler settings
CFLAGS += $(COMMONFLAGS)
CXXFLAGS += $(COMMONFLAGS)

# Generate the full list(s) of typed source files under our concern
CPP_FILES += $(MAIN_CPP_FILES) $(OTHER_CPP_FILES) core/$(CORE_CPP_FILES) \
				entities/$(ENTITY_CPP_FILES)
C_FILES   += $(MAIN_C_FILES) $(OTHER_C_FILES)

# Generate the master list of *all* source files under our concern
SOURCEFILES  += $(HFILES) core/$(CORE_HFILES) entities/$(ENTITY_HFILES)
SOURCEFILES  += $(CPP_FILES) 
SOURCEFILES += $(C_FILES) 

# The names of the applications are derived from the 'base names' 
# for their respective source files (without extensions)
MAIN_C_BASES =   $(basename $(MAIN_C_FILES))
MAIN_CPP_BASES = $(basename $(MAIN_CPP_FILES))

# Figure out the 'base names' of the other source files
OTHER_C_BASES =  $(basename $(OTHER_C_FILES))
OTHER_CPP_BASES = $(basename $(OTHER_CPP_FILES))

# Here's the (type-specific) list of base names for all source files
C_BASES    = $(MAIN_C_BASES) $(OTHER_C_BASES)
CPP_BASES  = $(MAIN_CPP_BASES) $(OTHER_CPP_BASES)

# Build a list of the names of all applications this makefile can produce
APPS += $(patsubst %,$(EXEDIR)/%,$(MAIN_CPP_BASES)) 
APPS += $(patsubst %,$(EXEDIR)/%,$(MAIN_C_BASES)) 


# Figure out the names of all of the compiled files
MAIN_OBJFILES =  $(MAIN_CPP_BASES:%=$(OBJDIR)/%.$(OBJEXT)) 
MAIN_OBJFILES += $(MAIN_C_BASES:%=$(OBJDIR)/%.$(OBJEXT)) 
OTHER_OBJFILES =  $(OTHER_CPP_BASES:%=$(OBJDIR)/%.$(OBJEXT)) 
OTHER_OBJFILES += $(OTHER_C_BASES:%=$(OBJDIR)/%.$(OBJEXT))
OBJFILES = $(MAIN_OBJFILES) $(OTHER_OBJFILES)


# Figure out how we're going to cache dependency information
DEPS_FILES =  $(CPP_BASES:%=$(OBJDIR)/%.d) 
DEPS_FILES += $(C_BASES:%=$(OBJDIR)/%.d) 


####
#### Implicit rules, telling make/gmake how to create one kind of file 
#### from another kind of file (e.g. how to create "foo.o" from 
#### "foo.cpp")
####

# Compiling C code in ".c" files
$(OBJDIR)/%.$(OBJEXT): %.c
	@echo "$@"
	@if [ ! -d $(OBJDIR) ] ; then mkdir -p $(OBJDIR) ; fi
	$(CC) $(CFLAGS) -c $< -o $@

# Compiling C++ code in ".cpp" files
$(OBJDIR)/%.$(OBJEXT): %.cpp
	@echo "$@"
	@if [ ! -d $(OBJDIR) ] ; then mkdir -p $(OBJDIR) ; fi
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compiling C++ code in ".cp" files
$(OBJDIR)/%.$(OBJEXT): %.cp
	@echo "$@"
	@if [ ! -d $(OBJDIR) ] ; then mkdir -p $(OBJDIR) ; fi
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compiling C++ code in ".C" files
$(OBJDIR)/%.$(OBJEXT): %.C
	@echo "$@"
	@if [ ! -d $(OBJDIR) ] ; then mkdir -p $(OBJDIR) ; fi
	$(CXX) $(CXXFLAGS) -c $< -o $@


####
#### Explicit targets
####
all:	$(APPS)

warn: purge
	$(MAKE) CXXFLAGS="$(WARNINGFLAGS) $(CXXFLAGS)"

docs:
	$(DOCTOOL) $(DOCPARAMS)
	(cat $(DOCFILE) ; echo "OUTPUT_DIRECTORY       = $(DOCDIR)") | doxygen -

help:
	@echo "Targets include:"
	@echo "all warn clean purge archive unarchive objs " | fmt -65 | sed -e 's/^/	/'; \
	echo "" ; \
	echo "Application targets include:" ; \
	echo "$(APPS) " | fmt -65 | sed -e 's/^/	/'

objs: $(OBJFILES)

archive:
	tar cvf Archive.tar $(SOURCEFILES) $(OTHER_FILES) [mM]akefile
	compress Archive.tar

unarchive:
	zcat Archive.tar | tar xvf -

rebuild: clean all

clean:
	$(RM) $(OBJDIR)/*.$(OBJEXT)
	$(RM) $(APPS) *.exe $(EXEDIR)/*.exe *.exe.stackdump

purge reallyclean realclean: clean
	if [ "$(EXEDIR)" != "." ] ; then $(RM) -r $(EXEDIR) ; fi
	$(RM) -r $(OBJDIR) $(CLASSDIR) $(DOCDIR)
	$(RM) $(DEPENDENCY_FILE)

changelog changelog.txt:
	echo "An up-to-date changelog can be found at http://skaia.csh.rit.edu:5000/CS4Project/shortlog">changelog.txt
	echo "Username: cs4grd">>changelog.txt
	echo "Password: sourceControlIsUsed">>changelog.txt
	echo "">>changelog.txt
	hg log >>changelog.txt

####
# Rules to generate our applications (if new apps are added, create a 
# new item like those below, for the new application)
#

$(EXEDIR)/danmakutwo:	$(OBJDIR)/danmakutwo.$(OBJEXT) $(OTHER_OBJFILES)
	@echo "$@..."
	@mkdir -p $(EXEDIR)
	$(CXX) -o $@ $^ $(LDFLAGS)

####
#### Dependency management (courtesy of some intelligence in gcc.... ;-)
####

CFLAGS += -MP -MMD 
CXXFLAGS +=  -MP -MMD 

-include $(DEPS_FILES)


