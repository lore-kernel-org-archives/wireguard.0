Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2592EC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 14:09:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3752622261
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 14:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3752622261
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kerr.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26f52bee;
	Fri, 9 Oct 2020 13:36:18 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 46d19426
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 13:36:16 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id w12so10665068qki.6
 for <wireguard@lists.zx2c4.com>; Fri, 09 Oct 2020 07:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7sVm7u36lx0h9E616DaSzgIBeuzOBmUF84airPhu5t8=;
 b=t8avYhFPVUOyuGO2c6fatWmBiOH1I8v6cRtnU6UU+ErqlBIZA9ueGPnRwbDBOfyLZa
 VT6x7HdhZzv75oDwLmVLtD8i/elBsHdzHyjMVTzpnQLD3X/+ZGDJFYq5/xW1jjv1QxpW
 S2l/oYAU4b95qTZZICdRwn9cmebnq7tHoZLWRykrspt3+coZ4NHcDy7jK/PE9WvK86SV
 /GNigNR7jWvSNAlPo8VURxVO5V0m5esLME8H6zfjrHuB3aXG7mSFMhHwSSjj4p+bGcA7
 AW4tTomsA3579NXONb7MUoEFrgAR2fLNmNf6SN1SGEZ6vXIf+BvufrEPL/CUzUukRUhO
 Fbqg==
X-Gm-Message-State: AOAM531VPJMDWY0At6qGJRTJua58TykfNbVYdnQ+OuqUdIcD6a24fHlh
 yZAxd43SIWm1Ej8LvWpd9t7yviyplD1P5FE/IX+Lm2k+FXHz6hXF
X-Google-Smtp-Source: ABdhPJxRoP1bOXL04UfpucGZqG5ICOpb3PDxQtvkBGyp6BWhdW1Vn+uAOtXPyF341+uV7OZwhuSOln5y+ThSGngxNUY=
X-Received: by 2002:a37:5fc6:: with SMTP id t189mr12324532qkb.78.1602252548808; 
 Fri, 09 Oct 2020 07:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAE9z9A0H8t3op=ewTCUhZXeOoprWEquiiH77mUN_C8EMvwiF2w@mail.gmail.com>
 <20201009182214.0169140f@natsu>
 <CAE9z9A2kWvroWG7v4iAxnVKxs8ev1eB28E+gMKdyXKBUM5Osdw@mail.gmail.com>
 <20201009183446.06f7fe0a@natsu>
 <CAE9z9A3wG8e8djm7Og=+y7QBW6oqunM1Ln+DKHLA5isyWS-88w@mail.gmail.com>
 <20201009190505.18391a7d@natsu>
In-Reply-To: <20201009190505.18391a7d@natsu>
From: David Kerr <david@kerr.net>
Date: Fri, 9 Oct 2020 10:08:58 -0400
Message-ID: <CAJJxGdG22R5Pfx54sr9TNu67RyKKcWL8uF4Dh3hQwfiVtq0meg@mail.gmail.com>
Subject: Re: [FR] How can I expose the wireguard tunnel as a socks5 proxy on
 the client?
To: Roman Mamedov <rm@romanrm.net>
Cc: Rudi C <rudiwillalwaysloveyou@gmail.com>, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Do you have a linux-based gateway you can manage yourself?  And that
gateway has dnsmasq and iptables/netfilter available?  If yes then you
can selectively route traffic over a wireguard interface and leave the
rest to go to default.

Warning... this is expert stuff...

in dnsmasq.static set list of all the domains you want to send over wireguard...

ipset=/example.com/VPN_LIST_IPV4,VPN_LIST_IPV6
ipset=/example.org/VPN_LIST_IPV4,VPN_LIST_IPV6

Export some environment variables...
VPN2IF="wg2"
VPN2IP="10.11.12.13"
VPN2DNS="8.8.8.8"
INTIF="eth1"
INTIP="192.168.0.1"

