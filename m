Return-Path: <SRS0=9zSt=4B=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CA5C2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 Feb 2020 16:32:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61FD4217F4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 Feb 2020 16:32:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Ew783Snu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61FD4217F4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3a7ccce;
	Thu, 13 Feb 2020 16:29:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b01fe0d
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Feb 2020 16:29:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17450547
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Feb 2020 16:29:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id caebffd2
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Feb 2020 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=o+3YO7y6VSC05KoN8v3x3QI4yOw=; b=Ew783S
 nuB8OPX2nOUvqhujzRoCOw2nvg9IKdmYUHLKvBMR3bnO2bQJZ1ba43fsAUDVwi0f
 M2hvAP58BSWhRxBG2OopE3+P78AzvHByL+ubaHD2yJwRO7K26VNZ34xqKk4WUyki
 BD4FOJQdUZpSTLN1k2Xpx65RlTXAvABTch8V8a7cI3N1qiSdpyWtXPAmnfdSMEAZ
 i/X1dhyO2/DQ6rvqTVVFUeVQgJllTOU3j3Fl9n9mBo1dKGNC7xpDGtq09WtRsktf
 k4K7YDV7pqjhZ3solCD6zDNMG6pxK+WhB7MwZEFValXZnz200O0STaHj8/nDy6/C
 T7FjZFe2roAcj39A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e75e556d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Feb 2020 16:29:54 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id q81so6401666oig.0
 for <wireguard@lists.zx2c4.com>; Thu, 13 Feb 2020 08:31:53 -0800 (PST)
X-Gm-Message-State: APjAAAWPPkZEjxyhPdf2SObORspa29fvr5bpiJr3H2wDdmSgM2mVZy/b
 WSpXRxBQpxXQo1FCIEkSCtpjEzkb7gDV0Bjf2eM=
X-Google-Smtp-Source: APXvYqxvc2Mp4q42pNJDhnhqIQJX1EQnHKZgyQtV1J8HpC2M9YBheX844f7yGsQXl/MulEUMjUbfGF9XmeTjbeHHrok=
X-Received: by 2002:aca:2109:: with SMTP id 9mr3250828oiz.119.1581611512478;
 Thu, 13 Feb 2020 08:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20200213042900.2ed2sbhglg5uzjq5@BlackBox>
 <20200213044921.8115-1-dev@sgregoratto.me>
In-Reply-To: <20200213044921.8115-1-dev@sgregoratto.me>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 13 Feb 2020 17:31:41 +0100
X-Gmail-Original-Message-ID: <CAHmME9r9fF28_J=D73qZtgfcS6wLtbywEVf9eu_TyZff=0LmhQ@mail.gmail.com>
Message-ID: <CAHmME9r9fF28_J=D73qZtgfcS6wLtbywEVf9eu_TyZff=0LmhQ@mail.gmail.com>
Subject: Re: [PATCH] Fix formatting in wg-quick(8)
To: Stephen Gregoratto <dev@sgregoratto.me>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, discuss@mandoc.bsd.lv
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

Hi Stephen,

Thanks for the patch! I really appreciate it. A few comments in-line
below. Could you CC v2 of this to wireguard@lists.zx2c4.com?

Also, how would you feel about doing the same to wg.8 (in the same
repo)? It has basically the same set of issues.

Jason

On Thu, Feb 13, 2020 at 5:50 AM Stephen Gregoratto <dev@sgregoratto.me> wrote:
>
> - Wrap all text at 80 chars.
> - Put all config examples/code in their blocks and eliminate the use
>   of explicit breaks (.br).
> - Replace all empty lines with explicit paragraph breaks.
> - Simplify synopsis formatting. Command modifiers are now emboldened,
>   based on output from mandoc's mdoc -> man conversion.
> ---

This commit needs your `Signed-off-by: Stephen Gregoratto
<dev@sgregoratto.me>` line at the bottom for it to be accepted.

