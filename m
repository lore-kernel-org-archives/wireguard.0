Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A4FC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:06:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D5E82081B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUbX3y6M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D5E82081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da30051d;
	Fri, 6 Sep 2019 19:06:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1aee871e
 for <wireguard@lists.zx2c4.com>; Sun, 1 Sep 2019 08:28:08 +0000 (UTC)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6555537
 for <wireguard@lists.zx2c4.com>; Sun, 1 Sep 2019 08:28:08 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id r15so6833210qtn.12
 for <wireguard@lists.zx2c4.com>; Sun, 01 Sep 2019 01:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/hyFvCKQed7lHJkjkRFvLOw5fTAwm7o7TP3IzUyqiS0=;
 b=ZUbX3y6M/yXyFXLzpbLviyS57w7jfIqH9uWfWDHxEanQffD1EWVZnmDDLNWJG6kCjB
 ejd/eRGSP15OpHlcxwXqThFDeq63dEORSE+CQA6t2mOysTWl4OfUz638UIpdYBv36Pw5
 IlpfqLKpnoLDOU2ccW+1ftuBjvLsCyEBjmrsEHSQmdH6n+MEOYaXKgwXdi6CufL5wHqK
 rUh/QWWxDqbQF1TU5EhOH+yCHlc2FQGGx1JwQ4iQozrhmeQMxnszPcKDSsaXwpVN5vel
 wead3cWpRrvI48KpNRLD8yLpZInoi0CxrvXV3hgTK4vhANR9NCoTTb6d0BOguPdCPowW
 STvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/hyFvCKQed7lHJkjkRFvLOw5fTAwm7o7TP3IzUyqiS0=;
 b=oC9m/cU+QTCDqkxOYU3lMGDz0B9T55epLN9f962zN0kxaZzNOtv0kqAGvVQNM97IHM
 LUzLXDBgaCjhuIR5KL1mQpIqKldn+gWQoTSj7I/uCS0W+667kW2oowKAYTbWU77Xyymn
 ejYIy8VbdIxW3E4cZtnL2HrNnZL62ooOX8xBBotRlwr4cElm6+dC/5/wcLXCI6kYubwU
 U/9PtgC3Ib0GpwHbj3+gHSs+saN7EuVpRyOkYsfTZK1sMvNzxugPRI3MC1yVKRExEjYs
 vgzVWIA26CkoaIqEy03/FQAJO/Xfckf9o/Rs8fBtzPzn4vfT0U4qW2EJZY05s1/PHKBB
 Pc/A==
X-Gm-Message-State: APjAAAVtDP9sowVOmF07jrENT/zrca5EIbahxOylcxW7rX6rOG4l5Pyb
 XV+UJX4kpbMvSEzlOUI+K9xfgKk8LcWJ12ijM7fpHd+w
X-Google-Smtp-Source: APXvYqxllCb1fgnv7JSCNJSiYWuck1FmvIUYQhFjItCld52BqJVEXQRD4NxZbNmfa4MHWThUNR44EefwUinz1HQdOPE=
X-Received: by 2002:aed:2da4:: with SMTP id i33mr13741167qtd.320.1567326487182; 
 Sun, 01 Sep 2019 01:28:07 -0700 (PDT)
MIME-Version: 1.0
From: Simone Rossetto <simros85@gmail.com>
Date: Sun, 1 Sep 2019 10:27:56 +0200
Message-ID: <CAEBQdhiMg9PrmPCDafgk01HqOx+yHthk+fYU5YZZvTR2rPgLug@mail.gmail.com>
Subject: Strange firewall dnat rule to make WireGuard work on dual-interface
 server
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 06 Sep 2019 21:06:10 +0200
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
Content-Type: multipart/mixed; boundary="===============4324011187616553929=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4324011187616553929==
Content-Type: multipart/alternative; boundary="000000000000840166059179a2a9"

--000000000000840166059179a2a9
Content-Type: text/plain; charset="UTF-8"

Hello all, I have a routing problem on my server regarding WireGuard
incoming connections and I managed to solve it using strange (at least for
me) iptables rules.

This is the setup: one server with two interfaces (eth0 with IP 192.168.0.1
and eth1 with IP 192.168.1.1), both of them connected to an external router
so both of them can be used to reach internet. The default route is through
eth1 except for some connections that need to pass through eth0. I
accomplished this behavior with a new routing table and fwmark on packets
as follow:

    # new routing table to eth0
    ip rule add fwmark 11 table adsl
    ip route add default via 192.168.0.1 dev eth0 table adsl

    # set mark 11 on incoming packets from eth0 and for some outgoing
