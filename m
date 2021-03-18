Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA80C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 14:06:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F03A64DE8
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 14:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F03A64DE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lostca.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89ac37af;
	Fri, 19 Mar 2021 14:04:51 +0000 (UTC)
Received: from aloka.lostca.se (aloka.lostca.se [178.63.46.202])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2eab1317
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Mar 2021 20:28:42 +0000 (UTC)
Received: from aloka.lostca.se (aloka [127.0.0.1])
 by aloka.lostca.se (Postfix) with ESMTP id 24F181585
 for <wireguard@lists.zx2c4.com>; Thu, 18 Mar 2021 20:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=lostca.se; h=from:to
 :subject:message-id:date:mime-version:content-type; s=howrah;
 bh=EPeSODd6WvY7EHm/uBIYWCa3M1I=; b=f43S9TywVpMeTcNY/0kQH0VmmJOJ
 /c9fE4ZVcbxQofuhNgszv86bTUInHam1x6lcSvh9Yug8fvT96l8vnzYQpKAMP9wY
 RxPfrWfVwINmkmqUQcFIBiegcFSsGwZOHs9hxX7tj1/N0ryxjaHSGx4DZndoogBu
 YvmfntyvimgtYT4=
Received: from chateau.d.if (unknown [123.136.206.40])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (3072 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: abbe)
 by aloka.lostca.se (Postfix) with ESMTPSA id C687C1584
 for <wireguard@lists.zx2c4.com>; Thu, 18 Mar 2021 20:28:41 +0000 (UTC)
From: Ashish <ashish.is@lostca.se>
To: wireguard@lists.zx2c4.com
Subject: Unable to serve TCP connections over wireguard interface on FreeBSD
 13.0-RC2
Message-ID: <e1a14dfa-014c-7740-6205-75cd96933dba@lostca.se>
Date: Fri, 19 Mar 2021 01:58:38 +0530
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DgCyEmz1jj4PwHJHp6WNcXLvV0hX6dYwF"
X-Mailman-Approved-At: Fri, 19 Mar 2021 14:04:49 +0000
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DgCyEmz1jj4PwHJHp6WNcXLvV0hX6dYwF
Content-Type: multipart/mixed; boundary="cUPaiHeK5WO9jlStFqhF9X6idK3QpgvKo";
 protected-headers="v1"
From: Ashish <ashish.is@lostca.se>
To: wireguard@lists.zx2c4.com
Message-ID: <e1a14dfa-014c-7740-6205-75cd96933dba@lostca.se>
Subject: Unable to serve TCP connections over wireguard interface on FreeBSD
 13.0-RC2

--cUPaiHeK5WO9jlStFqhF9X6idK3QpgvKo
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I'm running if_wg kernel module (git revision: 5ef4d3efa691e71) on
FreeBSD 13.0-RC2.

With 172.18.10.1 being my local host's wireguard interface's IP address,
I can receive SYN packets, but it does not seem to send any
corresponding SYN/ACK.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=

