Return-Path: <SRS0=eD45=PN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF25C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Oct 2021 15:55:12 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85C4E60E75
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Oct 2021 15:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85C4E60E75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mailo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2bf1a1d;
	Mon, 25 Oct 2021 15:52:14 +0000 (UTC)
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9dd5b65c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Oct 2021 21:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1634939220; bh=aUna4Qovah7AHfofqMpAxw89aViTO3pEL4hctKVcm1Y=;
 h=X-EA-Auth:From:To:Date:Subject:MIME-Version:X-Mailer:Message-ID:
 Content-Type:Content-Transfer-Encoding;
 b=VXmrHllS5YxEPL5WompDN9CasGDeo3JMYPtMgZuwZLXBRU/XXZjlM6aD0l9drpxv5
 h9EXuJX8YThUTYpVZzu+dpRLZe8Sos1fXqIrhf3GmKnoZ87ozSFw+PuGuFjT/NXh7I
 VhQTW/lL9MVFclvwsZgGczEwT6Fsm3x3Dq+uBP14=
Received: by www-8.mailo.com with http webmail; Fri, 22 Oct 2021
 23:47:00 +0200 (CEST)
X-EA-Auth: x7p/7Yf8eE2cPqFiZixDvv0hQrg8Ui3cBR4uZvLqVCFo6bT4IdHWtgVgIrCOwor5nUHI3oRiZQBmrZTd5Hu/TZVC7TW/N+2v
From: 2rw3n@mailo.com
To: wireguard@lists.zx2c4.com
Date: Fri, 22 Oct 2021 23:47:00 +0200 (CEST)
Subject: ICMP redirect messages throught wg
X-Priority: 3
MIME-Version: 1.0
X-Mailer: COMS/EA21.01/r20210823
Message-ID: <ea-mime-61733154-7941-5ad484b1@www-8.mailo.com>
Content-Type: text/plain;
 charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 25 Oct 2021 15:52:11 +0000
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

Dear all,=20

 I hope it is the right place to ask my question. Sorry if it is not.  I h=
ave set up a wireguard VPN with 1 server A (192.168.100.1 with public IP an=
d OpenBSD) and 2 clients, B (192.168.100.2, at home behind the ISP router 1=
92.168.1.1 and Ubuntu) and C (192.168.100.3, at work behind a university ne=
twork and OpenBSD). The VPN works, I mean I can ssh everywhere. Ping also w=
orks of course, but when I ping from B to C or C to B I have an ICMP redire=
ct message:

192.168.100.1 > 192.168.100.3: icmp: redirect 192.168.100.2 to host 192.16=
8.100.2

and=20

192.168.100.1 > 192.168.100.2: icmp: redirect 192.168.100.3 to host 192.16=
8.100.3

If I understand well it is because I have a sub-optimal routing table. Als=
o messages can be ignore with net.inet.ip.redirect=3D0 on the server (I tri=
ed and  messages are indeed ignored). But I would like to understand where =
I loose this optimality, to improve my network (and increase my knowledge :=
o) because I use default config provide by wireguards tool. More details on=
 my configuration are belows.=20

Thanks for your kind help,
2rw3n.


On server A:
------------------

* Interface=20

wg0: flags=3D81c3<UP,BROADCAST,RUNNING,NOARP,PROMISC,MULTICAST> mtu 1420
	index 4 priority 0 llprio 3
	wgport XXX
	wgpubkey XXX
	wgpeer client B pubkey
		wgendpoint X.X.X.X XXX
		tx: 1044, rx: 1244
		last handshake: 3 seconds ago
		wgaip 192.168.100.2/32
	wgpeer client C pubkey
		wgendpoint X.X.X.X XXX
		tx: 12864, rx: 12796
		last handshake: 75 seconds ago
		wgaip 192.168.100.3/32
	groups: wg
	inet 192.168.100.1 netmask 0xffffff00 broadcast 192.168.100.255
=09
* Routing tables (XXX.XXX.XXX.242 is the public IP)

