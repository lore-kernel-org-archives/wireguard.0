Return-Path: <SRS0=tDKf=NY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACE1C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 00:57:41 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27D4461057
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 00:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27D4461057
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bbff755;
	Thu, 2 Sep 2021 00:57:38 +0000 (UTC)
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f001cdc5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 2 Sep 2021 00:57:34 +0000 (UTC)
Date: Thu, 02 Sep 2021 00:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail; t=1630544253;
 bh=DmzenNkqe9/L1uKkfh8eqSVdJtOYnIKNp67dksiley8=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=Br6JemWXWkqbdIkgE1NHg4eXQjvCkPxBKSAr+j0vTAeVCFvE7M+q6qlNYCt+Mcyl6
 3p/+HELjahaGl3xn90k1tMvNf/3C0gNXu4WTEWOhh+NswGPwh3IC6j9plkf6JNxJ1b
 PegaeM3Jtj49xj9dOizPByIfDSs/U1LPKmL/QqIM=
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Neutron <dotneutron@protonmail.ch>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "roop@roopc.net" <roop@roopc.net>
Subject: [wireguard-apple] [iOS] Running WireGuard on a simulator
Message-ID: <-_8oxop6VI5mP0UY_0vydSMUBInbj0hR4IUPDWshTaRG0-6O9ybfu6kzIAk68XdY9N-LHiVgaiWhNQw6-iYG1cR14pfODj2o5JMStY-75ns=@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Neutron <dotneutron@protonmail.ch>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

I've tried running wireguard-apple on an iOS simulator and encountered some
trouble during the compilation of WireGuardKitGo. I did this on an Apple M1=
,
which I thought at first would be the culprit.

The Go version is "go1.16 darwin/arm64". The build process fails at
# runtime/cgo
Undefined symbols for architecture arm64:
  "_darwin_arm_init_mach_exception_handler", referenced from:
      _x_cgo_init in _x004.o
  "_darwin_arm_init_thread_exception_port", referenced from:
      _threadentry in _x004.o
      _x_cgo_init in _x004.o
ld: symbol(s) not found for architecture arm64

This issue was reported a few times in Go's issues section, e.g.,
https://github.com/golang/go/issues/45772#issuecomment-874616905

Further head banging lead me to the discovery that

xcodebuild -target WireGuardiOS -sdk iphoneos14.5

actually builds successfully. I looked through the Makefile and applied som=
e
monkey see, monkey do. It turns out I could get it to link by adding
GOOS_iphonesimulator :=3D ios.

For a moment I thought this was a definite win, but it turns out connecting=
 to
one of the test tunnels doesn't do anything. I hit a dead end after finding=
 this
answer on a forum thread.

https://developer.apple.com/forums/thread/651779?answerId=3D617050022#61705=
0022

"If you=E2=80=99re talking about the iOS Simulator here, be aware that, bec=
ause of the
way they interact with the networking stack, NetworkExtension providers onl=
y
work on real hardware."

I don't have an actual iPhone on hand at the moment, so I guess the questio=
n is,
is the project supposed to work only on real hardware? Was that flag left o=
ut
intentionally? If so, is there a way to get it to run properly on simulator=
s?

I'm a neophyte when it comes to anything iOS related, so perhaps someone
with more experience can shed some light on the subject.

Neutron
