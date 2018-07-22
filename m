Return-Path: rainmakerraw@icloud.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f6c1e8e
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Jul 2018 16:06:24 +0000 (UTC)
Received: from mr11p00im-asmtp001.me.com (mr11p00im-asmtp001.me.com
 [17.110.69.252])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 691aca87
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Jul 2018 16:06:24 +0000 (UTC)
Received: from process-dkim-sign-daemon.mr11p00im-asmtp001.me.com by
 mr11p00im-asmtp001.me.com
 (Oracle Communications Messaging Server 8.0.1.2.20170607 64bit (built Jun  7
 2017)) id <0PC900F00Z4I6U00@mr11p00im-asmtp001.me.com> for
 wireguard@lists.zx2c4.com; Sun, 22 Jul 2018 16:15:18 +0000 (GMT)
From: Lee Yates <rainmakerraw@icloud.com>
To: =?utf-8?q?Jonathan=20Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Subject: Re[2]: Very low throughput in *BSDs (but only as a router)
Date: Sun, 22 Jul 2018 16:15:09 +0000
Message-id: <em2e24e324-b892-408f-b01f-9e4a1e77497f@lee-pc>
In-reply-to: <20180721221805.GD10598@latitude>
References: <emf8caba7e-aff8-451d-9ead-efc6ca4ae091@lee-pc>
 <20180721221805.GD10598@latitude>
MIME-version: 1.0
Content-type: multipart/mixed;
 boundary="------=_MB41BEFE14-D9AF-4373-B7D1-DB17A65926F7"
Cc: wireguard@lists.zx2c4.com
Reply-To: Lee Yates <rainmakerraw@icloud.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--------=_MB41BEFE14-D9AF-4373-B7D1-DB17A65926F7
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

>As far as I understand it, the virtual router OS is based on BSD,
>right?
>Are the virtual client OSes that you tested based on Linux?
>
>If that's the case, then the result is quite expected: There is a fast,
>in-kernel implementation for Linux[1], but no fast implementation for
>BSD.
>The implementation for BSD is wireguard-go[2], which hasn't really been
>optimized.
>
>
>Jonathan Neusch=C3=A4fer
>
>[1]: https://git.zx2c4.com/WireGuard/tree/src
>[2]: https://git.zx2c4.com/wireguard-go/about/

Thanks for your reply.

No, I can achieve (almost) full WAN line rate using *BSD as local
clients' OS too, not just Linux ones. The wireguard-go being in user
space doesn't really cause much damage on powerful hardware. For example
on GhostBSD (in a VM) I got >345Mbps down and 20Mbps up running wg-go on
the same machine. [1] The throughput problem only arises when I run wg
directly on the router instance.

I think I made some progress however. I need to do some testing on my
main workstation later, though, as I was working on a (lower powered)
laptop today. OpenBSD being limited to a single core for routing (I
believe its pf is now more multi-threaded however) could also be a
factor. I'm going to move my improved pf.conf over to FreeBSD on the
workstation and see if I get better throughput. I'm convinced I've made
a simple mistake in implementing NAT or one of the pf rules at this
point. It doesn't really make sense otherwise.

I'll get there in the end. :) Thanks again for your reply.
Kind regards,

Lee Yates
[1] https://i.imgur.com/XCFADnR.png=0A-----BEGIN PGP SIGNATURE-----
Version: BCPG C# v1.8.1.0

iQFBBAEBCAArBQJbVK2PJBxMZWUgWWF0ZXMgPHJhaW5tYWtlcnJhd0BpY2xvdWQu
Y29tPgAKCRDvJcvMOyipklBtB/90STajUjPPXF6F7hkfQdE3xVqNTjfaW4J93+MH
4CKC+wdGAS9riIycSTyEIT1VPjFm17dyUwAEO5hUNfF6anywjTEPWVnR2Mirvnkz
oKURCwEwMMQr1ZHEN/naiO9IfQm9OJKy/20RD0kYMT6Qdmejg7xtQWzkKUD745f/
sRzVxJe6484dHxLW/1bQc5ccWCe3rM6uq9Axo3RyOiWPvDey+pOBEnMvK3LtoGQg
EqddOo72dzjTlWwc2GP7wBxEWtlvMaIg0HYsxsbmh50zWSTuFYclBGDyiDSrHzfl
fe4iHqiRVa6sx7xVys903Dg83tTI/cdJbEGvH4lRu/VZguoe
=3DzIHq
-----END PGP SIGNATURE-----

--------=_MB41BEFE14-D9AF-4373-B7D1-DB17A65926F7
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
--------=_MB41BEFE14-D9AF-4373-B7D1-DB17A65926F7--