01:26:26.327484 IP 172.18[.10.3.34160 > 172.18.10.1.22: Flags [S], seq
1278197331, win 64860, options [mss 1380,sackOK,TS val 223949166 ecr
0,nop,wscale 7], length 0
01:26:42.708175 IP 172.18.10.3.34160 > 172.18.10.1.22: Flags [S], seq
1278197331, win 64860, options [mss 1380,sackOK,TS val 223965550 ecr
0,nop,wscale 7], length 0
01:27:14.964162 IP 172.18.10.3.34160 > 172.18.10.1.22: Flags [S], seq
1278197331, win 64860, options [mss 1380,sackOK,TS val 223997806 ecr
0,nop,wscale 7], length 0


01:28:34.035384 IP 172.18.10.2.41905 > 172.18.10.1.22: Flags [S], seq
2569759726, win 65535, options [mss 1380,nop,wscale 11,sackOK,TS val
3991744006 ecr 0], length 0
01:28:34.035392 IP 172.18.10.2.41905 > 172.18.10.1.22: Flags [S], seq
2569759726, win 65535, options [mss 1380,nop,wscale 11,sackOK,TS val
3991745042 ecr 0], length 0
01:28:34.036002 IP 172.18.10.2.41905 > 172.18.10.1.22: Flags [S], seq
2569759726, win 65535, options [mss 1380,nop,wscale 11,sackOK,TS val
3991747129 ecr 0], length 0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=


ICMP works fine:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=

01:53:15.638529 IP 172.18.10.2 > 172.18.10.1: ICMP echo request, id
47881, seq 0, length 64
01:53:15.638535 IP 172.18.10.1 > 172.18.10.2: ICMP echo reply, id 47881,
seq 0, length 64
01:53:16.624443 IP 172.18.10.2 > 172.18.10.1: ICMP echo request, id
47881, seq 1, length 64
01:53:16.624448 IP 172.18.10.1 > 172.18.10.2: ICMP echo reply, id 47881,
seq 1, length 64
01:53:17.672109 IP 172.18.10.2 > 172.18.10.1: ICMP echo request, id
47881, seq 2, length 64
01:53:17.672115 IP 172.18.10.1 > 172.18.10.2: ICMP echo reply, id 47881,
seq 2, length 64
01:53:18.676223 IP 172.18.10.2 > 172.18.10.1: ICMP echo request, id
47881, seq 3, length 64
01:53:18.676230 IP 172.18.10.1 > 172.18.10.2: ICMP echo reply, id 47881,
seq 3, length 64
01:53:19.682131 IP 172.18.10.2 > 172.18.10.1: ICMP echo request, id
47881, seq 4, length 64
01:53:19.682136 IP 172.18.10.1 > 172.18.10.2: ICMP echo reply, id 47881,
seq 4, length 64
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=


And I can make outbound TCP connections:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=

01:50:43.267331 IP 172.18.10.1.55541 > 172.18.10.2.22: Flags [S], seq
2119392003, win 65535, options [mss 1380,nop,wscale 11,sackOK,TS val
1918472905 ecr 0], length 0
01:50:43.415524 IP 172.18.10.2.22 > 172.18.10.1.55541: Flags [S.], seq
2602046635, ack 2119392004, win 65535, options [mss 1380,nop,wscale
11,sackOK,TS val 1347987709 ecr 1918472905], length 0
01:50:43.415532 IP 172.18.10.1.55541 > 172.18.10.2.22: Flags [.], ack 1,
win 33, options [nop,nop,TS val 1918473053 ecr 1347987709], length 0
01:50:43.415613 IP 172.18.10.1.55541 > 172.18.10.2.22: Flags [P.], seq
1:31, ack 1, win 33, options [nop,nop,TS val 1918473053 ecr 1347987709],
length 30
01:50:43.614035 IP 172.18.10.2.22 > 172.18.10.1.55541: Flags [P.], seq
1:39, ack 31, win 33, options [nop,nop,TS val 1347987870 ecr
1918473053], length 38
01:50:43.653218 IP 172.18.10.1.55541 > 172.18.10.2.22: Flags [.], ack
39, win 33, options [nop,nop,TS val 1918473291 ecr 1347987870], length 0
01:50:43.693420 IP 172.18.10.1.55541 > 172.18.10.2.22: Flags [P.], seq
31:1055, ack 39, win 33, options [nop,nop,TS val 1918473331 ecr
1347987870], length 1024
01:50:43.693435 IP 172.18.10.1.55541 > 172.18.10.2.22: Flags [P.], seq
1055:1543, ack 39, win 33, options [nop,nop,TS val 1918473331 ecr
1347987870], length 488
01:50:43.818391 IP 172.18.10.2.22 > 172.18.10.1.55541: Flags [P.], seq
39:1119, ack 31, win 33, options [nop,nop,TS val 1347988093 ecr
1918473291], length 1080
01:50:43.819870 IP 172.18.10.1.55541 > 172.18.10.2.22: Flags [P.], seq
1543:1591, ack 1119, win 33, options [nop,nop,TS val 1918473457 ecr
1347988093], length 48
01:50:43.880995 IP 172.18.10.2.22 > 172.18.10.1.55541: Flags [.], ack
1543, win 33, options [nop,nop,TS val 1347988163 ecr 1918473331], length =
0
01:50:43.991756 IP 172.18.10.2.22 > 172.18.10.1.55541: Flags [P.], seq
1119:1571, ack 1591, win 33, options [nop,nop,TS val 1347988277 ecr
1918473457], length 452
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=




The tunnel is configured using `wg-quick'. The firewalls are unloaded
for this testing.
 I have made sure to delete the if_wg.ko shipped with FreeBSD, and
rebooted the host before trying this.



And ofcourse, if I switch to userspace Go implementation, everything
works as expected, keeping rest of the configuration same, and with
firewalls enabled.

Thanks!
--=20
Ashish


--cUPaiHeK5WO9jlStFqhF9X6idK3QpgvKo--

--DgCyEmz1jj4PwHJHp6WNcXLvV0hX6dYwF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE9oLNzDncD+rhFiC2x0bPqedPpLAFAmBTt/cFAwAAAAAACgkQx0bPqedPpLBw
gA//V7XkUwtPRLzaGr68/fM5tpmtg4dG+K4na1hcYdG+YiaxVQ3P2jPJ7UJNq4OaDoz9UFZhPzHo
ucmBzeUCQudm+eXcjw/2onKO5hLJphszK5mKwKHGtfu++m/Cmgzpb1VSiNwzD5ixTQHYSvvO3yHa
HSsqFLx4FH6aofITdYTVCbrElsztDu5pSoNtLAd9ndtEuZ3H1bUW8YOctyp12KiQfKhFZ39kALr6
FtJBYHnlk7vz9ZC6Aw1v8ZmLtB1s6xZGLG/mU65l+SqNBR7jfPV1fJe0nF+zpGVcTcjTnvAdBoHv
T7ylGMEAw54QHt7RBWcGxxuRHHCdDw+DbOwjenwEUL2cdjFkcDLEjIsoPJneUtabsgGNKPtaCJqp
nUOE2kHPSOPY3pHSHcb5ATvY7XHbK6HX1XS//TwZSnbd27H2VCcf0AF5g/syxJd3nHeaelde9CNy
oVZ8pl2Pvcg+6KjQiuSwo/353zpW91wKLYcg4/AVJcJAf6zmj6yL1LkVMnsJlWIr0RUQnjDHd+61
1rgQ4PIr/0bedJ1x3wzFfFkBNaQpE1yHYYrhwqyQD8eERfatnNRhgxEM2GwMxuZO5gdyc4LcjZjD
m5a9hGhJFM27N9agWfY54N8xQWwNLhbcSDnR14fJQl6wKI3Kf5XHRL7nTsmmKkPyOqMXUfJK0SEH
lUs=
=RZVI
-----END PGP SIGNATURE-----

--DgCyEmz1jj4PwHJHp6WNcXLvV0hX6dYwF--
