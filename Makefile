BCC = bcc
BCFLAGS = -a- -3 -Fs- -mh -O2 -v
# -Ie:\bc45\include -Le:\bc45\lib

CFLAGS = -Wall -Wextra -Wpedantic -Wno-unused-parameter -ggdb -std=c++98
# -DTEST -DDEBUG

CC = gcc
CXX = g++

EXX = em++
EMFLAGS = -O2 --preload-file emscripten/assets --shell-file shell_minimal.html -s USE_ZLIB=1 -s USE_SDL=2

SRCDEP = emdemo.cpp emx16demo.cpp vga.cpp png.cpp image.cpp memory.cpp vtext.cpp palettes.cpp canvas.cpp
SRC = vga.cpp png.cpp image.cpp memory.cpp vtext.cpp palettes.cpp canvas.cpp
OBJS = emdemo.o emx16demo.o vgademo.o vga.o png.o image.o memory.o vtext.o palettes.o canvas.o
BIN = emdemo emx16demo png vgademo VGA.EXE
SDLFLAGS = $(shell sdl2-config --cflags --libs)

all: emdemo emx16demo emscripten/emdemo.html emscripten/emx16demo.html

.cpp.o:
	$(CXX) $(CFLAGS) -c -o $@ $<
	
.c.o:
	$(CC) $(CFLAGS) -o $@ $<

.cpp.obj:
	$(BCC) $(BCFLAGS) -c $<
	
depend: $(SRCDEP)
	makedepend -- $(CFLAGS) -- $^
	
vtext.obj: vtext.cpp fonts.h

memory.obj: memory.cpp
	$(BCC) $(BCFLAGS) -B -c memory.cpp

png.obj: png.cpp image.obj canvas.obj memory.obj zlib.h zconf.h
#	$(BCC) $(BCFLAGS) -DDEBUG -c $**

vga.obj: vga.cpp
	$(BCC) $(BCFLAGS) -B -c vga.cpp
	
pngtest.o: png.cpp
	$(CXX) $(CFLAGS) -DTEST -DDEBUG -c -o $@ $^

matrix: matrix.cpp
	$(CXX) $(CFLAGS) -DTEST -o $@ $^

png: image.o memory.o pngtest.o palettes.o canvas.o
	$(CXX) $(CFLAGS) -DTEST -DDEBUG -o $@ $^ -lz

vgademo: vgademo.o vga.o image.o memory.o png.o vtext.o palettes.o canvas.o
	$(CXX) $(CFLAGS) $(SDLFLAGS) -o $@ $^ -lz

emdemo: emdemo.o vga.o image.o memory.o png.o vtext.o palettes.o canvas.o
	$(CXX) $(CFLAGS) $(SDLFLAGS) -o $@ $^ -lz

emx16demo: emx16demo.o vga.o image.o memory.o png.o vtext.o palettes.o canvas.o
	$(CXX) $(CFLAGS) $(SDLFLAGS) -o $@ $^ -lz

emscripten/emdemo.html: emdemo.cpp $(SRC)
	$(EXX) $(EMFLAGS) -o $@ $^ 
	
emscripten/emx16demo.html: emx16demo.cpp $(SRC)
	$(EXX) $(EMFLAGS) -o $@ $^ 
	
png.exe: png.cpp memory.obj image.cpp zlib.h zconf.h zlib_h.lib
	bcc -DDEBUG -DTEST -3 -Fs- -mh -v png.cpp memory.obj image.cpp zlib_h.lib

vga.exe: vga.obj memory.obj canvas.obj image.obj png.obj zlib_h.lib vtext.obj palettes.obj
	$(BCC) $(BCFLAGS) vga.obj memory.obj canvas.obj image.obj png.obj zlib_h.lib vtext.obj palettes.obj
	
dclean:
	del *.obj vga.exe

clean:
	rm -f $(OBJS) $(BIN)

# DO NOT DELETE

