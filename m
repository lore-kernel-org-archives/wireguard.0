Return-Path: <SRS0=3Rrq=4D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A082CC7114E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 19:29:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21CF92082F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 19:29:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sgregoratto.me header.i=@sgregoratto.me header.b="Wrm25zQb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="y7EA1GTh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21CF92082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=sgregoratto.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65ec9790;
	Sat, 15 Feb 2020 19:25:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e33a95e8
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 00:44:12 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4a988d6
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 00:44:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A3CD821C24;
 Fri, 14 Feb 2020 19:46:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 14 Feb 2020 19:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sgregoratto.me;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ChD7zyPcOQAX/
 UED3lY7JkxjSZA9aBa1CIdBxOop32U=; b=Wrm25zQbhXhh/K6Tho8iaeotkin9m
 Ck+CCRYs+eTq8fylH3g2doRUdkv4f05pRCJpwKkUFvyR6US/i8ITeHjxsdBgYsEw
 DAiodtqjMgeJPo7T18GmCnpIx16VFMO0VsS0vu/W6eHRdZIrv4jqnBiGkSLYg+r8
 5zkILXQ9Kdm7hnxl0kCCDPay4snjLPfSGigsWUnlxQCF8ExW7PX8aM+qtu/3UedZ
 HTpmxaIrwRIsC1TjxepGOMiAjTlJSXnoCaENXDWow1Asa1X5lysTHo7s8m5zP9ju
 O4139MuVnBQb/Ve/JuXZcbAMlzOaVWH2sNtugp+tDFE8PpnYC7GiV1emA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ChD7zyPcOQAX/UED3lY7JkxjSZA9aBa1CIdBxOop32U=; b=y7EA1GTh
 CxWGnWipYbtkXArEnmWtuw7AgyB1MeDIMQWOJNzMqJXJoEmsIbeAg8N3QvsJ4azn
 I737m+WNHZoGYKG1ik70116qBahrO8EtplLwbZoAOpXY07TlXZVT+cG9st9uhGHh
 mP94l5SftDQjfh8iXw4UF6Ei+vT/f9TRlKUTzNUYXDskw8DV+6/Z6hdY9h0zXmmS
 nuuk8nCe7R4WJglrrAvUuh58ch/ubKj8+ijq+afKmZIf98SmVFXcwDdjYwjFIk3l
 uU5CI/KcjXbeA4CVqFXCcDVjlKq5GvTVg8oERa8GQuFKwpGFFMAYknc/R9oYBZqN
 XHDn7XTb6nVmPQ==
X-ME-Sender: <xms:Xj9HXhGGjgl9KHcqqcjD8Lgo50YwHHQaKziOcOm4rIRZ_FGVrILv1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedugddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefuthgvphhhvghnucfirhgvghhorhgrthhtohcuoeguvghvsehs
 ghhrvghgohhrrghtthhordhmvgeqnecuffhomhgrihhnpeifihhrvghguhgrrhgurdgtoh
 hmpdhfihhlvgdrphgrnecukfhppeehkedrudejledrgeegrddujedvnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvrhhsohhnrghlsehsgh
 hrvghgohhrrghtthhordhmvg
X-ME-Proxy: <xmx:Xj9HXs36O9mM-gt9ff_G0TyYSlaI9PucXeW1dNzpPB9koxeXZS9cJw>
 <xmx:Xj9HXhICxPVVLqLbC-n8v3zusHUtE0iR6LXKPVblMG-WyMrNwjFIHQ>
 <xmx:Xj9HXp1Zk1DR_fBwkrrKWZIJqpxfRZiTFKmoq9fdFkj_iVxoKVWLPA>
 <xmx:Xj9HXglDDxF24I0zakbTo6rJzDFi87mkkccxMB5p4VsiUIJ8k_gYnQ>
Received: from localhost (172.44.179.58.sta.dodo.net.au [58.179.44.172])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5EE123280060;
 Fri, 14 Feb 2020 19:46:21 -0500 (EST)