packets
    iptables -t mangle -A PREROUTING -m conntrack --ctstate
RELATED,ESTABLISHED -j CONNMARK --restore-mark
    iptables -t mangle -A INPUT -i eth0 -m conntrack --ctstate NEW -j MARK
--set-xmark 11
    iptables -t mangle -A INPUT -m conntrack --ctstate NEW -j CONNMARK
--save-mark
    iptables -t mangle -A OUTPUT -m conntrack --ctstate RELATED,ESTABLISHED
-j CONNMARK --restore-mark
    iptables -t mangle -A OUTPUT [...] --ctstate NEW -j MARK --set-xmark 11
    iptables -t mangle -A POSTROUTING -m conntrack --ctstate NEW -j
CONNMARK --save-mark

    # change source IP for new connections that need to bo routed to eth0
    iptables -t nat -A POSTROUTING -s 192.168.1.1/32 -m conntrack --ctstate
NEW -m mark --mark 11 -j SNAT --to-source 192.168.0.1

This works well for any other connection but not for WireGuard incoming
connections. If I cat the connection tracking I get two "unreplied"
connections instead of a successful one

    cat /proc/net/nf_conntrack | grep 44
    ipv4     2 udp      17 26 src=192.168.1.1 dst=37.160.28.111 sport=44
dport=1503 [UNREPLIED] src=37.160.28.111 dst=192.168.0.1 sport=1503
dport=1024 mark=11 zone=0 use=2
    ipv4     2 udp      17 26 src=37.160.28.111 dst=192.168.0.1 sport=1503
dport=44 [UNREPLIED] src=192.168.0.1 dst=37.160.28.111 sport=44 dport=1503
mark=11 zone=0 use=2

where 44 is the UDP WireGuard port.
The first line seams an outgoing connection from 192.168.1.1 (eth1) to an
external IP that waits for a reply on IP 192.168.0.1 (why different??) and
port 1024 (?! where does it come from??), the second line is the real
incoming connection from outside to port 44. The incoming connection is
correctly marked with mark 11, as the outgoing "reply", but not a working
"reply".

To make WireGuard work I need to add the following iptables pre-routing rule

    iptables -t nat -A PREROUTING -d 192.168.0.1/32 -p udp -m udp --dport
44 -m conntrack --ctstate NEW -j DNAT --to-destination 192.168.1.1

that is change the destination address of new WireGuard connections from
192.168.0.1 (eth0, where they actually come from) to 192.168.1.1 (eth1)
where they should not transit. Adding this rule the connection tracking is
as follow:

    cat /proc/net/nf_conntrack | grep 44
    ipv4     2 udp      17 167 src=37.160.28.111 dst=192.168.0.1 sport=1503
dport=44 src=192.168.0.1 dst=37.160.28.111 sport=44 dport=1503 [ASSURED]
mark=11 zone=0 use=2

a single established connection to IP 192.168.0.1 even I set a dnat to
192.168.1.1.

Is there a reason for this behavior or could it be a bug in WireGuard?
Or, perhaps, I set something odd and the dnat is a workaround?


Thanks, bye
Simone

--000000000000840166059179a2a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all, I have a routing problem on my server rega=
rding WireGuard incoming connections and I managed to solve it using strang=
e (at least for me) iptables rules.</div><div><br></div><div>This is the se=
tup: one server with two interfaces (eth0 with IP 192.168.0.1 and eth1 with=
 IP 192.168.1.1), both of them connected to an external router so both of t=
hem can be used to reach internet. The default route is through eth1 except=
 for some connections that need to pass through eth0. I accomplished this b=
ehavior with a new routing table and fwmark on packets as follow:</div><div=
><br></div><div>=C2=A0=C2=A0=C2=A0 # new routing table to eth0<br></div><di=
v>=C2=A0=C2=A0=C2=A0 ip rule add fwmark 11 table adsl</div><div>=C2=A0=C2=
=A0=C2=A0 ip route add default via 192.168.0.1 dev eth0 table adsl</div><di=
v><br></div><div>=C2=A0=C2=A0=C2=A0 # set mark 11 on incoming packets from =
eth0 and for some outgoing packets<br></div><div>=C2=A0=C2=A0=C2=A0 iptable=
s -t mangle -A PREROUTING -m conntrack --ctstate RELATED,ESTABLISHED -j CON=
NMARK --restore-mark</div><div>=C2=A0=C2=A0=C2=A0 iptables -t mangle -A INP=
UT -i eth0 -m conntrack --ctstate NEW -j MARK --set-xmark 11</div><div>=C2=
=A0=C2=A0=C2=A0 iptables -t mangle -A INPUT -m conntrack --ctstate NEW -j C=
ONNMARK --save-mark</div><div>=C2=A0=C2=A0=C2=A0 iptables -t mangle -A OUTP=
UT -m conntrack --ctstate RELATED,ESTABLISHED -j CONNMARK --restore-mark<br=
>=C2=A0=C2=A0=C2=A0 iptables -t mangle -A OUTPUT [...] --ctstate NEW -j MAR=
K --set-xmark 11<br></div><div>
=C2=A0=C2=A0=C2=A0 iptables -t mangle=20

