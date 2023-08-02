AC_INIT([Glorri], [0.0.0])
AC_CONFIG_SRCDIR([glorri.scm])
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE([color-tests parallel-tests -Wall -Werror foreign])

GUILE_PKG([3.0])
GUILE_PROGS
if test "x$GUILD" = "x"; then
   AC_MSG_ERROR(['guild' binary not found; please check your guile-3.x installation.])
fi

AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([pre-inst-env], [chmod +x pre-inst-env])
AC_CONFIG_FILES([scripts/glorri], [chmod +x scripts/glorri])

AC_OUTPUT
