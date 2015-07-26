# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
SLOT="0"

inherit multilib

DESCRIPTION="Comprehensive Wireless and Network packet based hacking framework.Compare to Metasploit"
HOMEPAGE="https://github.com/Cyb3r-Assassin"
SRC_URI="https://github.com/Cyb3r-Assassin/n4p/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+wireless +mitm +wpe +wps -vpn -extras -networkmanager"

PDEPEND="net-misc/bridge-utils
	>=net-firewall/iptables-1.4.20
	net-misc/dhcpcd
	app-admin/sudo
	sys-apps/iproute2
	x11-terms/xterm
	dev-python/ipaddr
	net-wireless/iw
	sys-apps/openrc
	app-editors/nano
	sys-apps/net-tools
	extras? ( net-analyzer/dhcpdump )
	wireless? ( >=net-wireless/aircrack-ng-1.2_rc1
		net-wireless/rfkill )
        wpe? ( >=net-wireless/hostapd-2.2-r2 )
        wps? ( net-wireless/bully )
	mitm? ( net-analyzer/sslstrip
		net-analyzer/dsniff
		>=net-analyzer/ettercap-0.8.0-r1 )
	vpn? ( net-misc/openvpn )
	networkmanager? ( net-misc/networkmanager )"

src_install() {
	dodoc changes README.md

	exeinto /usr/$(get_libdir)/${PN}
	doexe n4p.sh
	
	exeinto /usr/$(get_libdir)/${PN}/modules
        doexe airbase bridge bully cracking dhcp dump example hostapd monitor firewall rebuild_network recon wash wpe

	dosym /usr/$(get_libdir)/${PN}/n4p.sh /usr/bin/n4p

	insinto /usr/share/${PN}
	doins auth.logo die.logo dump.logo firewall.logo monitor.logo opening.logo recon.logo zed.logo wash.logo

	insinto /etc/${PN}
	doins dhcpd.conf n4p.conf
}