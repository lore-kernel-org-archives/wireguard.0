Return-Path: rainmakerraw@icloud.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 959ccfae
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Jul 2018 20:47:41 +0000 (UTC)
Received: from st11p00im-asmtp002.me.com (st11p00im-asmtp002.me.com
 [17.172.80.96])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ed1f377
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Jul 2018 20:47:41 +0000 (UTC)
Received: from process-dkim-sign-daemon.st11p00im-asmtp002.me.com by
 st11p00im-asmtp002.me.com
 (Oracle Communications Messaging Server 8.0.1.2.20170607 64bit (built Jun  7
 2017)) id <0PC600K00N7D4A00@st11p00im-asmtp002.me.com> for
 wireguard@lists.zx2c4.com; Fri, 20 Jul 2018 20:56:21 +0000 (GMT)
Received: from icloud.com ([127.0.0.1]) by st11p00im-asmtp002.me.com
 (Oracle Communications Messaging Server 8.0.1.2.20170607 64bit (built Jun  7
 2017)) with ESMTPSA id <0PC600ECWNHSUW00@st11p00im-asmtp002.me.com> for
 wireguard@lists.zx2c4.com; Fri, 20 Jul 2018 20:56:18 +0000 (GMT)
From: Lee Yates <rainmakerraw@icloud.com>
To: wireguard@lists.zx2c4.com
Subject: Very low throughput in *BSDs (but only as a router)
Date: Fri, 20 Jul 2018 20:54:48 +0000
Message-id: <emf8caba7e-aff8-451d-9ead-efc6ca4ae091@lee-pc>
MIME-version: 1.0
Content-type: multipart/mixed;
 boundary="------=_MB82896302-1E43-48B8-98EE-F2F3600EAD3E"
Reply-To: Lee Yates <rainmakerraw@icloud.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--------=_MB82896302-1E43-48B8-98EE-F2F3600EAD3E
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi all,

This is my first time posting to this list, but I've followed along for
a while now. I've been happily using wg at home for months, and it's
been a revelation in terms of speed (practically no performance hit at
all on my 350/20 ISP line).

I recently decided to stop running wg on all my (capable)LAN devices,
and to 'just' run wg on my home-made x86_64 router instead. Since
pfSense and IPFire don't have wg packages (or the ability to add them),
I decided to roll my own environment using Linux or one of the BSDs. I
did very well with a quick virtualised Arch install (masquerade for LAN
to the wg interface) and throughput was perfect - 350/20! Not being a
huge fan of systemd or iptables, I really wanted to use BSD so I tried
out an OpenBSD install. Despite reading how performant it was (capable
of >10Gbps out of the box on appropriate hardware), I noticed throughput
on the virtual router crashed to 130Mbps (30% of full speed) when wg was
connected. I confirmed that my virtual LAN clients were also limited to
around 130Mbps if wg was connected on the OpenBSD 'router'.

Not being satisfied with this and wondering what I'd done wrong (or
whether OpenBSD was indeed capable), I span up a much more familiar (to
me) FreeBSD 11.2 install and set it up the same way. Gateway=3Dyes, pf set
to NAT the virtual LAN traffic through wg, and away we go. Again, the
virtual router could run 350/20 easily on its own, but as soon as wg was
connected (AzireVPN 10Gb node, btw) the performance dropped to the same
130Mbps.

That just didn't seem right. I checked htop while connected to wg and
running iperf3 to a 10Gbps speedtest node in NL. Htop confirmed that the
wireguard process was only using a max of 7% CPU throughout the speed
test (the VMs have four cores from my i7 8700k at 5GHz each). So, it's
not a CPU bottleneck.

Weirdly, if I disconnect wg on the virtual router and run it from any of
the virtual LAN client machines instead, then throughput jumps back up
to 350/20 every single time. So, the virtual router seems capable of
routing 350/20 easily - provided the wg process is running on a client
machine and not itself. As soon as wg is connected on the router itself,
I'm down to 30% of my expected throughput no matter what.

To present it visually, in case it makes more sense for the visual
learners among us:

# Full speed
Virtual client OS [wg] > virtual router > real home router > WAN > [wg]
VPN server

# Crippled speed
Virtual client OS > virtual router [wg] > real router > WAN > [wg] VPN
server

I just can't make sense of it. I could literally run the iperf3 test on
the router+wg and get 130Mbps, but then fire up the exact same iperf3
test on any other machine on the network (connected via wg to the same
real external VPN server) and get full speed every single time.
Something seems to be hobbling wg when run on the router itself, but I'm
all out of ideas. I've tried tuning sysctl.conf etc on the virtual
routers (Open/Free BSD) but it made no difference at all.

Can anyone please offer any advice/help/tips or point out any glaring
omissions I may have made? I can upload my
rc.conf/sysctl.conf/pf.conf/dhcpd.conf/unbound.conf or other to pastebin
if anyone wishes to see them. Sorry if this would have been more
appropriate being sent to a BSD list, but unfortunately not many people
seem to be experienced with wg on BSDs yet so I'm finding help a little
thin on the ground.  Hence, posting to ask here where someone is more
likely to be experienced in the matter.

Many thanks in advance,

Lee Yates=0A-----BEGIN PGP SIGNATURE-----
Version: BCPG C# v1.8.1.0

