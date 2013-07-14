

    export CFLAGS="-O3"

    export CXX=gcc

    export CXXFLAGS="-O3 -felide-constructors -fno-exceptions -fno-rtti"


cmake . -DCMAKE_INSTALL_PREFIX=$HOME/private/mysql/ -MYSQL_UNIX_ADDR=$HOME/private/mysql/socket -WITH_EXTRA_CHARSETS -DWITH_MYSQLD_LDFLAGS="-all-static --disable-shared"

    ./configure --prefix=$HOME/private/mysql/ --enable-assembler  --with-plugins=innobase --with-mysqld-ldflags=-all-static

    make && make install



--with-tcp-port

--with-unix-socket-path

--with-mysqld-ldflags=-all-static