>  src/man/wg-quick.8 | 394 +++++++++++++++++++++------------------------
>  1 file changed, 186 insertions(+), 208 deletions(-)
>
> diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8
> index c38c7d9..215e789 100644
> --- a/src/man/wg-quick.8
> +++ b/src/man/wg-quick.8
> @@ -1,46 +1,35 @@
> -.TH WG-QUICK 8 "2016 January 1" ZX2C4 "WireGuard"
> -
> +.TH WG-QUICK 8 "2019-02-13" ZX2C4 "WireGuard"

It's 2020 now, but what would you think of retaining the original
date? Or do you usually bump it on every change? I'm not sure what the
convention is.

>  .SH NAME
> -wg-quick - set up a WireGuard interface simply
> -
> +\fBwg-quick\fR
> +\- set up a WireGuard interface simply

Similar change needed for wg(8) too of course.

>  .SH SYNOPSIS
> -.B wg-quick
> -[
> -.I up
> -|
> -.I down
> -|
> -.I save
> -|
> -.I strip
> -] [
> -.I CONFIG_FILE
> -|
> -.I INTERFACE
> -]
> -
> +\fBwg-quick\fR
> +[\fBup\fR\ |\ \fBdown\fR\ |\ \fBsave\fR\ |\ \fBstrip\fR]
> +[\fICONFIG-FILE\fR]
> +[\fIINTERFACE\fR]
>  .SH DESCRIPTION

Doing it like this is a lot more readable. Thanks.

> -
>  This is an extremely simple script for easily bringing up a WireGuard interface,
>  suitable for a few common use cases.
> -
> -Use \fIup\fP to add and set up an interface, and use \fIdown\fP to tear down and remove
> -an interface. Running \fIup\fP adds a WireGuard interface, brings up the interface with the
> -supplied IP addresses, sets up mtu and routes, and optionally runs pre/post up scripts. Running \fIdown\fP
> -optionally saves the current configuration, removes the WireGuard interface, and optionally
> -runs pre/post down scripts. Running \fIsave\fP saves the configuration of an existing
> -interface without bringing the interface down. Use \fIstrip\fP to output a configuration file
> -with all
> -.BR wg-quick (8)-specific
> +.PP
> +Use \fBup\fP to add and set up an interface, and use \fBdown\fP to tear down and
> +remove an interface. Running \fBup\fP adds a WireGuard interface, brings up the
> +interface with the supplied IP addresses, sets up mtu and routes, and optionally
> +runs pre/post up scripts. Running \fBdown\fP optionally saves the current
> +configuration, removes the WireGuard interface, and optionally runs pre/post
> +down scripts. Running \fBsave\fP saves the configuration of an existing
> +interface without bringing the interface down. Use \fBstrip\fP to output a
> +configuration file with all
> +.BR wg-quick \-specific
>  options removed, suitable for use with
>  .BR wg (8).

Looks like you removed the (8) on wg-quick there by accident.

