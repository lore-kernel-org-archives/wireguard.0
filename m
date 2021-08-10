Return-Path: <SRS0=EM+o=NB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD14BC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Aug 2021 20:37:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4551260462
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Aug 2021 20:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4551260462
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b0417e0;
	Tue, 10 Aug 2021 20:37:34 +0000 (UTC)
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c9c32ad4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Aug 2021 20:30:03 +0000 (UTC)
Date: Tue, 10 Aug 2021 20:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail; t=1628627402;
 bh=n93LOYj4jFBNPlko38lEsP4SsXRFwKWzkViUXH3U9xo=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=dBy5rsnlyVRYfiBe/vw/krT4bUmCMOpWley6XFNqax15nj8ULYJn/OUDtP4zubIdJ
 pw25/xBmbpuC8p6qSiztq0U4ilJr5cdGf3X8MXIuAuhlAnZNWs6hchyMQ7Nv6n1PTq
 VJW78DXYK4fpJcGy2q0Fr10AcG+ZjZ9ZCulQ1c4o=
To: wireguard@lists.zx2c4.com
From: dotneutron <dotneutron@protonmail.ch>
Cc: Jason@zx2c4.com, Neutron <dotneutron@protonmail.ch>
Subject: [PATCH] embeddable-dll-service: add ability to derive public key from
 private key
Message-ID: <20210810202936.1537-1-dotneutron@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 10 Aug 2021 20:37:33 +0000
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
Reply-To: dotneutron <dotneutron@protonmail.ch>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Developers using the embeddable service might find it useful to be able
to derive the public key from a given private key.

There was no apparent explanation for the bit setting/unsetting when
generating a private key. The reading material should help developers
understand the reasoning.

Signed-off-by: Neutron <dotneutron@protonmail.ch>
---
 embeddable-dll-service/main.go | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/embeddable-dll-service/main.go b/embeddable-dll-service/main.g=
o
index b2e02fa4..a9b9dacd 100644
--- a/embeddable-dll-service/main.go
+++ b/embeddable-dll-service/main.go
@@ -53,10 +53,20 @@ func WireGuardGenerateKeypair(publicKey *byte, privateK=
ey *byte) {
 =09if err !=3D nil || n !=3D len(privateKeyArray) {
 =09=09panic("Unable to generate random bytes")
 =09}
+
+=09// See https://www.jcraige.com/an-explainer-on-ed25519-clamping.
 =09privateKeyArray[0] &=3D 248
 =09privateKeyArray[31] =3D (privateKeyArray[31] & 127) | 64

 =09curve25519.ScalarBaseMult(publicKeyArray, privateKeyArray)
 }

+//export WireGuardDerivePublicKeyFromPrivateKey
+func WireGuardDerivePublicKeyFromPrivateKey(publicKey *byte, privateKey *b=
yte) {
+=09publicKeyArray :=3D (*[32]byte)(unsafe.Pointer(publicKey))
+=09privateKeyArray :=3D (*[32]byte)(unsafe.Pointer(privateKey))
+
+=09curve25519.ScalarBaseMult(publicKeyArray, privateKeyArray)
+}
+
 func main() {}
--
2.32.0.windows.2


