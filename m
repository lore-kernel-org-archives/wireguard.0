Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03ECD60D09
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Nov 2024 01:47:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47e0e36c;
	Tue, 19 Nov 2024 01:43:10 +0000 (UTC)
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1fe2d613
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Nov 2024 22:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
 t=1731970699; x=1763506699;
 h=from:date:cc:to:mime-version:message-id:subject:
 content-transfer-encoding;
 bh=uOCkzoSHiJAiDYZFusLJ9OBEz5FlpCa8Y8HqQeFA+1E=;
 b=vEVJDwTSZwRKUxNBZC44UmQRxmxBvAGUgoEWVz18QpjStNI5H09D/JsH
 ieQiV28nGTSsaLxNLUzZXOUj2Clzygnz6W1/V5Sf0f5Thn1u1xYz1A1ci
 boh7S+WqSMAgR6BgPUCa+GhgaP4NwPOuE7ohZSFMODdWct+uq3ORHc+wq 8=;
X-CSE-ConnectionGUID: kke0BuBSRh+JtWNKrNCVXw==
X-CSE-MsgGUID: 74tnPZa7RO2m9bpH3+iY2Q==
X-IronPort-AV: E=Sophos;i="6.12,165,1728943200"; d="scan'208";a="27706713"
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 18 Nov 2024 23:58:18 +0100
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
Content-Type: text/plain; charset="utf-8"
X-Forward: 88.183.119.157
Date: Mon, 18 Nov 2024 23:58:18 +0100
Cc: =?utf-8?q?Jason_A=2E_Donenfeld?= <Jason@zx2c4.com>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>,
 =?utf-8?q?David_S=2E_Miller?= <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>
To: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Message-ID: <15e782-673bc680-4ed-422b5480@29006332>
Subject: [PATCH] =?utf-8?q?wireguard-tools=3A?= Extracted error message for
 the sake of legibility
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 19 Nov 2024 01:43:09 +0000
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

Hello,

This is a reminder about a patch sent to the WireGuard mailing list; CC=
ing the maintainers of drivers/net/wireguard/; below a verbatim of my c=
over letter.

Thank you,

**

I have been using WireGuard for some time; it does ease the configurati=
on of
VPNs. This is my first patch to the list, I asked to be subscribed; ple=
ase
confirm me it is the case.

I would like to improve my C programming skills; your feedback will be =
much
appreciated.

Ariel

-------- Original Message --------
Subject: [PATCH] wireguard-tools: Extracted error message for the sake =
of legibility
Date: Thursday, August 01, 2024 11:43 CEST
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
Reply-To: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>

To: wireguard@lists.zx2c4.com
CC: "Jason A . Donenfeld" <Jason@zx2c4.com>,	Ariel Otilibili <Ariel.Oti=
libili-Anieli@eurecom.fr>

References: <20240725204917.192647-2-otilibil@eurecom.fr> <202408010949=
32.4502-1-otilibil@eurecom.fr>



Signed-off-by: Ariel Otilibili <otilibil@eurecom.fr>
---
 src/set.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/src/set.c b/src/set.c
index 75560fd..b2fbd54 100644
--- a/src/set.c
+++ b/src/set.c
@@ -16,9 +16,19 @@ int set=5Fmain(int argc, const char *argv[])
 {
 	struct wgdevice *device =3D NULL;
 	int ret =3D 1;
+	const char *error=5Fmessage =3D "Usage: %s %s <interface>"
+	  " [listen-port <port>]"
+	  " [fwmark <mark>]"
+	  " [private-key <file path>]"
+	  " [peer <base64 public key> [remove]"
+	  " [preshared-key <file path>]"
+	  " [endpoint <ip>:<port>]"
+	  " [persistent-keepalive <interval seconds>]"
+	  " [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...]"
+	  " ]...\n";
=20
 	if (argc < 3) {
-		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [fwma=
rk <mark>] [private-key <file path>] [peer <base64 public key> [remove]=
 [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keepali=
ve <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]=
...\n", PROG=5FNAME, argv[0]);
+		fprintf(stderr, error=5Fmessage, PROG=5FNAME, argv[0]);
 		return 1;
 	}
=20
--=20
2.45.2