From: Stephen Gregoratto <dev@sgregoratto.me>
To: discuss@mandoc.bsd.lv
Subject: [PATCH v2] Rewrite wg-quick.8 in mdoc
Date: Sat, 15 Feb 2020 11:45:56 +1100
Message-Id: <20200215004556.11766-1-dev@sgregoratto.me>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213044921.8115-1-dev@sgregoratto.me>
References: <20200213044921.8115-1-dev@sgregoratto.me>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 15 Feb 2020 20:25:56 +0100
Cc: Stephen Gregoratto <dev@sgregoratto.me>, wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Since the program arguments are semantically marked-up as such, I've
made them lower-case so the manual isn't yelling at us.

Some of text has been reworded slightly to better fit manpage
conventions. I've also wrapped the text to 80 chars.

Signed-off-by: Stephen Gregoratto <dev@sgregoratto.me>
---
For some reason, groff produces this warning, even though it's formatted
correctly:

troff: wg-quick.8:314: name expected (got '\c'): treated as missing

I'm working on simplifying the structure of wg.8 in addition to
rewriting it, which will take some time.

 src/man/wg-quick.8 | 564 ++++++++++++++++++++++++---------------------
 1 file changed, 303 insertions(+), 261 deletions(-)

diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8
index c38c7d9..2ed90a5 100644
--- a/src/man/wg-quick.8
+++ b/src/man/wg-quick.8
@@ -1,277 +1,319 @@
-.TH WG-QUICK 8 "2016 January 1" ZX2C4 "WireGuard"
-
-.SH NAME
-wg-quick - set up a WireGuard interface simply
-
-.SH SYNOPSIS
-.B wg-quick
-[
-.I up
-|
-.I down
-|
-.I save
-|
-.I strip
-] [
-.I CONFIG_FILE
-|
-.I INTERFACE
-]
-
-.SH DESCRIPTION
-
+.Dd February 14, 2020
+.Dt WG-QUICK 8
+.Os
+.Sh NAME
+.Nm wg-quick
+.Nd set up a WireGuard interface simply
+.Sh SYNOPSIS
+.Nm
+.Op Cm up | down | sconfig-file
+.Op Ar config-file
+.Op Ar interface
+.Sh DESCRIPTION
 This is an extremely simple script for easily bringing up a WireGuard interface,
 suitable for a few common use cases.
-
-Use \fIup\fP to add and set up an interface, and use \fIdown\fP to tear down and remove
-an interface. Running \fIup\fP adds a WireGuard interface, brings up the interface with the
-supplied IP addresses, sets up mtu and routes, and optionally runs pre/post up scripts. Running \fIdown\fP
-optionally saves the current configuration, removes the WireGuard interface, and optionally
-runs pre/post down scripts. Running \fIsave\fP saves the configuration of an existing
-interface without bringing the interface down. Use \fIstrip\fP to output a configuration file
-with all
-.BR wg-quick (8)-specific
+.Pp
+Use
+.Cm up
+to add and set up an interface, and use
+.Cm down
+to tear down and remove an interface.
+Running
+.Cm up
+adds a WireGuard interface, brings up the interface with the supplied IP
+addresses, sets up mtu and routes, and optionally runs pre/post up scripts.
+Running
+.Cm down
+optionally saves the current configuration, removes the WireGuard interface, and
+optionally runs pre/post down scripts.
+Running
+.Cm save
+saves the configuration of an existing interface without bringing the interface
+down.
+Use
+.Cm strip
+to output a configuration file with all
+.Nm Ns -specific
 options removed, suitable for use with
-.BR wg (8).
-
-\fICONFIG_FILE\fP is a configuration file, whose filename is the interface name
-followed by `.conf'. Otherwise, \fIINTERFACE\fP is an interface name, with configuration
-found at `/etc/wireguard/\fIINTERFACE\fP.conf', searched first, followed by distro-specific
-search paths.
-
-Generally speaking, this utility is just a simple script that wraps invocations to
-.BR wg (8)
+.Xr wg 8 .
+.Pp
+.Ar config-file
+is a configuration file, whose filename is the interface name followed by
+.Ql \&.conf .
+Otherwise,
+.Ar interface
+is an interface name, with configuration found at
+.Pa /etc/wireguard/interface.conf ,
+searched first, followed by distro-specific search paths.
+.Pp
+Generally speaking, this utility is just a simple script that wraps invocations
+to
+.Xr wg 8
 and
