Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1105AC6787D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 22:50:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85CC12084D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 22:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="N4FZ1lto"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85CC12084D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e3c507d;
	Sun, 7 Oct 2018 22:49:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97c25b3f
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 22:49:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93884d6b
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 22:49:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b9a1e43
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 22:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=UCJBYOp/pGDnwD5t3gMSWA3ZcxA=; b=N4FZ1l
 tolkU/qJFjdf0BOhT9jZYLh1vs3Wolw/yEZn6j2S1qZSslF6L1xBi7qk9X+pBVPt
 6HclJJSJn6L8HC4WkFh/ixhghehMKjiGGgKee5N4z1b+6zlgYjzC8ADIebeH50DM
 aFSgfbxyRglqvvIE0rZ127mQv3e5kDCHAwOUxa+1MqYVHg0BKTkcwkcMcpZsQnzV
 sMn2toSR9Jlp6Y8ZTX86R9Uf0XzSzBDyR/mH6uSmY6kZuqBesQ1iu1g/NZr6Cfs3
 QJIfMlIkgRem1W3Ydmb6W349MC7gbxIHdXoqaHcOkTF/8AXqNN2ctaW1NSjrNIgr
 QNCU89G1YbtLF6bg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2d979ae8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 22:49:38 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id u74-v6so14379796oia.11
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 15:50:21 -0700 (PDT)
X-Gm-Message-State: ABuFfog2j8Uk1MFEUL00YtXCeFEqOXrOLE8uvlu6oTXw3r28IHiH4PZL
 m0XtQgW0Ldi+jNx6TQ+Ij6/cSJZCLoaFjwyw4jU=
X-Google-Smtp-Source: ACcGV60l1YKlhPKArsyupicFZ/ZLBxr2NgPZdb6PVRKMbRsinZBLsfSitmKwCEepEM4ummioliJE4KmULBldzjmfdD0=
X-Received: by 2002:aca:ce4c:: with SMTP id
 e73-v6mr3568788oig.225.1538952620704; 
 Sun, 07 Oct 2018 15:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <6b314daa5d672a51@frisell.zx2c4.com>
 <8j30b7w3yIgg5rmXSRUNlDH8yquzSydWwqfdQrnRe-T7mK5e_lYfD2v5IKjgHVAcWptoOVXZ_wENwJ1i733Yn45_TjlMg7Tf_WmW7Dkeuco=@protonmail.ch>
 <CAHmME9qboTvSU1+bu8Oi-zwBp8f6UWnfaGb-NEtfsnvnJUL66w@mail.gmail.com>
 <1538952235.1510043.1533890536.493A745F@webmail.messagingengine.com>
In-Reply-To: <1538952235.1510043.1533890536.493A745F@webmail.messagingengine.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 8 Oct 2018 00:50:09 +0200
X-Gmail-Original-Message-ID: <CAHmME9pbcPFghexTJnZz0kqJvTwa_bxpnox1vho8rMTQWd_pCQ@mail.gmail.com>
Message-ID: <CAHmME9pbcPFghexTJnZz0kqJvTwa_bxpnox1vho8rMTQWd_pCQ@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20181007` Available
To: David Kricker <logcabin@fastmail.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, Oct 8, 2018 at 12:44 AM <logcabin@fastmail.net> wrote:
>
> I get this when building on armv7, but it doesn't seem to affect the build:
>
> echo '  Building modules, stage 2.';
> make -f ./scripts/Makefile.modpost
> grep: ./arch/arm/Kbuild: No such file or directory

Fixed a few hours ago in the master branch. It won't affect the build, however.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
