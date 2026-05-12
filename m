Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2861FCD37AC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 May 2026 18:49:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a768444e;
	Wed, 13 May 2026 18:49:20 +0000 (UTC)
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch
 [109.224.244.121])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e9b4e739
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 May 2026 14:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1778597458; x=1778856658;
 bh=ZQt0QOzfLFjFfGtEwH+GFbw5+QYBjwtCnXcDv/Fd2e0=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=jICrMN/k6HbNoGd9NRUjXeRwpL+kmpmdAJp6VsqGBqPUTcTBHtklR8dl96Jq60WnI
 2IfRpIXUaHcToIL/0OJflA3DDJDI4b+e66/CRw5OWi5QtD7wWDYoKzuFj4CFvyBS8x
 5XizPO0itI887gsydC0o+B1qO8uTZvikCfT1AtZWBC5poNIZ1NAvdpxfBzu5drFxtP
 5f1U0pQOwMwjNO9S/BGwoJGNrahyYuUeU+n377Z8aDAnB0NLY8/+OaiinH4ve2r+Tz
 6A1R59J443kaA6vW1UagNdxXQPe4AqV6G2vY1Rrq6WzUICs8RoEM2NmVFnSpRNEQj3
 4E5vyq6o0v/ug==
Date: Tue, 12 May 2026 14:50:53 +0000
To: wireguard@lists.zx2c4.com
From: konstantineb@pm.me
Cc: Konstantine <konstantineb@pm.me>
Subject: [PATCH] Added space to allowedNameFormat
Message-ID: <20260512145040.1671-1-konstantineb@pm.me>
Feedback-ID: 9700997:user:proton
X-Pm-Message-ID: c233ef86a1ccb2fe7fcc3a8a8c1af7aea33290bc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 13 May 2026 18:49:18 +0000
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

From: Konstantine <konstantineb@pm.me>

Commit message:

fix(windows): support adapter names containing spaces

WireGuardNT permits NIC names with spaces (e.g., WireGuardCreateAdapter(L"D=
ata Center", ...)),
but the Windows implementation previously rejected them.
This update removes that limitation and enables full compatibility.

Signed-off-by: Konstantine <konstantineb@pm.me>
---
 conf/name.go | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/name.go b/conf/name.go
index c34db900..3f5c680e 100644
--- a/conf/name.go
+++ b/conf/name.go
@@ -24,7 +24,7 @@ const (
 =09specialChars         =3D "/\\<>:\"|?*\x01\x02\x03\x04\x05\x06\x07\x08\x=
09\x0a\x0b\x0c\x0d\x0e\x0f\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1a\x1b\=
x1c\x1d\x1e\x1f\x00"
 )
=20
-var allowedNameFormat =3D regexp.MustCompile("^[a-zA-Z0-9_=3D+.-]{1,32}$")
+var allowedNameFormat =3D regexp.MustCompile("^[a-zA-Z0-9_=3D+. -]{1,32}$"=
)
=20
 func isReserved(name string) bool {
 =09if len(name) =3D=3D 0 {
--=20
2.50.1.windows.1