-.BR ip (8)
-in order to set up a WireGuard interface. It is designed for users with simple
-needs, and users with more advanced needs are highly encouraged to use a more
-specific tool, a more complete network manager, or otherwise just use
-.BR wg (8)
+.Xr ip 8
+in order to set up a WireGuard interface.
+It is designed for users with simple needs, and users with more advanced needs
+are highly encouraged to use a more specific tool, a more complete network
+manager, or otherwise just use
+.Xr wg 8
 and
-.BR ip (8),
+.Xr ip 8
 as usual.
-
-.SH CONFIGURATION
-
-The configuration file adds a few extra configuration values to the format understood by
-.BR wg (8)
-in order to configure additional attributes of an interface. It handles the
-values that it understands, and then it passes the remaining ones directly to
-.BR wg (8)
+.Sh CONFIGURATION
+The configuration file adds a few extra configuration values to the format
+understood by
+.Xr wg 8
+in order to configure additional attributes of an interface.
+It handles the values that it understands, and then it passes the remaining ones
+directly to
+.Xr wg 8
 for further processing.
-
+.Pp
 It infers all routes from the list of peers' allowed IPs, and automatically adds
-them to the system routing table. If one of those routes is the default route
+them to the system routing table.
+If one of those routes is the default route
 (0.0.0.0/0 or ::/0), then it uses
-.BR ip-rule (8)
+.Xr ip-rule 8
 to handle overriding of the default gateway.