And execute the following to create the wireguard interface, setup the
network routing and iptables rules, etc...
Note that your system may use just "iptables" for IPv4 rather than
"ip4tables" and that your firewall netfilter chains might be named
differently from mine.  But if you are familiar enough with
iptables/netfilter then you should be able to figure it out...

# =============================================================================
# Route traffic to select domains over $VPN2IF
# Start by creating a wireguard VPN interface
if ! ip link show dev $VPN2IF >/dev/null 2>&1; then
  ip link add dev $VPN2IF type wireguard
  ip address add dev $VPN2IF $VPN2IP/32
  wg setconf $VPN2IF /etc/wireguard/$VPN2IF.conf
  ip link set up dev $VPN2IF
fi
# route DNS IP address over the VPN in default routing table
ip route add $VPN2DNS dev $VPN2IF
# create a new routing table (400) with default route to VPN interface
# and send all packets marked with 0x8 bit to that table
ip route add default dev $VPN2IF table 400
ip rule add from $INTIP/24 fwmark 0x8/0x8 table 400 priority 2000
# create an ipset hash which dnsmasq will save all IP addresses for the domains
# and add the 0x8 firewall mark to all traffic going to those destinations
ipset -exist create VPN_LIST_IPV4 hash:ip family inet
ip4tables -t mangle -A PREROUTING -i $INTIF -m set --match-set
VPN_LIST_IPV4 dst -j MARK --set-xmark 0x8/0x8
# make sure traffic from my internal interface is permitted to forward
to/from the VPN interface
ip4tables -A FORWARD_CHAIN -i $INTIF -o $VPN2IF -j ACCEPT
ip4tables -A FORWARD_CHAIN -i $VPN2IF -o $INTIF -j ACCEPT
# and NAT traffic over the VPN
ip4tables -t nat -A NAT_POSTROUTING_CHAIN -s $INTIP/24 ! -d $INTIP/24
-o $VPN2IF -j MASQUERADE
# the VPN does not support IPv6 so drop all attempts to connect by IPv6
ipset -exist create VPN_LIST_IPV6 hash:ip family inet6
ip6tables -I FORWARD_CHAIN -i $INTIF -m set --match-set VPN_LIST_IPV6
dst -j DROP


On Fri, Oct 9, 2020 at 10:05 AM Roman Mamedov <rm@romanrm.net> wrote:
>
> On Fri, 9 Oct 2020 17:16:18 +0330
> Rudi C <rudiwillalwaysloveyou@gmail.com> wrote:
>
> > > On Fri, Oct 9, 2020 at 5:04 PM Roman Mamedov <rm@romanrm.net> wrote:
> > > Seems like you misunderstand what I mean. If you use the in-VPN (internal) IP
> > > of your VPS, all communication with the SOCKS proxy installed on the VPS will
> > > happen via the WireGuard tunnel. No DPI can look into that.
> >
> > You're right! Some questions:
> > 1. What should I do client-side so that wireguard only covers my VPS's
> > IP (and does not otherwise route traffic)? Will `AllowedIPs =
> > SERVER_IP/32` do it?
>
> SERVER_IP should be the in-VPN IP here, otherwise yes, and remove .0.0.0/0
> and ::/0 from AllowedIPs.
>
> > 2. How do I get the in-VPN IP of the server? Is it `Address` in `[Interface]`?
>
> Yes. You can confirm via "ip addr list dev wgX" on the server.
>
> > 3. I use ufw for the firewall on the server. Will ufw block my local
> > machine? If not, with what IP should I set ufw rules? (My local
> > machine doesn't have a static IP.) Of course, I could alternatively
> > expose the socks proxy to the world with a password; How secure will
> > that be?
>
> Sorry, not familiar with ufw; generally you need to allow only connections
> from the WG interface, or from the internal IP range (or just the "Address ="
> of the client), and block all others.
>
> --
> With respect,
> Roman
