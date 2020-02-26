Return-Path: <SRS0=PDJl=4R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CE6C3F2C6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 11:35:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D5F3246A2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 11:35:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5Q8Tyki"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D5F3246A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73940190;
	Sat, 29 Feb 2020 11:31:01 +0000 (UTC)
Received: by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10b9ecf4
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 16:01:56 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [2607:f8b0:4864:20::12c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 141c2a55
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 16:01:56 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id g126so2837397ilh.2
 for <wireguard@lists.zx2c4.com>; Wed, 26 Feb 2020 08:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CSM6Zf+Nwyl6gC2T5BfgFzxHMf4LMlaV6MdhdaUypFg=;
 b=r5Q8TykiUWVfENnYXPowmrN7XcpdwGrqAf6jrvjv4xl++IDZQ2O+idaLF5pOjlWis/
 e4XFHtBwlHcUxmwtrsjRflm91YFVDbqLtG9+EP/lpF8P0js/CGsuM4aISOQ8UtWLp9ve
 wuFvPkruyrszmS+Fani9x1RmGGZHIEymUqnKhHoiQCJVrbAowGiyt4Td26woHH+rzAUi
 eQJC+AXdCK90c3SBiP0yyHAMclKmYNuVwH6qlZw3uLHHt7P8TV0mXaEaPHcSLTkFLp6F
 xlePoW2Ob49LnC2uNt8g9uJEcQ2tZkogXjvjSMTaCkC1d0cFdzE28R8+yo/retBZT8AI
 o54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CSM6Zf+Nwyl6gC2T5BfgFzxHMf4LMlaV6MdhdaUypFg=;
 b=NGKlyhlujYlKgv52eXZHYCMZrehL3ttYkf9PSt9+ir1l54AAti7XBtAmPwdRSVQ58Y
 jIMem6wqpLQ7Sp5fQ+/5QrRZA+Rb+K1gJE+H9Xj4teEyaxDOXkJQiw74ax6sRJuOzDl1
 BPE0qmPN2pEkFfboU+6yiT+6PzGJamAWIkrMUb9ubR29OfOZpBtHpKAJh4I/bb+BIz0G
 uahdWsWqKDJsdJOiaGAsp7PFK6oED96XRv+1Kpw1+mFQft9Z0VFAHLRpfw7u09HQRwCs
 NJLtOYuwokwGcXUuiN6fN3odUSlmpbqfCQEuYa5LQcsB37wmVtmr1Dv5AHTTuayXZqv4
 /mbQ==
X-Gm-Message-State: APjAAAUIVW4BPiIPecPNoh8ibRxkYB51aoTdUl0odKjYQmQQUOKtSDhe
 qO5RyUi9HHOwVU03KJUXp21FvIcnCPJA4Tfg1qaB6zJ51Fk=
X-Google-Smtp-Source: APXvYqzZp/toJh1lIJw9/iqqFkTHRHrYOFvvLCA0XsTuYi4lZGBG7WxtOPvjbKPmTu7i8Yr5JZCPzYOH9IvU1SO9byk=
X-Received: by 2002:a05:6e02:f0f:: with SMTP id
 x15mr5761420ilj.298.1582733134746; 
 Wed, 26 Feb 2020 08:05:34 -0800 (PST)
MIME-Version: 1.0
From: tubi webmail <tubi.webmail@gmail.com>
Date: Wed, 26 Feb 2020 17:05:26 +0100
Message-ID: <CABFD=YMqMZPx1LG9e3C03u0eAnUfx2d2KvvQAcsJXaBSd0UqkA@mail.gmail.com>
Subject: Translation of sender IP address
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 29 Feb 2020 12:30:59 +0100
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
Content-Type: multipart/mixed; boundary="===============6033894216639371541=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6033894216639371541==
Content-Type: multipart/alternative; boundary="000000000000455e6d059f7cc6d6"

--000000000000455e6d059f7cc6d6
Content-Type: text/plain; charset="UTF-8"

Hi,

I have the following setup:

 - Wireguard server running Ubuntu 19.10
 - Wireguard server physical network interface ens32 @ 192.168.122.236
 - Wireguard server virtual network interface wg0 @ 192.168.200.254
 - IP forwarding for ipv4 is enabled on Wireguard server
 - Wireguard server is behind a NAT firewall
 - wg0 on Wireguard server is brought up by 'wg-quick up wg0'

 - Wireguard client running Ubuntu Linux Mint 19.3
 - Wireguard client physical network interface enp5s0 @ 192.168.60.66
 - Wireguard client virtual network interface wg0 @ 192.168.200.20
 - Wireguard client is behind a NAT firewall
 - wg0 on Wireguard client is brought up by 'wg-quick up wg0'

The client connects to the server without any problems. From the Wireguard
client machine (labeled: A) I ping a machine (labeled: B) on the network
where the Wireguard server is located. IP address of B is 192.168.122.20.
My ping request on A get ping response from B, so everything is OK. If I
use tcpdump to view traffic I get the following on Wireguard server:

$tcpdump -n -i wg0
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on wg0, link-type RAW (Raw IP), capture size 262144 bytes
15:21:27.613387 IP 192.168.200.20 > 192.168.122.20: ICMP echo request, id
2621, seq 65, length 64
15:21:27.613503 IP 192.168.122.20 > 192.168.200.20: ICMP echo reply, id
2621, seq 65, length 64
15:21:28.615464 IP 192.168.200.20 > 192.168.122.20: ICMP echo request, id
2621, seq 66, length 64
15:21:28.615584 IP 192.168.122.20 > 192.168.200.20: ICMP echo reply, id
2621, seq 66, length 64


$tcpdump -n -i ens32
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens32, link-type EN10MB (Ethernet), capture size 262144 bytes
15:25:04.970842 IP 192.168.122.236 > 192.168.122.20: ICMP echo request, id
2621, seq 282, length 64
15:25:04.970915 IP 192.168.122.20 > 192.168.122.236: ICMP echo reply, id
2621, seq 282, length 64
15:25:05.972827 IP 192.168.122.236 > 192.168.122.20: ICMP echo request, id
2621, seq 283, length 64
15:25:05.972911 IP 192.168.122.20 > 192.168.122.236: ICMP echo reply, id
2621, seq 283, length 64


I observe that the ping request (when viewed on ens32@Wireguard server)
seems to originate from 192.168.122.236, that is the ip address of the
Wireguard server physical network interface ens32. On wg0 (i.e. virtual
interface on Wireguard server) the ping request seems to originate from
192.168.200.20 (i.e. virtual interface on Wireguard client). So when the
packets are forwarded from wg0 to ens32 (and vice versa) their
sender/destination IP seems to change. This is as far as I know named
masquerading.

I do NOT have any PostUp/PostDown directives in my wg0.conf files (on
either server or client). I have seen a lot of examples on the internet
where PostUp/PostDown contains 'iptable rules' using MASQUERADE, but this
is NOT something I use.

If I do (on Wireguard server) 'iptables -L -v -n' I get:
Chain INPUT (policy ACCEPT 7835K packets, 3459M bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain FORWARD (policy ACCEPT 4765K packets, 7815M bytes)
 pkts bytes target     prot opt in     out     source
destination
5800K 2582M ACCEPT     all  --  wg0    *       0.0.0.0/0
0.0.0.0/0

Chain OUTPUT (policy ACCEPT 8952K packets, 8660M bytes)
 pkts bytes target     prot opt in     out     source
destination

So NO rules regarding masquerading seems to be in use.

----------------------------------------------------------
My question is:
If the change/translation in sender/destination IP address (described
above) is due to masquerading, where is this masquerading rule set up? Is
it done 'inside' the wg0 interface? Please explain who/what makes the
instruction to change sender/destination IP address when packets are
forwarded between wg0 and ens32 on the Wireguard server.
NOTE: There is NO problem, everything works fine but I would like to
understand what is happening.
----------------------------------------------------------

Thank you very much!

BR,
Peter

--000000000000455e6d059f7cc6d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><p>Hi,</p><p>I have the following setup:<=
/p><p>=C2=A0- Wireguard server running Ubuntu 19.10<br>=C2=A0- Wireguard se=
rver physical network interface ens32 @ 192.168.122.236<br>=C2=A0- Wireguar=
d server virtual network interface wg0 @ 192.168.200.254<br>=C2=A0- IP forw=
arding for ipv4 is enabled on Wireguard server<br>=C2=A0- Wireguard server =
is behind a NAT firewall<br>=C2=A0- wg0 on Wireguard server is brought up b=
y &#39;wg-quick up wg0&#39;</p><p>=C2=A0- Wireguard client running Ubuntu L=
inux Mint 19.3<br>=C2=A0- Wireguard client physical network interface enp5s=
0 @ 192.168.60.66<br>=C2=A0- Wireguard client virtual network interface wg0=
 @ 192.168.200.20<br>=C2=A0- Wireguard client is behind a NAT firewall<br>=
=C2=A0- wg0 on Wireguard client is brought up by &#39;wg-quick up wg0&#39;<=
/p><p>The client connects to the server without any problems. From the Wire=
guard client machine (labeled: A) I ping a machine (labeled: B) on the netw=
ork where the Wireguard server is located. IP address of B is 192.168.122.2=
0. My ping request on A get ping response from B, so everything is OK. If I=
 use tcpdump to view traffic I get the following on Wireguard server:</p><p=
>$tcpdump -n -i wg0<br>tcpdump: verbose output suppressed, use -v or -vv fo=
r full protocol decode<br>listening on wg0, link-type RAW (Raw IP), capture=
 size 262144 bytes<br>15:21:27.613387 IP 192.168.200.20 &gt; <a href=3D"htt=
p://192.168.122.20">192.168.122.20</a>: ICMP echo request, id 2621, seq 65,=
 length 64<br>15:21:27.613503 IP 192.168.122.20 &gt; <a href=3D"http://192.=
168.200.20">192.168.200.20</a>: ICMP echo reply, id 2621, seq 65, length 64=
<br>15:21:28.615464 IP 192.168.200.20 &gt; <a href=3D"http://192.168.122.20=
">192.168.122.20</a>: ICMP echo request, id 2621, seq 66, length 64<br>15:2=
1:28.615584 IP 192.168.122.20 &gt; <a href=3D"http://192.168.200.20">192.16=
8.200.20</a>: ICMP echo reply, id 2621, seq 66, length 64</p><p><br>$tcpdum=
p -n -i ens32<br>tcpdump: verbose output suppressed, use -v or -vv for full=
 protocol decode<br>listening on ens32, link-type EN10MB (Ethernet), captur=
e size 262144 bytes<br>15:25:04.970842 IP 192.168.122.236 &gt; <a href=3D"h=
ttp://192.168.122.20">192.168.122.20</a>: ICMP echo request, id 2621, seq 2=
82, length 64<br>15:25:04.970915 IP 192.168.122.20 &gt; <a href=3D"http://1=
92.168.122.236">192.168.122.236</a>: ICMP echo reply, id 2621, seq 282, len=
gth 64<br>15:25:05.972827 IP 192.168.122.236 &gt; <a href=3D"http://192.168=
.122.20">192.168.122.20</a>: ICMP echo request, id 2621, seq 283, length 64=
<br>15:25:05.972911 IP 192.168.122.20 &gt; <a href=3D"http://192.168.122.23=
6">192.168.122.236</a>: ICMP echo reply, id 2621, seq 283, length 64</p><p>=
<br>I observe that the ping request (when viewed on ens32@Wireguard server)=
 seems to originate from 192.168.122.236, that is the ip address of the Wir=
eguard server physical network interface ens32. On wg0 (i.e. virtual interf=
ace on Wireguard server) the ping request seems to originate from 192.168.2=
00.20 (i.e. virtual interface on Wireguard client). So when the packets are=
 forwarded from wg0 to ens32 (and vice versa) their sender/destination IP s=
eems to change. This is as far as I know named masquerading.</p><p>I do NOT=
 have any PostUp/PostDown directives in my wg0.conf files (on either server=
 or client). I have seen a lot of examples on the internet where PostUp/Pos=
tDown contains &#39;iptable rules&#39; using MASQUERADE, but this is NOT so=
mething I use.</p><p>If I do (on Wireguard server) &#39;iptables -L -v -n&#=
39; I get:<br>Chain INPUT (policy ACCEPT 7835K packets, 3459M bytes)<br>=C2=
=A0pkts bytes target=C2=A0=C2=A0=C2=A0=C2=A0 prot opt in=C2=A0=C2=A0=C2=A0=
=C2=A0 out=C2=A0=C2=A0=C2=A0=C2=A0 source=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 destination</p><p>Chain=
 FORWARD (policy ACCEPT 4765K packets, 7815M bytes)<br>=C2=A0pkts bytes tar=
get=C2=A0=C2=A0=C2=A0=C2=A0 prot opt in=C2=A0=C2=A0=C2=A0=C2=A0 out=C2=A0=
=C2=A0=C2=A0=C2=A0 source=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 destination<br>5800K 2582M ACCEPT=C2=
=A0=C2=A0=C2=A0=C2=A0 all=C2=A0 --=C2=A0 wg0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"http://0.0.0.0/0">0.0.0.0/0</a>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"=
http://0.0.0.0/0">0.0.0.0/0</a></p><p>Chain OUTPUT (policy ACCEPT 8952K pac=
kets, 8660M bytes)<br>=C2=A0pkts bytes target=C2=A0=C2=A0=C2=A0=C2=A0 prot =
opt in=C2=A0=C2=A0=C2=A0=C2=A0 out=C2=A0=C2=A0=C2=A0=C2=A0 source=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 destination</p><p>So NO rules regarding masquerading seems to be in use.</=
p><p>----------------------------------------------------------<br>My quest=
ion is:<br>If the change/translation in sender/destination IP address (desc=
ribed above) is due to masquerading, where is this masquerading rule set up=
? Is it done &#39;inside&#39; the wg0 interface? Please explain who/what ma=
kes the instruction to change sender/destination IP address when packets ar=
e forwarded between wg0 and ens32 on the Wireguard server.<br>NOTE: There i=
s NO problem, everything works fine but I would like to understand what is =
happening.<br>----------------------------------------------------------</p=
><p>Thank you very much!</p><p>BR,<br>Peter</p></div></div>

--000000000000455e6d059f7cc6d6--

--===============6033894216639371541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6033894216639371541==--