iQFBBAEBCAArBQJbUkwhJBxMZWUgWWF0ZXMgPHJhaW5tYWtlcnJhd0BpY2xvdWQu
Y29tPgAKCRDvJcvMOyipkhAYB/9YfaXm5He7VmSTZMeJgYoICF0NDUcH7KmTkIwU
kLzflkzgEtM77mkN4xnA7xkvVMvWFq7F6osKuArJNiZNLoZPNfZPUfBm7ZPtVoXB
SBKbWco9vGqQdqFh3hrIwZYZQWFXoheWtAniOPp7Xv9RO3cFCOT9KcbN9ubLcqo9
NtjC2e3CQ9m17FNrxla5eRUzTT2lcrkMqBO+7ZgjEiQ6TWi/avw9jgErejAJpvoA
G2wlxZj0M5NxB2j6Mgn0ilzFeVzmP/GnprzcDyy6DANpi+rfIrZAKyTRhgpkWvnJ
531rCPK4HxnMKynsX+vH7sF9u0kxjPm6jYVFvTvkjqpLQ9DX
=3D/Rln
-----END PGP SIGNATURE-----

--------=_MB82896302-1E43-48B8-98EE-F2F3600EAD3E
Content-Type: application/pgp-keys; name="rainmakerraw@icloud.com.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="rainmakerraw@icloud.com.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: BCPG C# v1.8.1.0

mQENBFtSPGIBCACA1E2BjKjTOrhm43bkGwdwJHlgP04pimOFX3RrcA6YIg36mXvk
Cu8+q8wecTreZxGxVehb1VyQPkypI3k8UcfXWYm2t1uxGkiM/kCnUKsqBwJZXLxP
M9erPIENwIf1hICcsPjEuMq2nIhYV8kfCOgwZKnbezy7kZ24edbVldz3dMniqiEe
ipkXWUr8y2UomYreGosFsLENyj8RPFqYzCpvlFU9rT9wU5/+nwHtX1ySCmniR3MX
urAWm6mAAJU9g/0dv5Ua8BCvvR/dadz4RGA7CmvOYL8qcn5A5djFMOqNqIp9IQOn
9XNHR6+W8JzVwTpaz8xkbO/yr2kjhxn9uU5BABEBAAG0I0xlZSBZYXRlcyA8cmFp
bm1ha2VycmF3QGljbG91ZC5jb20+iQEfBBABAgAJBQJbUjxkAhsDAAoJEO8ly8w7
KKmSmXEH/2q1t8sSWRjGkPna3aHBEhfK6wqjcakqzoPbiJWwO50DGUhJYYna9X4Q
/JmpNq8EAytbqzQ9C+IFvhuFZtiTlbwlmTXDX+NuqqJNhS/CdPe3M8vmoMMfGRbV
YSCK+KsM2CSW1ocx0ui/tZbBYdp6QCbUCwQrcMZAU1EgKGzqyJ42/5mKFb4MhNoJ
XD9l8SpeG1Uu8+1ty34P7tzqnVaAYgHAbfmZAcp7m+hF9XBnQ1Z7XHiSyL5XQ+Be
Q8s4cUFBr9NQGLAnyZkwFm5E2mEmmzpPRxtH/qoY117ADpb0DTxYh15XKt83Ycde
JM17yeMPOq06eOlkDcCrkpWxxzm0u0a5AQ0EW1I8ZAEIAIBHrYq4z6yuiXf1717o
BjQGBO0wUipHcwhB5A6SPuEbqKF0spOL4ArmIeNqKYRDD7lQZI2vZBZ59Lwnndpb
fEywupbqQoIn1X0Hu1UHidDfKpHtuY5PpOaM5FrlWqfjz1beLusiLRNmjuwasJda
deb9SWCXK9i7T8BJApiCEqZHFoHVoI9kE8EY6yoid5+jsVAw3UIsDTtpPZeHqbod
DXwoIXH6LDdiuGBWZBgqDzANOwciX1fIRQcTxhwVHiPfdEO28G+KtPpLbfdbzk5D
dBM8Q22GMHwJg7InWvB6FUi2RULj2eEpOlOuJUnUBNXM8yfHSz8k/MjjRw3shLSy
iD0AEQEAAYkBHwQYAQIACQUCW1I8ZAIbDAAKCRDvJcvMOyipkqnsB/sGK/lvGT8Q
ous5rx7rn5bzr7CJYI9OqUwM8sQdDl8uwJsfKSMG6u73H+pklREatSZUZ3EaoYma
wRD2pXhCQcECIQRoEGAGS46g0h93a6+4IoEtFO/6AMmvH5r/Ctrnb8k1Cr//rNch
40+T0hbHo4iMHIiKovsI7agCv99W1LHg3bD9PN8Yymc9lnTb1XlhQ119bOrjISNM
Wjox8vCXNFFw5O/f+4JgdMf9e9TO9DRaD989CoaTg6YrTAwmcJlwB6UAfWie9Aw4
BOkzr3WwgQp5kEI9skCMcjjn5HwfK5FTfbg/pGFKM+l6VfgPj32RvEBl2Luku7IC
iiq7zIR+OnV1
=Oc2L
-----END PGP PUBLIC KEY BLOCK-----
--------=_MB82896302-1E43-48B8-98EE-F2F3600EAD3E--