emdemo.o: /usr/include/stdio.h /usr/include/bits/libc-header-start.h
emdemo.o: /usr/include/features.h /usr/include/stdc-predef.h
emdemo.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
emdemo.o: /usr/include/bits/long-double.h /usr/include/gnu/stubs.h
emdemo.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
emdemo.o: /usr/include/bits/types/__FILE.h /usr/include/bits/types/FILE.h
emdemo.o: /usr/include/bits/libio.h /usr/include/bits/_G_config.h
emdemo.o: /usr/include/bits/types/__mbstate_t.h /usr/include/bits/stdio_lim.h
emdemo.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
emdemo.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
emdemo.o: /usr/include/bits/floatn.h /usr/include/bits/floatn-common.h
emdemo.o: /usr/include/sys/types.h /usr/include/bits/types/clock_t.h
emdemo.o: /usr/include/bits/types/clockid_t.h
emdemo.o: /usr/include/bits/types/time_t.h /usr/include/bits/types/timer_t.h
emdemo.o: /usr/include/bits/stdint-intn.h /usr/include/endian.h
emdemo.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
emdemo.o: /usr/include/bits/byteswap-16.h /usr/include/bits/uintn-identity.h
emdemo.o: /usr/include/sys/select.h /usr/include/bits/select.h
emdemo.o: /usr/include/bits/types/sigset_t.h
emdemo.o: /usr/include/bits/types/__sigset_t.h
emdemo.o: /usr/include/bits/types/struct_timeval.h
emdemo.o: /usr/include/bits/types/struct_timespec.h
emdemo.o: /usr/include/sys/sysmacros.h /usr/include/bits/sysmacros.h
emdemo.o: /usr/include/bits/pthreadtypes.h
emdemo.o: /usr/include/bits/thread-shared-types.h
emdemo.o: /usr/include/bits/pthreadtypes-arch.h /usr/include/alloca.h
emdemo.o: /usr/include/bits/stdlib-float.h /usr/include/string.h
emdemo.o: /usr/include/bits/types/locale_t.h
emdemo.o: /usr/include/bits/types/__locale_t.h /usr/include/strings.h
emdemo.o: /usr/include/math.h /usr/include/bits/math-vector.h
emdemo.o: /usr/include/bits/libm-simd-decl-stubs.h
emdemo.o: /usr/include/bits/flt-eval-method.h /usr/include/bits/fp-logb.h
emdemo.o: /usr/include/bits/fp-fast.h
emdemo.o: /usr/include/bits/mathcalls-helper-functions.h
emdemo.o: /usr/include/bits/mathcalls.h /usr/include/bits/iscanonical.h
emdemo.o: /usr/include/time.h /usr/include/bits/time.h
emdemo.o: /usr/include/bits/types/struct_tm.h
emdemo.o: /usr/include/bits/types/struct_itimerspec.h image.h types.h
emdemo.o: /usr/include/stdint.h /usr/include/bits/wchar.h
emdemo.o: /usr/include/bits/stdint-uintn.h canvas.h palettes.h memory.h png.h
emdemo.o: /usr/include/errno.h /usr/include/bits/errno.h
emdemo.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
emdemo.o: /usr/include/asm-generic/errno.h
emdemo.o: /usr/include/asm-generic/errno-base.h vtext.h fonts.h vga.h
emdemo.o: /usr/include/SDL2/SDL.h /usr/include/SDL2/SDL_main.h
emdemo.o: /usr/include/SDL2/SDL_stdinc.h /usr/include/SDL2/SDL_config.h
emdemo.o: /usr/include/SDL2/SDL_config-x86_64.h
emdemo.o: /usr/include/SDL2/SDL_platform.h /usr/include/SDL2/begin_code.h
emdemo.o: /usr/include/SDL2/close_code.h /usr/include/wchar.h
emdemo.o: /usr/include/bits/types/wint_t.h
emdemo.o: /usr/include/bits/types/mbstate_t.h /usr/include/inttypes.h
emdemo.o: /usr/include/ctype.h /usr/include/SDL2/SDL_assert.h
emdemo.o: /usr/include/SDL2/SDL_atomic.h /usr/include/SDL2/SDL_audio.h
emdemo.o: /usr/include/SDL2/SDL_error.h /usr/include/SDL2/SDL_endian.h
emdemo.o: /usr/include/SDL2/SDL_mutex.h /usr/include/SDL2/SDL_thread.h
emdemo.o: /usr/include/SDL2/SDL_rwops.h /usr/include/SDL2/SDL_clipboard.h
emdemo.o: /usr/include/SDL2/SDL_cpuinfo.h /usr/include/SDL2/SDL_events.h
emdemo.o: /usr/include/SDL2/SDL_video.h /usr/include/SDL2/SDL_pixels.h
emdemo.o: /usr/include/SDL2/SDL_rect.h /usr/include/SDL2/SDL_surface.h
emdemo.o: /usr/include/SDL2/SDL_blendmode.h /usr/include/SDL2/SDL_keyboard.h
emdemo.o: /usr/include/SDL2/SDL_keycode.h /usr/include/SDL2/SDL_scancode.h
emdemo.o: /usr/include/SDL2/SDL_mouse.h /usr/include/SDL2/SDL_joystick.h
emdemo.o: /usr/include/SDL2/SDL_gamecontroller.h /usr/include/SDL2/SDL_quit.h
emdemo.o: /usr/include/SDL2/SDL_gesture.h /usr/include/SDL2/SDL_touch.h
emdemo.o: /usr/include/SDL2/SDL_filesystem.h /usr/include/SDL2/SDL_haptic.h
emdemo.o: /usr/include/SDL2/SDL_hints.h /usr/include/SDL2/SDL_loadso.h
emdemo.o: /usr/include/SDL2/SDL_log.h /usr/include/SDL2/SDL_messagebox.h
emdemo.o: /usr/include/SDL2/SDL_power.h /usr/include/SDL2/SDL_render.h
emdemo.o: /usr/include/SDL2/SDL_sensor.h /usr/include/SDL2/SDL_shape.h
emdemo.o: /usr/include/SDL2/SDL_system.h /usr/include/SDL2/SDL_timer.h
emdemo.o: /usr/include/SDL2/SDL_version.h
emx16demo.o: /usr/include/stdio.h /usr/include/bits/libc-header-start.h
emx16demo.o: /usr/include/features.h /usr/include/stdc-predef.h
emx16demo.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
emx16demo.o: /usr/include/bits/long-double.h /usr/include/gnu/stubs.h
emx16demo.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
emx16demo.o: /usr/include/bits/types/__FILE.h /usr/include/bits/types/FILE.h
emx16demo.o: /usr/include/bits/libio.h /usr/include/bits/_G_config.h
emx16demo.o: /usr/include/bits/types/__mbstate_t.h
emx16demo.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
emx16demo.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
emx16demo.o: /usr/include/bits/waitstatus.h /usr/include/bits/floatn.h
emx16demo.o: /usr/include/bits/floatn-common.h /usr/include/sys/types.h
emx16demo.o: /usr/include/bits/types/clock_t.h
emx16demo.o: /usr/include/bits/types/clockid_t.h
emx16demo.o: /usr/include/bits/types/time_t.h
emx16demo.o: /usr/include/bits/types/timer_t.h
emx16demo.o: /usr/include/bits/stdint-intn.h /usr/include/endian.h
emx16demo.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
emx16demo.o: /usr/include/bits/byteswap-16.h
emx16demo.o: /usr/include/bits/uintn-identity.h /usr/include/sys/select.h
emx16demo.o: /usr/include/bits/select.h /usr/include/bits/types/sigset_t.h
emx16demo.o: /usr/include/bits/types/__sigset_t.h
emx16demo.o: /usr/include/bits/types/struct_timeval.h
emx16demo.o: /usr/include/bits/types/struct_timespec.h
emx16demo.o: /usr/include/sys/sysmacros.h /usr/include/bits/sysmacros.h
emx16demo.o: /usr/include/bits/pthreadtypes.h
emx16demo.o: /usr/include/bits/thread-shared-types.h
emx16demo.o: /usr/include/bits/pthreadtypes-arch.h /usr/include/alloca.h
emx16demo.o: /usr/include/bits/stdlib-float.h /usr/include/string.h
emx16demo.o: /usr/include/bits/types/locale_t.h
emx16demo.o: /usr/include/bits/types/__locale_t.h /usr/include/strings.h
emx16demo.o: /usr/include/math.h /usr/include/bits/math-vector.h
emx16demo.o: /usr/include/bits/libm-simd-decl-stubs.h
emx16demo.o: /usr/include/bits/flt-eval-method.h /usr/include/bits/fp-logb.h
emx16demo.o: /usr/include/bits/fp-fast.h
emx16demo.o: /usr/include/bits/mathcalls-helper-functions.h
emx16demo.o: /usr/include/bits/mathcalls.h /usr/include/bits/iscanonical.h
emx16demo.o: image.h types.h /usr/include/stdint.h /usr/include/bits/wchar.h
emx16demo.o: /usr/include/bits/stdint-uintn.h canvas.h palettes.h memory.h
emx16demo.o: png.h /usr/include/errno.h /usr/include/bits/errno.h
emx16demo.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
emx16demo.o: /usr/include/asm-generic/errno.h
emx16demo.o: /usr/include/asm-generic/errno-base.h vtext.h fonts.h vga.h
emx16demo.o: /usr/include/SDL2/SDL.h /usr/include/SDL2/SDL_main.h
emx16demo.o: /usr/include/SDL2/SDL_stdinc.h /usr/include/SDL2/SDL_config.h
emx16demo.o: /usr/include/SDL2/SDL_config-x86_64.h
emx16demo.o: /usr/include/SDL2/SDL_platform.h /usr/include/SDL2/begin_code.h
emx16demo.o: /usr/include/SDL2/close_code.h /usr/include/wchar.h
emx16demo.o: /usr/include/bits/types/wint_t.h
emx16demo.o: /usr/include/bits/types/mbstate_t.h /usr/include/inttypes.h
emx16demo.o: /usr/include/ctype.h /usr/include/SDL2/SDL_assert.h
emx16demo.o: /usr/include/SDL2/SDL_atomic.h /usr/include/SDL2/SDL_audio.h
emx16demo.o: /usr/include/SDL2/SDL_error.h /usr/include/SDL2/SDL_endian.h
emx16demo.o: /usr/include/SDL2/SDL_mutex.h /usr/include/SDL2/SDL_thread.h
emx16demo.o: /usr/include/SDL2/SDL_rwops.h /usr/include/SDL2/SDL_clipboard.h
emx16demo.o: /usr/include/SDL2/SDL_cpuinfo.h /usr/include/SDL2/SDL_events.h
emx16demo.o: /usr/include/SDL2/SDL_video.h /usr/include/SDL2/SDL_pixels.h
emx16demo.o: /usr/include/SDL2/SDL_rect.h /usr/include/SDL2/SDL_surface.h
emx16demo.o: /usr/include/SDL2/SDL_blendmode.h
emx16demo.o: /usr/include/SDL2/SDL_keyboard.h /usr/include/SDL2/SDL_keycode.h
emx16demo.o: /usr/include/SDL2/SDL_scancode.h /usr/include/SDL2/SDL_mouse.h
emx16demo.o: /usr/include/SDL2/SDL_joystick.h
emx16demo.o: /usr/include/SDL2/SDL_gamecontroller.h
emx16demo.o: /usr/include/SDL2/SDL_quit.h /usr/include/SDL2/SDL_gesture.h
emx16demo.o: /usr/include/SDL2/SDL_touch.h /usr/include/SDL2/SDL_filesystem.h
emx16demo.o: /usr/include/SDL2/SDL_haptic.h /usr/include/SDL2/SDL_hints.h
emx16demo.o: /usr/include/SDL2/SDL_loadso.h /usr/include/SDL2/SDL_log.h
emx16demo.o: /usr/include/SDL2/SDL_messagebox.h /usr/include/SDL2/SDL_power.h
emx16demo.o: /usr/include/SDL2/SDL_render.h /usr/include/SDL2/SDL_sensor.h
emx16demo.o: /usr/include/SDL2/SDL_shape.h /usr/include/SDL2/SDL_system.h
emx16demo.o: /usr/include/SDL2/SDL_timer.h /usr/include/SDL2/SDL_version.h
vga.o: /usr/include/stdio.h /usr/include/bits/libc-header-start.h
vga.o: /usr/include/features.h /usr/include/stdc-predef.h
vga.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
vga.o: /usr/include/bits/long-double.h /usr/include/gnu/stubs.h
vga.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
vga.o: /usr/include/bits/types/__FILE.h /usr/include/bits/types/FILE.h
vga.o: /usr/include/bits/libio.h /usr/include/bits/_G_config.h
vga.o: /usr/include/bits/types/__mbstate_t.h /usr/include/bits/stdio_lim.h
vga.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
vga.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
vga.o: /usr/include/bits/floatn.h /usr/include/bits/floatn-common.h
vga.o: /usr/include/sys/types.h /usr/include/bits/types/clock_t.h
vga.o: /usr/include/bits/types/clockid_t.h /usr/include/bits/types/time_t.h
vga.o: /usr/include/bits/types/timer_t.h /usr/include/bits/stdint-intn.h
vga.o: /usr/include/endian.h /usr/include/bits/endian.h
vga.o: /usr/include/bits/byteswap.h /usr/include/bits/byteswap-16.h
vga.o: /usr/include/bits/uintn-identity.h /usr/include/sys/select.h
vga.o: /usr/include/bits/select.h /usr/include/bits/types/sigset_t.h
vga.o: /usr/include/bits/types/__sigset_t.h
vga.o: /usr/include/bits/types/struct_timeval.h
vga.o: /usr/include/bits/types/struct_timespec.h /usr/include/sys/sysmacros.h
vga.o: /usr/include/bits/sysmacros.h /usr/include/bits/pthreadtypes.h
vga.o: /usr/include/bits/thread-shared-types.h
vga.o: /usr/include/bits/pthreadtypes-arch.h /usr/include/alloca.h
vga.o: /usr/include/bits/stdlib-float.h /usr/include/string.h
vga.o: /usr/include/bits/types/locale_t.h
vga.o: /usr/include/bits/types/__locale_t.h /usr/include/strings.h
vga.o: /usr/include/math.h /usr/include/bits/math-vector.h
vga.o: /usr/include/bits/libm-simd-decl-stubs.h
vga.o: /usr/include/bits/flt-eval-method.h /usr/include/bits/fp-logb.h
vga.o: /usr/include/bits/fp-fast.h
vga.o: /usr/include/bits/mathcalls-helper-functions.h
vga.o: /usr/include/bits/mathcalls.h /usr/include/bits/iscanonical.h image.h
vga.o: types.h /usr/include/stdint.h /usr/include/bits/wchar.h
vga.o: /usr/include/bits/stdint-uintn.h canvas.h palettes.h memory.h vga.h
vga.o: /usr/include/SDL2/SDL.h /usr/include/SDL2/SDL_main.h
vga.o: /usr/include/SDL2/SDL_stdinc.h /usr/include/SDL2/SDL_config.h
vga.o: /usr/include/SDL2/SDL_config-x86_64.h /usr/include/SDL2/SDL_platform.h
vga.o: /usr/include/SDL2/begin_code.h /usr/include/SDL2/close_code.h
vga.o: /usr/include/wchar.h /usr/include/bits/types/wint_t.h
vga.o: /usr/include/bits/types/mbstate_t.h /usr/include/inttypes.h
vga.o: /usr/include/ctype.h /usr/include/SDL2/SDL_assert.h
vga.o: /usr/include/SDL2/SDL_atomic.h /usr/include/SDL2/SDL_audio.h
vga.o: /usr/include/SDL2/SDL_error.h /usr/include/SDL2/SDL_endian.h
vga.o: /usr/include/SDL2/SDL_mutex.h /usr/include/SDL2/SDL_thread.h
vga.o: /usr/include/SDL2/SDL_rwops.h /usr/include/SDL2/SDL_clipboard.h
vga.o: /usr/include/SDL2/SDL_cpuinfo.h /usr/include/SDL2/SDL_events.h
vga.o: /usr/include/SDL2/SDL_video.h /usr/include/SDL2/SDL_pixels.h
vga.o: /usr/include/SDL2/SDL_rect.h /usr/include/SDL2/SDL_surface.h
vga.o: /usr/include/SDL2/SDL_blendmode.h /usr/include/SDL2/SDL_keyboard.h
vga.o: /usr/include/SDL2/SDL_keycode.h /usr/include/SDL2/SDL_scancode.h
vga.o: /usr/include/SDL2/SDL_mouse.h /usr/include/SDL2/SDL_joystick.h
vga.o: /usr/include/SDL2/SDL_gamecontroller.h /usr/include/SDL2/SDL_quit.h
vga.o: /usr/include/SDL2/SDL_gesture.h /usr/include/SDL2/SDL_touch.h
vga.o: /usr/include/SDL2/SDL_filesystem.h /usr/include/SDL2/SDL_haptic.h
vga.o: /usr/include/SDL2/SDL_hints.h /usr/include/SDL2/SDL_loadso.h
vga.o: /usr/include/SDL2/SDL_log.h /usr/include/SDL2/SDL_messagebox.h
vga.o: /usr/include/SDL2/SDL_power.h /usr/include/SDL2/SDL_render.h
vga.o: /usr/include/SDL2/SDL_sensor.h /usr/include/SDL2/SDL_shape.h
vga.o: /usr/include/SDL2/SDL_system.h /usr/include/SDL2/SDL_timer.h
vga.o: /usr/include/SDL2/SDL_version.h
png.o: /usr/include/stdio.h /usr/include/bits/libc-header-start.h
png.o: /usr/include/features.h /usr/include/stdc-predef.h
png.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
png.o: /usr/include/bits/long-double.h /usr/include/gnu/stubs.h
png.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
png.o: /usr/include/bits/types/__FILE.h /usr/include/bits/types/FILE.h
png.o: /usr/include/bits/libio.h /usr/include/bits/_G_config.h
png.o: /usr/include/bits/types/__mbstate_t.h /usr/include/bits/stdio_lim.h
png.o: /usr/include/bits/sys_errlist.h /usr/include/string.h
png.o: /usr/include/bits/types/locale_t.h
png.o: /usr/include/bits/types/__locale_t.h /usr/include/strings.h
png.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
png.o: /usr/include/bits/waitstatus.h /usr/include/bits/floatn.h
png.o: /usr/include/bits/floatn-common.h /usr/include/sys/types.h
png.o: /usr/include/bits/types/clock_t.h /usr/include/bits/types/clockid_t.h
png.o: /usr/include/bits/types/time_t.h /usr/include/bits/types/timer_t.h
png.o: /usr/include/bits/stdint-intn.h /usr/include/endian.h
png.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
png.o: /usr/include/bits/byteswap-16.h /usr/include/bits/uintn-identity.h
png.o: /usr/include/sys/select.h /usr/include/bits/select.h
png.o: /usr/include/bits/types/sigset_t.h
png.o: /usr/include/bits/types/__sigset_t.h
png.o: /usr/include/bits/types/struct_timeval.h
png.o: /usr/include/bits/types/struct_timespec.h /usr/include/sys/sysmacros.h
png.o: /usr/include/bits/sysmacros.h /usr/include/bits/pthreadtypes.h
png.o: /usr/include/bits/thread-shared-types.h
png.o: /usr/include/bits/pthreadtypes-arch.h /usr/include/alloca.h
png.o: /usr/include/bits/stdlib-float.h image.h types.h /usr/include/stdint.h
png.o: /usr/include/bits/wchar.h /usr/include/bits/stdint-uintn.h canvas.h
png.o: palettes.h /usr/include/zlib.h zconf.h /usr/include/limits.h
png.o: /usr/include/bits/posix1_lim.h /usr/include/bits/local_lim.h
png.o: /usr/include/linux/limits.h /usr/include/bits/posix2_lim.h png.h
png.o: /usr/include/errno.h /usr/include/bits/errno.h
png.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
png.o: /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h
image.o: /usr/include/math.h /usr/include/bits/libc-header-start.h
image.o: /usr/include/features.h /usr/include/stdc-predef.h
image.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
image.o: /usr/include/bits/long-double.h /usr/include/gnu/stubs.h
image.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
image.o: /usr/include/bits/math-vector.h
image.o: /usr/include/bits/libm-simd-decl-stubs.h /usr/include/bits/floatn.h
image.o: /usr/include/bits/floatn-common.h
image.o: /usr/include/bits/flt-eval-method.h /usr/include/bits/fp-logb.h
image.o: /usr/include/bits/fp-fast.h
image.o: /usr/include/bits/mathcalls-helper-functions.h
image.o: /usr/include/bits/mathcalls.h /usr/include/bits/iscanonical.h
image.o: /usr/include/stdio.h /usr/include/bits/types/__FILE.h
image.o: /usr/include/bits/types/FILE.h /usr/include/bits/libio.h
image.o: /usr/include/bits/_G_config.h /usr/include/bits/types/__mbstate_t.h
image.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
image.o: /usr/include/string.h /usr/include/bits/types/locale_t.h
image.o: /usr/include/bits/types/__locale_t.h /usr/include/strings.h types.h
image.o: /usr/include/stdint.h /usr/include/bits/wchar.h
image.o: /usr/include/bits/stdint-intn.h /usr/include/bits/stdint-uintn.h
image.o: memory.h image.h canvas.h palettes.h
memory.o: /usr/include/stdlib.h /usr/include/bits/libc-header-start.h
memory.o: /usr/include/features.h /usr/include/stdc-predef.h
memory.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
memory.o: /usr/include/bits/long-double.h /usr/include/gnu/stubs.h
memory.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
memory.o: /usr/include/bits/floatn.h /usr/include/bits/floatn-common.h
memory.o: /usr/include/sys/types.h /usr/include/bits/types.h
memory.o: /usr/include/bits/typesizes.h /usr/include/bits/types/clock_t.h
memory.o: /usr/include/bits/types/clockid_t.h
memory.o: /usr/include/bits/types/time_t.h /usr/include/bits/types/timer_t.h
memory.o: /usr/include/bits/stdint-intn.h /usr/include/endian.h
memory.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
memory.o: /usr/include/bits/byteswap-16.h /usr/include/bits/uintn-identity.h
memory.o: /usr/include/sys/select.h /usr/include/bits/select.h
memory.o: /usr/include/bits/types/sigset_t.h
memory.o: /usr/include/bits/types/__sigset_t.h
memory.o: /usr/include/bits/types/struct_timeval.h
memory.o: /usr/include/bits/types/struct_timespec.h
memory.o: /usr/include/sys/sysmacros.h /usr/include/bits/sysmacros.h
memory.o: /usr/include/bits/pthreadtypes.h
memory.o: /usr/include/bits/thread-shared-types.h
memory.o: /usr/include/bits/pthreadtypes-arch.h /usr/include/alloca.h
memory.o: /usr/include/bits/stdlib-float.h memory.h types.h
memory.o: /usr/include/stdint.h /usr/include/bits/wchar.h
memory.o: /usr/include/bits/stdint-uintn.h /usr/include/string.h
memory.o: /usr/include/bits/types/locale_t.h
memory.o: /usr/include/bits/types/__locale_t.h /usr/include/strings.h
vtext.o: /usr/include/string.h /usr/include/bits/libc-header-start.h
vtext.o: /usr/include/features.h /usr/include/stdc-predef.h
vtext.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
vtext.o: /usr/include/bits/long-double.h /usr/include/gnu/stubs.h
vtext.o: /usr/include/bits/types/locale_t.h
vtext.o: /usr/include/bits/types/__locale_t.h /usr/include/strings.h
vtext.o: /usr/include/stdio.h /usr/include/bits/types.h
vtext.o: /usr/include/bits/typesizes.h /usr/include/bits/types/__FILE.h
vtext.o: /usr/include/bits/types/FILE.h /usr/include/bits/libio.h
vtext.o: /usr/include/bits/_G_config.h /usr/include/bits/types/__mbstate_t.h
vtext.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
vtext.o: image.h types.h /usr/include/stdint.h /usr/include/bits/wchar.h
vtext.o: /usr/include/bits/stdint-intn.h /usr/include/bits/stdint-uintn.h
vtext.o: canvas.h palettes.h vtext.h fonts.h
palettes.o: palettes.h RRRGGGBBs.h
canvas.o: /usr/include/stdio.h /usr/include/bits/libc-header-start.h
canvas.o: /usr/include/features.h /usr/include/stdc-predef.h
canvas.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
canvas.o: /usr/include/bits/long-double.h /usr/include/gnu/stubs.h
canvas.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
canvas.o: /usr/include/bits/types/__FILE.h /usr/include/bits/types/FILE.h
canvas.o: /usr/include/bits/libio.h /usr/include/bits/_G_config.h
canvas.o: /usr/include/bits/types/__mbstate_t.h /usr/include/bits/stdio_lim.h
canvas.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
canvas.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
canvas.o: /usr/include/bits/floatn.h /usr/include/bits/floatn-common.h
canvas.o: /usr/include/sys/types.h /usr/include/bits/types/clock_t.h
canvas.o: /usr/include/bits/types/clockid_t.h
canvas.o: /usr/include/bits/types/time_t.h /usr/include/bits/types/timer_t.h
canvas.o: /usr/include/bits/stdint-intn.h /usr/include/endian.h
canvas.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
canvas.o: /usr/include/bits/byteswap-16.h /usr/include/bits/uintn-identity.h
canvas.o: /usr/include/sys/select.h /usr/include/bits/select.h
canvas.o: /usr/include/bits/types/sigset_t.h
canvas.o: /usr/include/bits/types/__sigset_t.h
canvas.o: /usr/include/bits/types/struct_timeval.h
canvas.o: /usr/include/bits/types/struct_timespec.h
canvas.o: /usr/include/sys/sysmacros.h /usr/include/bits/sysmacros.h
canvas.o: /usr/include/bits/pthreadtypes.h
canvas.o: /usr/include/bits/thread-shared-types.h
canvas.o: /usr/include/bits/pthreadtypes-arch.h /usr/include/alloca.h
canvas.o: /usr/include/bits/stdlib-float.h /usr/include/string.h
canvas.o: /usr/include/bits/types/locale_t.h
canvas.o: /usr/include/bits/types/__locale_t.h /usr/include/strings.h
canvas.o: canvas.h types.h /usr/include/stdint.h /usr/include/bits/wchar.h
canvas.o: /usr/include/bits/stdint-uintn.h palettes.h sincos.h memory.h
