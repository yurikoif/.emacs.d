git clone --single-branch --branch emacs-27 --depth 1 https://github.com/emacs-mirror/emacs.git
cd emacs/
sudo apt install -y autoconf make gcc texinfo libgtk-3-dev libxpm-dev \
     libjpeg-dev libgif-dev libtiff5-dev libgnutls28-dev libncurses5-dev \
     libjansson-dev libharfbuzz-dev libharfbuzz-bin
./autogen.sh
./configure --with-json --with-modules --with-harfbuzz --with-compress-install \
            --with-threads --with-included-regex --with-zlib --without-sound \
            --without-xpm --without-jpeg --without-tiff --without-gif --without-png \
            --without-rsvg --without-imagemagick  --without-toolkit-scroll-bars \
            --without-gpm --without-dbus --without-makeinfo --without-pop \
            --without-mailutils --without-gsettings --without-pop --without-mailutils
make
sudo make install