> -
> +.PP
>  \fICONFIG_FILE\fP is a configuration file, whose filename is the interface name
> -followed by `.conf'. Otherwise, \fIINTERFACE\fP is an interface name, with configuration
> -found at `/etc/wireguard/\fIINTERFACE\fP.conf', searched first, followed by distro-specific
> -search paths.
> -
> -Generally speaking, this utility is just a simple script that wraps invocations to
> +followed by `.conf'. Otherwise, \fIINTERFACE\fP is an interface name, with
> +configuration found at `/etc/wireguard/\fIINTERFACE\fP.conf', searched first,
> +followed by distro-specific search paths.
> +.PP
> +Generally speaking, this utility is just a simple script that wraps invocations
> +to
>  .BR wg (8)
>  and
>  .BR ip (8)
> @@ -51,40 +40,40 @@ specific tool, a more complete network manager, or otherwise just use
>  and
>  .BR ip (8),
>  as usual.
> -
>  .SH CONFIGURATION
> -
> -The configuration file adds a few extra configuration values to the format understood by
> +The configuration file adds a few extra configuration values to the format
> +understood by
>  .BR wg (8)
>  in order to configure additional attributes of an interface. It handles the
>  values that it understands, and then it passes the remaining ones directly to
>  .BR wg (8)
>  for further processing.
> -
> +.PP
>  It infers all routes from the list of peers' allowed IPs, and automatically adds
>  them to the system routing table. If one of those routes is the default route
>  (0.0.0.0/0 or ::/0), then it uses
>  .BR ip-rule (8)
>  to handle overriding of the default gateway.
> -
> +.PP
>  The configuration file will be passed directly to \fBwg\fP(8)'s `setconf'
> -sub-command, with the exception of the following additions to the \fIInterface\fP section,
> -which are handled by this tool:
> -
> +sub-command, with the exception of the following additions to the
> +\fBInterface\fP section, which are handled by this tool:
>  .IP \(bu
> -Address \(em a comma-separated list of IP (v4 or v6) addresses (optionally with CIDR masks)
> -to be assigned to the interface. May be specified multiple times.
> +Address \(em a comma-separated list of IP (v4 or v6) addresses (optionally with
> +CIDR masks) to be assigned to the interface. May be specified multiple times.
>  .IP \(bu
> -DNS \(em a comma-separated list of IP (v4 or v6) addresses to be set as the interface's
> -DNS servers. May be specified multiple times. Upon bringing the interface up, this runs
> -`resolvconf -a tun.\fIINTERFACE\fP -m 0 -x` and upon bringing it down, this runs
> -`resolvconf -d tun.\fIINTERFACE\fP`. If these particular invocations of
> +DNS \(em a comma-separated list of IP (v4 or v6) addresses to be set as the
> +interface's DNS servers. May be specified multiple times. Upon bringing the
> +interface up, this runs `resolvconf -a tun.\fIINTERFACE\fP -m 0 -x` and upon
> +bringing it down, this runs `resolvconf -d tun.\fIINTERFACE\fP`. If these
> +particular invocations of
>  .BR resolvconf (8)
>  are undesirable, the PostUp and PostDown keys below may be used instead.
>  .IP \(bu
> -MTU \(em if not specified, the MTU is automatically determined from the endpoint addresses
> -or the system default route, which is usually a sane choice. However, to manually specify
> -an MTU to override this automatic discovery, this value may be specified explicitly.
> +MTU \(em if not specified, the MTU is automatically determined from the endpoint
> +addresses or the system default route, which is usually a sane choice. However,
> +to manually specify an MTU to override this automatic discovery, this value may
> +be specified explicitly.
>  .IP \(bu
>  Table \(em Controls the routing table to which routes are added. There are two
>  special values: `off' disables the creation of routes altogether, and `auto'
> @@ -93,178 +82,167 @@ default routes.
>  .IP \(bu
>  PreUp, PostUp, PreDown, PostDown \(em script snippets which will be executed by
>  .BR bash (1)
> -before/after setting up/tearing down the interface, most commonly used
> -to configure custom DNS options or firewall rules. The special string `%i'
> -is expanded to \fIINTERFACE\fP. Each one may be specified multiple times, in which case
> -the commands are executed in order.
> +before/after setting up/tearing down the interface, most commonly used to
> +configure custom DNS options or firewall rules. The special string `%i' is
> +expanded to \fIINTERFACE\fP. Each one may be specified multiple times, in which
> +case the commands are executed in order.
>  .IP \(bu
> -SaveConfig \(em if set to `true', the configuration is saved from the current state of the
> -interface upon shutdown.
> -
> -.P
> -Recommended \fIINTERFACE\fP names include `wg0' or `wgvpn0' or even `wgmgmtlan0'.
> -However, the number at the end is in fact optional, and really
> -any free-form string [a-zA-Z0-9_=+.-]{1,15} will work. So even interface names corresponding
> -to geographic locations would suffice, such as `cincinnati', `nyc', or `paris', if that's
> -somehow desirable.
> -
> +SaveConfig \(em if set to `true', the configuration is saved from the current
> +state of the interface upon shutdown.
> +.PP
> +Recommended \fIINTERFACE\fP names include `wg0' or `wgvpn0' or even
> +`wgmgmtlan0'.  However, the number at the end is in fact optional, and really
> +any free-form string [a-zA-Z0-9_=+.-]{1,15} will work. So even interface names
> +corresponding to geographic locations would suffice, such as `cincinnati',
> +`nyc', or `paris', if that's somehow desirable.
>  .SH EXAMPLES
> -
>  These examples draw on the same syntax found for
>  .BR wg (8),
> -and a more complete description may be found there. Bold lines below are for options that extend
> +and a more complete description may be found there. Bold lines below are for
> +options that extend
>  .BR wg (8).
> -
> -The following might be used for connecting as a client to a VPN gateway for tunneling all
> -traffic:
> -
> -    [Interface]
> -.br
> -    \fBAddress = 10.200.100.8/24\fP
> -.br
> -    \fBDNS = 10.200.100.1\fP
> -.br
> -    PrivateKey = oK56DE9Ue9zK76rAc8pBl6opph+1v36lm7cXXsQKrQM=
> -.br
> -
> -.br
> -    [Peer]
> -.br
> -    PublicKey = GtL7fZc/bLnqZldpVofMCD6hDjrK28SsdLxevJ+qtKU=
> -.br
> -    PresharedKey = /UwcSPg38hW/D9Y3tcS1FOV0K1wuURMbS0sesJEP5ak=
> -.br
> -    AllowedIPs = 0.0.0.0/0
> -.br
> -    Endpoint = demo.wireguard.com:51820
> -.br
> -
> -The `Address` field is added here in order to set up the address for the interface. The `DNS` field
> -indicates that a DNS server for the interface should be configured via
> +.PP
> +The following might be used for connecting as a client to a VPN gateway for
> +tunneling all traffic:
> +.nf
> +.sp
> +.RS 6n

Never seen these three modifiers. They set spacing somehow?

> +[Interface]
> +\fBAddress = 10.200.100.8/24\fP
> +\fBDNS = 10.200.100.1\fP
> +PrivateKey = oK56DE9Ue9zK76rAc8pBl6opph+1v36lm7cXXsQKrQM=
> +
> +[Peer]
> +PublicKey = GtL7fZc/bLnqZldpVofMCD6hDjrK28SsdLxevJ+qtKU=
> +PresharedKey = /UwcSPg38hW/D9Y3tcS1FOV0K1wuURMbS0sesJEP5ak=
> +AllowedIPs = 0.0.0.0/0
> +Endpoint = demo.wireguard.com:51820
> +.RE
> +.fi
> +.PP
> +The `Address` field is added here in order to set up the address for the
> +interface. The `DNS` field indicates that a DNS server for the interface should
> +be configured via
>  .BR resolvconf (8).
> -The peer's allowed IPs entry implies that this interface should be configured as the default gateway,
> -which this script does.
> -
> -Building on the last example, one might attempt the so-called ``kill-switch'', in order
> -to prevent the flow of unencrypted packets through the non-WireGuard interfaces, by adding the following
> -two lines `PostUp` and `PreDown` lines to the `[Interface]` section:
> -
> -    \fBPostUp = iptables -I OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT\fP
> -.br
> -    \fBPreDown = iptables -D OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT\fP
> -.br
> -
> +The peer's allowed IPs entry implies that this interface should be configured as
> +the default gateway, which this script does.
> +.PP
> +Building on the last example, one might attempt the so-called ``kill-switch'',
> +in order to prevent the flow of unencrypted packets through the non-WireGuard
> +interfaces, by adding the following two lines `PostUp' and `PreDown' lines to
> +the `[Interface]' section:
> +.nf
> +.sp
> +.RS 6n
> +\fBPostUp = iptables -I OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT\fP
> +\fBPreDown = iptables -D OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT\fP
> +.RE
> +.fi
> +.PP
>  The `PostUp' and `PreDown' fields have been added to specify an
>  .BR iptables (8)
> -command which, when used with interfaces that have a peer that specifies 0.0.0.0/0 as part of the
> -`AllowedIPs', works together with wg-quick's fwmark usage in order to drop all packets that
> -are either not coming out of the tunnel encrypted or not going through the tunnel itself. (Note
> -that this continues to allow most DHCP traffic through, since most DHCP clients make use of PF_PACKET
> -sockets, which bypass Netfilter.) When IPv6 is in use, additional similar lines could be added using
> +command which, when used with interfaces that have a peer that specifies
> +0.0.0.0/0 as part of the `AllowedIPs', works together with wg-quick's fwmark
> +usage in order to drop all packets that are either not coming out of the tunnel
> +encrypted or not going through the tunnel itself. (Note that this continues to
> +allow most DHCP traffic through, since most DHCP clients make use of PF_PACKET
> +sockets, which bypass Netfilter.) When IPv6 is in use, additional similar lines
> +could be added using
>  .BR ip6tables (8).
> -
> -Or, perhaps it is desirable to store private keys in encrypted form, such as through use of
> +.PP
> +Or, perhaps it is desirable to store private keys in encrypted form, such as
> +through use of
>  .BR pass (1):
> -
> -    \fBPostUp = wg set %i private-key <(pass WireGuard/private-keys/%i)\fP
> -.br
> -
> -For use on a server, the following is a more complicated example involving multiple peers:
> -
> -    [Interface]
> -.br
> -    \fBAddress = 10.192.122.1/24\fP
> -.br
> -    \fBAddress = 10.10.0.1/16\fP
> -.br
> -    \fBSaveConfig = true\fP
> -.br
> -    PrivateKey = yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=
> -.br
> -    ListenPort = 51820
> -.br
> -
> -.br
> -    [Peer]
> -.br
> -    PublicKey = xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=
> -.br
> -    AllowedIPs = 10.192.122.3/32, 10.192.124.1/24
> -.br
> -
> -.br
> -    [Peer]
> -.br
> -    PublicKey = TrMvSoP4jYQlY6RIzBgbssQqY3vxI2Pi+y71lOWWXX0=
> -.br
> -    AllowedIPs = 10.192.122.4/32, 192.168.0.0/16
> -.br
> -
> -.br
> -    [Peer]
> -.br
> -    PublicKey = gN65BkIKy1eCE9pP1wdc8ROUtkHLF2PfAqYdyYBz6EA=
> -.br
> -    AllowedIPs = 10.10.10.230/32
> -
> -Notice the two `Address' lines at the top, and that `SaveConfig' is set to `true', indicating
> -that the configuration file should be saved on shutdown using the current status of the
> -interface.
> -
> -A combination of the `Table', `PostUp', and `PreDown' fields may be used for policy routing
> -as well. For example, the following may be used to send SSH traffic (TCP port 22) traffic
> -through the tunnel:
> -
> -    [Interface]
> -.br
> -    Address = 10.192.122.1/24
> -.br
> -    PrivateKey = yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=
> -.br
> -    ListenPort = 51820
> -.br
> -    \fBTable = 1234\fP
> -.br
> -    \fBPostUp = ip rule add ipproto tcp dport 22 table 1234\fP
> -.br
> -    \fBPreDown = ip rule delete ipproto tcp dport 22 table 1234\fP
> -.br
> -
> -.br
> -    [Peer]
> -.br
> -    PublicKey = xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=
> -.br
> -    AllowedIPs = 0.0.0.0/0
> -
> -These configuration files may be placed in any directory, putting the desired interface name
> -in the filename:
> -
> -\fB    # wg-quick up /path/to/wgnet0.conf\fP
> -
> -For convenience, if only an interface name is supplied, it automatically chooses a path in
> -`/etc/wireguard/':
> -
> -\fB    # wg-quick up wgnet0\fP
> -
> +.PP
> +.RS 6n
> +\fBPostUp = wg set %i private-key <(pass WireGuard/private-keys/%i)\fP
> +.RE
> +.PP
> +For use on a server, the following is a more complicated example involving
> +multiple peers:
> +.nf
> +.sp
> +.RS 6n
> +[Interface]
> +\fBAddress = 10.192.122.1/24\fP
> +\fBAddress = 10.10.0.1/16\fP
> +\fBSaveConfig = true\fP
> +PrivateKey = yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=
> +ListenPort = 51820
> +
> +[Peer]
> +PublicKey = xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=
> +AllowedIPs = 10.192.122.3/32, 10.192.124.1/24
> +
> +[Peer]
> +PublicKey = TrMvSoP4jYQlY6RIzBgbssQqY3vxI2Pi+y71lOWWXX0=
> +AllowedIPs = 10.192.122.4/32, 192.168.0.0/16
> +
> +[Peer]
> +PublicKey = gN65BkIKy1eCE9pP1wdc8ROUtkHLF2PfAqYdyYBz6EA=
> +AllowedIPs = 10.10.10.230/32
> +.RE
> +.fi
> +.PP
> +Notice the two `Address' lines at the top, and that `SaveConfig' is set to
> +`true', indicating that the configuration file should be saved on shutdown using
> +the current status of the interface.
> +.PP
> +A combination of the `Table', `PostUp', and `PreDown' fields may be used for
> +policy routing as well. For example, the following may be used to send SSH
> +traffic (TCP port 22) traffic through the tunnel:
> +.nf
> +.sp
> +.RS 6n
> +[Interface]
> +Address = 10.192.122.1/24
> +PrivateKey = yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=
> +ListenPort = 51820
> +\fBTable = 1234\fP
> +\fBPostUp = ip rule add ipproto tcp dport 22 table 1234\fP
> +\fBPreDown = ip rule delete ipproto tcp dport 22 table 1234\fP
> +
> +[Peer]
> +PublicKey = xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=
> +AllowedIPs = 0.0.0.0/0
> +.RE
> +.fi
> +.PP
> +These configuration files may be placed in any directory, putting the desired
> +interface name in the filename:
> +.PP
> +.RS 6n
> +# wg-quick up /path/to/wgnet0.conf
> +.RE
> +.PP
> +For convenience, if only an interface name is supplied, it automatically chooses
> +a path in `/etc/wireguard/':
> +.PP
> +.RS 6n
> +# wg-quick up wgnet0
> +.RE
> +.PP
>  This will load the configuration file `/etc/wireguard/wgnet0.conf'.
> -
> -The \fIstrip\fP command is useful for reloading configuration files without disrupting active
> -sessions:
> -
> -\fB    # wg addconf wgnet0 <(wg-quick strip wgnet0)\fP
> -
> -(Note that the above command will add and update peers but will not remove peers.)
> -
> +.PP
> +The \fBstrip\fP command is useful for reloading configuration files without
> +disrupting active sessions:
> +.PP
> +.RS 6n
> +# wg addconf wgnet0 <(wg-quick strip wgnet0)
> +.RE
> +.PP
> +(Note that the above command will add and update peers but will not remove
> +peers.)
>  .SH SEE ALSO
> -.BR wg (8),
> +.BR pass (1),
>  .BR ip (8),
> -.BR ip-link (8),
>  .BR ip-address (8),
> +.BR ip-link (8),
>  .BR ip-route (8),
>  .BR ip-rule (8),
> -.BR resolvconf (8).
> -
> +.BR iptables (8),
> +.BR resolvconf (8),
> +.BR wg (8)
>  .SH AUTHOR
>  .B wg-quick

You've ordered these alphabetically, but the original ordering was
chosen deliberately.

>  was written by
> --
> 2.25.0

Thanks again!
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
