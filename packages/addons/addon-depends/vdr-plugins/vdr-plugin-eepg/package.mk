################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="vdr-plugin-eepg"
PKG_VERSION="9cd9a75"
PKG_SHA256="b5c21e083a0d78251028de55dfb59b47df9db88cbbb811f39e913c2fb4e63ba6"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-eepg"
PKG_URL="http://projects.vdr-developer.org/git/vdr-plugin-eepg.git/snapshot/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_SECTION="multimedia"
PKG_SHORTDESC="vdr-plugin-eepg"
PKG_LONGDESC="This plugin parses the Extended (2 to 10 day) EPG data which is send by providers on their portal channels. This EEPG data is transmitted in a non-standard format on a non-standard PID."

PKG_IS_ADDON="no"

PKG_AUTORECONF="no"

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  export PKG_CONFIG_PATH=$VDR_DIR:$PKG_CONFIG_PATH
  export CPLUS_INCLUDE_PATH=$VDR_DIR/include

  make \
    LIBDIR="." \
    LOCDIR="./locale" \
    all install-i18n
}

post_make_target() {
  VDR_DIR=$(get_build_dir vdr)
  VDR_APIVERSION=`sed -ne '/define APIVERSION/s/^.*"\(.*\)".*$/\1/p' $VDR_DIR/config.h`
  LIB_NAME=lib${PKG_NAME/-plugin/}

  cp --remove-destination $PKG_BUILD/${LIB_NAME}.so $PKG_BUILD/${LIB_NAME}.so.${VDR_APIVERSION}
  $STRIP libvdr-*.so*
}

makeinstall_target() {
  : # installation not needed, done by create-addon script
}
