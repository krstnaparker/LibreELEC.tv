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

PKG_NAME="libshairplay"
PKG_VERSION="ce80e00"
PKG_SHA256="49ac0e0470ec6367f720c7b79a09165138f57b60f5949a2d9c38be5823d13294"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/juhovh/shairplay"
PKG_URL="https://github.com/juhovh/shairplay/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="shairplay-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="network"
PKG_SHORTDESC="libshairplay: emulates AirPort Express"
PKG_LONGDESC="libshairPlay emulates an AirPort Express for the purpose of streaming music from iTunes and compatible iPods."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

post_makeinstall_target() {
  mkdir -p $INSTALL/etc/shairplay
    cp -P ../airport.key $INSTALL/etc/shairplay
}
