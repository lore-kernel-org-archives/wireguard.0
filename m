Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B38EF06E4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:13:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9db7982e;
	Sun, 8 Feb 2026 17:10:46 +0000 (UTC)
Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2a2c8b42
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Jan 2026 19:58:42 +0000 (UTC)
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
 by mail.w13.tutanota.de (Postfix) with ESMTP id CDF3D104C151E
 for <wireguard@lists.zx2c4.com>; Wed, 28 Jan 2026 20:58:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769630321; 
 s=s1; d=tutamail.com;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
 bh=fznMSdv5H+Tmc+dQ7RnbtsRx1e1o29gY3/LAevOWQYo=;
 b=arpaE1o6G2vZKUnmYT5GkpGG1quY64p46H8k+jBZtADRohQTGIC0X2UUqypbP1Dg
 8+seEwBK4s5PqWNvjT7cx9B+yi9pOmStxx9LHXFhXyBhfnvfV0XLrI6ylvSR/VhZ1zE
 PFZ71jx3it+rUnT+Oq+gPafnWOn/c4MlGzFzG94DozXNxxxPiSnFdJ5NeTINAewUP8S
 YpEd/cbQZ86WJgoemZX8joO4iLRDtC1m+upLB2ZVc+vLJZC4S/U77Lio+Y1HZBLVu5Z
 Yn4JxhS5Pca+mQtXAqhIdJketIL61ULZKQ+11R8lvhCHKqcdxTSE55U1WbxFY+ZfNVj
 fqEXeSZYGA==
Date: Wed, 28 Jan 2026 20:58:41 +0100 (CET)
From: Alex <alspm@tutamail.com>
To: Wireguard <wireguard@lists.zx2c4.com>
Message-ID: <OjwZJkl--F-9@tutamail.com>
Subject: Unable to import files in wireguard app on some Android TV devices
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Feedback-ID: 01bad2004f40c4185620b6d4d0a6323d3b8bf1a0eb832ff3bee91e2646eef845e909bba235b909666a0ffd3fe201be4e9385bbb9109af09289c6b17466aed5b9bd:TurnOnPrivacy!:tutamail
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:10:11 +0000
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

Attempting to import a client config file results in the message "Please in=
stall a file management utility to browse files" on my device running Fire =
OS 8 (Android TV 11 based).

This is likely due to commit=C2=A067db72a (TvMainActivity: use OpenDocument=
 instead of GetContent), as it=C2=A0occurs with v1.0.20260102, but not with=
 v1.0.20250515.

According to the documentation [1]: "Third-party apps can't respond to an i=
ntent with the ACTION_OPEN_DOCUMENT action. Instead, the system receives th=
isintent and displays all the files available from various apps in a unifie=
d user interface."

My device does not appear to have a first-party file picker, which would ex=
plain why OpenDocument does not work.

The commit mentions that the change was necessary for Android TV 14 (is it =
actually?), but regardless there should be a fallback to=C2=A0GetContent if=
 OpenDocument fails.

[1]=C2=A0https://developer.android.com/guide/components/intents-common#Open=
File