Destination        Gateway            Flags   Refs      Use   Mtu  Prio If=
ace
default            XXX.XXX.XXX.1        UGS       10     1136     -     8 =
vio0=20
224/4              127.0.0.1          URS        0        0 32768     8 lo=
0 =20
127/8              127.0.0.1          UGRS       0        0 32768     8 lo=
0 =20
127.0.0.1          127.0.0.1          UHhl       1        2 32768     1 lo=
0 =20
XXX.XXX.XXX.1        32:8d:e2:42:a6:79  UHLch      1       25     -     7 =
vio0=20
XXX.XXX.XXX.1/32     XXX.XXX.XXX.242      UCS        1        0     -     =
8 vio0=20
XXX.XXX.XXX.242      fa:16:3e:db:cf:4b  UHLl       0      760     -     1 =
vio0=20
XXX.XXX.XXX.242/32   XXX.XXX.XXX.242      UCn        0        0     -     =
4 vio0=20
192.168.100/24     192.168.100.1      UCn        2        2     -     4 wg=
0 =20
192.168.100.1      wg0                UHl        0        0     -     1 wg=
0 =20
192.168.100.2      link#0             UHc        0       20     -     3 wg=
0 =20
192.168.100.3      link#0             UHc        1       16     -     3 wg=
0 =20
192.168.100.255    192.168.100.1      UHb        0        0     -     1 wg=
0 =20



On client B:
---------------

* Interface
=20
interface: wg0
  public key: XXX
  private key: (hidden)
  listening port: XXX

peer: server A pubkey
  endpoint: server A public IP:XXX
  allowed ips: 192.168.100.0/24
  latest handshake: 11 seconds ago
  transfer: 38.16 KiB received, 39.15 KiB sent
  persistent keepalive: every 25 seconds

* Routes=20

default via 192.168.1.1 dev wlp0s20f3 proto dhcp metric 600=20
169.254.0.0/16 dev wlp0s20f3 scope link metric 1000=20
192.168.1.0/24 dev wlp0s20f3 proto kernel scope link src 192.168.1.21 metr=
ic 600=20
192.168.100.0/24 dev wg0 proto kernel scope link src 192.168.100.2=20

and

Destination     Passerelle      Genmask         Indic   MSS Fen=C3=AAtre i=
rtt Iface
0.0.0.0         192.168.1.1     0.0.0.0         UG        0 0          0 w=
lp0s20f3
169.254.0.0     0.0.0.0         255.255.0.0     U         0 0          0 w=
lp0s20f3
192.168.1.0     0.0.0.0         255.255.255.0   U         0 0          0 w=
lp0s20f3
192.168.100.0   0.0.0.0         255.255.255.0   U         0 0          0 w=
g0


On client C :
-----------------

* Interface=20

wg0: flags=3D80c3<UP,BROADCAST,RUNNING,NOARP,MULTICAST> mtu 1420
	index 4 priority 0 llprio 3
	wgport XXX
	wgpubkey XXX
	wgpeer server A pubkey
		wgpka 20 (sec)
		wgendpoint server A public IP XXX
		tx: 1053728, rx: 1269212
		last handshake: 32 seconds ago
		wgaip 192.168.100.0/24
	groups: wg
	inet 192.168.100.3 netmask 0xffffff00 broadcast 192.168.100.255
=09
* Routing tables

Internet:
Destination        Gateway            Flags   Refs      Use   Mtu  Prio If=
ace
default            10.16.39.254       UGS        6       66     -     8 em=
0 =20
224/4              127.0.0.1          URS        0        0 32768     8 lo=
0 =20
10.16.38/23        10.16.38.180       UCn        1     1645     -     4 em=
0 =20
10.16.38.180       b0:7b:25:1e:e7:04  UHLl       0    11950     -     1 em=
0 =20
10.16.39.254       40:71:83:3a:a9:c0  UHLch      1      901     -     3 em=
0 =20
10.16.39.255       10.16.38.180       UHb        0     3207     -     1 em=
0 =20
127/8              127.0.0.1          UGRS       0        0 32768     8 lo=
0 =20
127.0.0.1          127.0.0.1          UHhl       1        6 32768     1 lo=
0 =20
192.168.100/24     192.168.100.3      UCn        2        0     -     4 wg=
0 =20
192.168.100.1      link#0             UHc        1       18     -     3 wg=
0 =20
192.168.100.2      link#0             UHc        2       81     - L   3 wg=
0 =20
192.168.100.3      wg0                UHl        0      252     -     1 wg=
0 =20
192.168.100.255    192.168.100.3      UHb        0        0     -     1 wg=
0  