-
-The configuration file will be passed directly to \fBwg\fP(8)'s `setconf'
-sub-command, with the exception of the following additions to the \fIInterface\fP section,
-which are handled by this tool:
-
-.IP \(bu
-Address \(em a comma-separated list of IP (v4 or v6) addresses (optionally with CIDR masks)
-to be assigned to the interface. May be specified multiple times.
-.IP \(bu
-DNS \(em a comma-separated list of IP (v4 or v6) addresses to be set as the interface's
-DNS servers. May be specified multiple times. Upon bringing the interface up, this runs
-`resolvconf -a tun.\fIINTERFACE\fP -m 0 -x` and upon bringing it down, this runs
-`resolvconf -d tun.\fIINTERFACE\fP`. If these particular invocations of
-.BR resolvconf (8)
-are undesirable, the PostUp and PostDown keys below may be used instead.
-.IP \(bu
-MTU \(em if not specified, the MTU is automatically determined from the endpoint addresses
-or the system default route, which is usually a sane choice. However, to manually specify
-an MTU to override this automatic discovery, this value may be specified explicitly.
-.IP \(bu
-Table \(em Controls the routing table to which routes are added. There are two
-special values: `off' disables the creation of routes altogether, and `auto'
+.Pp
+The configuration file will be passed directly to
+.Xr wg 8 Ap s
+.Cm setconf
+sub-command, with the exception of the following additions to the INTERFACE
+section, which are handled by this tool:
+.Bl -tag -width Ds
+.It Cm Address
+A comma-separated list of IP (v4 or v6) addresses (optionally with CIDR masks)
+to be assigned to the interface.
+May be specified multiple times.
+.It Cm DNS
+A comma-separated list of IP (v4 or v6) addresses to be set as the interface's
+DNS servers.
+May be specified multiple times.
+Upon bringing the interface up, this runs
+.Pp
+.Dl resolvconf -a tun.interface -m 0 -x
+.Pp
+and upon
+bringing it down, this runs
+.Pp
+.Dl resolvconf -d tun.interface .
+.Pp
+If these particular invocations of
+.Xr resolvconf 8
+are undesirable, the
+.Cm PostUp
+and
+.Cm PostDown
+keys below may be used instead.
+.It Cm MTU
+If not specified, the MTU is automatically determined from the endpoint
+addresses or the system default route, which is usually a sane choice.
+However, to manually specify an MTU to override this automatic discovery, this
+value may be specified explicitly.
+.It Cm Table
+Controls the routing table to which routes are added.
+There are two special values:
+.Cm off
+disables the creation of routes altogether, and
+.Cm auto
 (the default) adds routes to the default table and enables special handling of
 default routes.
-.IP \(bu
-PreUp, PostUp, PreDown, PostDown \(em script snippets which will be executed by
-.BR bash (1)
-before/after setting up/tearing down the interface, most commonly used
-to configure custom DNS options or firewall rules. The special string `%i'
-is expanded to \fIINTERFACE\fP. Each one may be specified multiple times, in which case
-the commands are executed in order.
-.IP \(bu
-SaveConfig \(em if set to `true', the configuration is saved from the current state of the
-interface upon shutdown.
-
-.P
-Recommended \fIINTERFACE\fP names include `wg0' or `wgvpn0' or even `wgmgmtlan0'.
+.It Cm PreUp , PostUp , PreDown , PostDown
+Script snippets which will be executed by
+.Xr bash 1
+before/after setting up/tearing down the interface, most commonly used to
+configure custom DNS options or firewall rules.
+The special string
+.Ql %i
+is expanded to
+.Ar interface .
+Each one may be specified multiple times, in which case the commands are
+executed in order.
+.It Cm SaveConfig
+If set to
+.Cm true ,
+the configuration is saved from the current state of the interface upon
+shutdown.
+.El
+.Pp
+Recommended
+.Ar interface
+names include
+.Ql wg0
+or
+.Ql wgvpn0
+or even
+.Ql wgmgmtlan0 .
 However, the number at the end is in fact optional, and really
-any free-form string [a-zA-Z0-9_=+.-]{1,15} will work. So even interface names corresponding
-to geographic locations would suffice, such as `cincinnati', `nyc', or `paris', if that's
-somehow desirable.
-
-.SH EXAMPLES
-
+any free-form string [a-zA-Z0-9_=+.-]{1,15} will work.
+So even interface names corresponding to geographic locations would suffice,
+such as
+.Ql cincinnati , nyc
+or
+.Ql paris ,
+if that's somehow desirable.
+.Sh EXAMPLES
 These examples draw on the same syntax found for
-.BR wg (8),
-and a more complete description may be found there. Bold lines below are for options that extend
-.BR wg (8).
-
-The following might be used for connecting as a client to a VPN gateway for tunneling all
-traffic:
-
-    [Interface]
-.br
-    \fBAddress = 10.200.100.8/24\fP
-.br
-    \fBDNS = 10.200.100.1\fP
-.br
-    PrivateKey = oK56DE9Ue9zK76rAc8pBl6opph+1v36lm7cXXsQKrQM=
-.br
-
-.br
-    [Peer]
-.br
-    PublicKey = GtL7fZc/bLnqZldpVofMCD6hDjrK28SsdLxevJ+qtKU=
-.br
-    PresharedKey = /UwcSPg38hW/D9Y3tcS1FOV0K1wuURMbS0sesJEP5ak=
-.br
-    AllowedIPs = 0.0.0.0/0
-.br
-    Endpoint = demo.wireguard.com:51820
-.br
-
-The `Address` field is added here in order to set up the address for the interface. The `DNS` field
-indicates that a DNS server for the interface should be configured via
-.BR resolvconf (8).
-The peer's allowed IPs entry implies that this interface should be configured as the default gateway,
-which this script does.
-
-Building on the last example, one might attempt the so-called ``kill-switch'', in order
-to prevent the flow of unencrypted packets through the non-WireGuard interfaces, by adding the following
-two lines `PostUp` and `PreDown` lines to the `[Interface]` section:
-
-    \fBPostUp = iptables -I OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT\fP
-.br
-    \fBPreDown = iptables -D OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT\fP
-.br
-
-The `PostUp' and `PreDown' fields have been added to specify an
-.BR iptables (8)
-command which, when used with interfaces that have a peer that specifies 0.0.0.0/0 as part of the
-`AllowedIPs', works together with wg-quick's fwmark usage in order to drop all packets that
-are either not coming out of the tunnel encrypted or not going through the tunnel itself. (Note
-that this continues to allow most DHCP traffic through, since most DHCP clients make use of PF_PACKET
-sockets, which bypass Netfilter.) When IPv6 is in use, additional similar lines could be added using
-.BR ip6tables (8).
-
-Or, perhaps it is desirable to store private keys in encrypted form, such as through use of
-.BR pass (1):
-
-    \fBPostUp = wg set %i private-key <(pass WireGuard/private-keys/%i)\fP
-.br
-
-For use on a server, the following is a more complicated example involving multiple peers:
-
-    [Interface]
-.br
-    \fBAddress = 10.192.122.1/24\fP
-.br
-    \fBAddress = 10.10.0.1/16\fP
-.br
-    \fBSaveConfig = true\fP
-.br
-    PrivateKey = yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=
-.br
-    ListenPort = 51820
-.br
-
-.br
-    [Peer]
-.br
-    PublicKey = xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=
-.br
-    AllowedIPs = 10.192.122.3/32, 10.192.124.1/24
-.br
-
-.br
-    [Peer]
-.br
-    PublicKey = TrMvSoP4jYQlY6RIzBgbssQqY3vxI2Pi+y71lOWWXX0=
-.br
-    AllowedIPs = 10.192.122.4/32, 192.168.0.0/16
-.br
-
-.br
-    [Peer]
-.br
-    PublicKey = gN65BkIKy1eCE9pP1wdc8ROUtkHLF2PfAqYdyYBz6EA=
-.br
-    AllowedIPs = 10.10.10.230/32
-
-Notice the two `Address' lines at the top, and that `SaveConfig' is set to `true', indicating
-that the configuration file should be saved on shutdown using the current status of the
-interface.
-
-A combination of the `Table', `PostUp', and `PreDown' fields may be used for policy routing
-as well. For example, the following may be used to send SSH traffic (TCP port 22) traffic
+.Xr wg 8 ,
+and a more complete description may be found there.
+.Pp
+The following might be used for connecting as a client to a VPN gateway for
+tunneling all traffic:
+.Bd -literal -offset indent
+[Interface]
+Address = 10.200.100.8/24
+DNS = 10.200.100.1
+PrivateKey = oK56DE9Ue9zK76rAc8pBl6opph+1v36lm7cXXsQKrQM=
+
+[Peer]
+PublicKey = GtL7fZc/bLnqZldpVofMCD6hDjrK28SsdLxevJ+qtKU=
+PresharedKey = /UwcSPg38hW/D9Y3tcS1FOV0K1wuURMbS0sesJEP5ak=
+AllowedIPs = 0.0.0.0/0
+Endpoint = demo.wireguard.com:51820
+.Ed
+.Pp
+The
+.Cm Address
+field is added here in order to set up the address for the interface.
+The
+.Cm DNS
+field indicates that a DNS server for the interface should
+be configured via
+.Xr resolvconf 8 .
+The peer's allowed IPs entry implies that this interface should be configured as
+the default gateway, which this script does.
+.Pp
+Building on the last example, one might attempt the so-called
+.Dq kill-switch ,
+in order to prevent the flow of unencrypted packets through the non-WireGuard
+interfaces, by adding the following two lines
+.Cm PostUp
+and
+.Cm PreDown
+lines to
+.Cm [Interface]
+section:
+.Bd -literal -offset indent
+PostUp = iptables -I OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT
+PreDown = iptables -D OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT
+.Ed
+.Pp
+The
+.Cm PostUp
+and
+.Cm PreDown
+fields have been added to specify an
+.Xr iptables 8
+command which, when used with interfaces that have a peer that specifies
+0.0.0.0/0 as part of the
+.Cm AllowedIPs ,
+works together with
+.Nm Ap s
+fwmark usage in order to drop all packets that are either not coming out of the
+tunnel encrypted or not going through the tunnel itself.
+(Note that this continues to allow most DHCP traffic through, since most DHCP
+clients make use of PF_PACKET sockets, which bypass Netfilter.)
+When IPv6 is in use, additional similar lines could be added using
+.Xr ip6tables 8 .
+.Pp
+Or, perhaps it is desirable to store private keys in encrypted form, such as
+through use of
+.Xr pass 1 :
+.Pp
+.Dl PostUp = wg set %i private-key <(pass WireGuard/private-keys/%i)
+.Pp
+For use on a server, the following is a more complicated example involving
+multiple peers:
+.Bd -literal -offset indent
+[Interface]
+Address = 10.192.122.1/24
+Address = 10.10.0.1/16
+SaveConfig = true
+PrivateKey = yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=
+ListenPort = 51820
+
+[Peer]
+PublicKey = xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=
+AllowedIPs = 10.192.122.3/32, 10.192.124.1/24
+
+[Peer]
+PublicKey = TrMvSoP4jYQlY6RIzBgbssQqY3vxI2Pi+y71lOWWXX0=
+AllowedIPs = 10.192.122.4/32, 192.168.0.0/16
+
+[Peer]
+PublicKey = gN65BkIKy1eCE9pP1wdc8ROUtkHLF2PfAqYdyYBz6EA=
+AllowedIPs = 10.10.10.230/32
+.Ed
+.Pp
+Notice the two
+.Cm Address
+lines at the top, and that
+.Cm SaveConfig
+is set to
+.Cm true ,
+indicating that the configuration file should be saved on shutdown using
+the current status of the interface.
+.Pp
+A combination of the
+.Cm Table , PostUp
+and
+.Cm PreDown
+fields may be used for policy routing as well.
+For example, the following may be used to send SSH traffic (TCP port 22) traffic
 through the tunnel:
-
-    [Interface]
-.br
-    Address = 10.192.122.1/24
-.br
-    PrivateKey = yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=
-.br
-    ListenPort = 51820
-.br
-    \fBTable = 1234\fP
-.br
-    \fBPostUp = ip rule add ipproto tcp dport 22 table 1234\fP
-.br
-    \fBPreDown = ip rule delete ipproto tcp dport 22 table 1234\fP
-.br
-
-.br
-    [Peer]
-.br
-    PublicKey = xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=
-.br
-    AllowedIPs = 0.0.0.0/0
-
-These configuration files may be placed in any directory, putting the desired interface name
-in the filename:
-
-\fB    # wg-quick up /path/to/wgnet0.conf\fP
-
-For convenience, if only an interface name is supplied, it automatically chooses a path in
-`/etc/wireguard/':
-
-\fB    # wg-quick up wgnet0\fP
-
-This will load the configuration file `/etc/wireguard/wgnet0.conf'.
-
-The \fIstrip\fP command is useful for reloading configuration files without disrupting active
+.Bd -literal -offset indent
+[Interface]
+Address = 10.192.122.1/24
+PrivateKey = yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=
+ListenPort = 51820
+Table = 1234
+PostUp = ip rule add ipproto tcp dport 22 table 1234
+PreDown = ip rule delete ipproto tcp dport 22 table 1234
+
+[Peer]
+PublicKey = xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=
+AllowedIPs = 0.0.0.0/0
+.Ed
+.Pp
+These configuration files may be placed in any directory, putting the desired
+interface name in the filename:
+.Pp
+.Dl # wg-quick up /path/to/wgnet0.conf
+.Pp
+For convenience, if only an interface name is supplied, it automatically chooses
+a path in
+.Pa /etc/wireguard :
+.Pp
+.Dl # wg-quick up wgnet0
+.Pp
+This will load the configuration file
+.Pa /etc/wireguard/wgnet0.conf .
+.Pp
+The
+.Cm strip
+command is useful for reloading configuration files without disrupting active
 sessions:
-
-\fB    # wg addconf wgnet0 <(wg-quick strip wgnet0)\fP
-
-(Note that the above command will add and update peers but will not remove peers.)
-
-.SH SEE ALSO
-.BR wg (8),
-.BR ip (8),
-.BR ip-link (8),
-.BR ip-address (8),
-.BR ip-route (8),
-.BR ip-rule (8),
-.BR resolvconf (8).
-
-.SH AUTHOR
-.B wg-quick
-was written by
-.MT Jason@zx2c4.com
-Jason A. Donenfeld
-.ME .
-For updates and more information, a project page is available on the
-.UR https://\:www.wireguard.com/
-World Wide Web
-.UE .
+.Pp
+.Dl # wg addconf wgnet0 <(wg-quick strip wgnet0)
+.Pp
+(Note that the above command will add and update peers but will not remove
+peers.)
+.Sh SEE ALSO
+.Xr pass 1 ,
+.Xr ip 8 ,
+.Xr ip-address 8 ,
+.Xr ip-link 8 ,
+.Xr ip-route 8 ,
+.Xr ip-rule 8 ,
+.Xr iptables 8 ,
+.Xr resolvconf 8 ,
+.Xr wg 8
+.Pp
+For updates and more information, a project page is available at
+.Lk https://www.wireguard.com .
+.Sh AUTHORS
+The
+.Nm
+program was written by
+.An Jason A. Donenfeld Aq Mt Jason@zx2c4.com .
-- 
2.25.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