-A POSTROUTING -m conntrack --ctstate NEW -j CONNMARK --save-mark</div><div=
><br></div><div>=C2=A0=C2=A0=C2=A0 # change source IP for new connections t=
hat need to bo routed to eth0<br></div><div>=C2=A0=C2=A0=C2=A0 iptables -t =
nat -A POSTROUTING -s <a href=3D"http://192.168.1.1/32">192.168.1.1/32</a> =
-m conntrack --ctstate NEW -m mark --mark 11 -j SNAT --to-source 192.168.0.=
1</div><div><br></div><div>This works well for any other connection but not=
 for WireGuard incoming connections. If I cat the connection tracking I get=
 two &quot;unreplied&quot; connections instead of a successful one</div><di=
v><br></div><div>=C2=A0=C2=A0=C2=A0 cat /proc/net/nf_conntrack | grep 44<br=
>=C2=A0=C2=A0=C2=A0 ipv4 =C2=A0 =C2=A0 2 udp =C2=A0 =C2=A0 =C2=A017 26 src=
=3D192.168.1.1 dst=3D37.160.28.111 sport=3D44 dport=3D1503 [UNREPLIED] src=
=3D37.160.28.111 dst=3D192.168.0.1 sport=3D1503 dport=3D1024 mark=3D11 zone=
=3D0 use=3D2<br>=C2=A0=C2=A0=C2=A0 ipv4 =C2=A0 =C2=A0 2 udp =C2=A0 =C2=A0 =
=C2=A017 26 src=3D37.160.28.111 dst=3D192.168.0.1 sport=3D1503 dport=3D44 [=
UNREPLIED] src=3D192.168.0.1 dst=3D37.160.28.111 sport=3D44 dport=3D1503 ma=
rk=3D11 zone=3D0 use=3D2</div><div><br></div><div>where 44 is the UDP WireG=
uard port.<br></div><div>The first line seams an outgoing connection from 1=
92.168.1.1 (eth1) to an external IP that waits for a reply on IP 192.168.0.=
1 (why different??) and port 1024 (?! where does it come from??), the secon=
d line is the real incoming connection from outside to port 44. The incomin=
g connection is correctly marked with mark 11, as the outgoing &quot;reply&=
quot;, but not a working &quot;reply&quot;.<br></div><div><br></div><div>To=
 make WireGuard work I need to add the following iptables pre-routing rule<=
/div><div><br></div><div>=C2=A0=C2=A0=C2=A0 iptables -t nat -A PREROUTING -=
d <a href=3D"http://192.168.0.1/32">192.168.0.1/32</a> -p udp -m udp --dpor=
t 44 -m conntrack --ctstate NEW -j DNAT --to-destination 192.168.1.1</div><=
div><br></div><div>that is change the destination address of new WireGuard =
connections from 192.168.0.1 (eth0, where they actually come from) to 192.1=
68.1.1 (eth1) where they should not transit. Adding this rule the connectio=
n tracking is as follow:</div><div><br></div><div>=C2=A0=C2=A0=C2=A0 cat /p=
roc/net/nf_conntrack | grep 44<br>=C2=A0=C2=A0=C2=A0 ipv4 =C2=A0 =C2=A0 2 u=
dp =C2=A0 =C2=A0 =C2=A017 167 src=3D37.160.28.111 dst=3D192.168.0.1 sport=
=3D1503 dport=3D44 src=3D192.168.0.1 dst=3D37.160.28.111 sport=3D44 dport=
=3D1503 [ASSURED] mark=3D11 zone=3D0 use=3D2</div><div><br></div><div>a sin=
gle established connection to IP 192.168.0.1 even I set a dnat to 192.168.1=
.1.</div><div><br></div><div>Is there a reason for this behavior or could i=
t be a bug in WireGuard?</div><div>Or, perhaps, I set something odd and the=
 dnat is a workaround?</div><div><br></div><div><br></div><div>Thanks, bye<=
/div><div>Simone<br></div></div>

--000000000000840166059179a2a9--

--===============4324011187616553929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4324011187616553929==--
