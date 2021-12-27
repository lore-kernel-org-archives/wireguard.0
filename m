Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB15CC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Jan 2022 18:24:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3db33d60;
	Tue, 4 Jan 2022 18:20:42 +0000 (UTC)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [2607:f8b0:4864:20::52d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c9c2b7bb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Dec 2021 07:43:05 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 2so12922170pgb.12
 for <wireguard@lists.zx2c4.com>; Sun, 26 Dec 2021 23:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ciltm22LgvFNAXznLPXxjsh1K5w8WBxpzCLSduNQ4dE=;
 b=MkKvBswbekU2S6JX8VwF5YCn21jnXwN5nQYKNCcfsM6kDDKxYFTNVAxs0i4BVl4byY
 H9LzTaPUfR/kSZl9VL8GS2gHJEZWJVZvwjO6EeNDVBccA2Lt9Q/913PdFd4IASxRYy+j
 t11uVr5saQtfvoII6F/of//UGlD4AtuszXXXsMphMV+LbbPNNyMuC7JAY4R0S0JBhAgJ
 l5jIImi83KPJhSvP0Lzncps0AJueLz34Bol5WRPOgmaYwXufnTa3dwSQpiiF/q9XzjR5
 QiTE5aW287poC/cs/BgChELunuyY/Z35DSSeh5dP2E+7eM1/Kq1UWTJccZMB83kZ83mD
 7GRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ciltm22LgvFNAXznLPXxjsh1K5w8WBxpzCLSduNQ4dE=;
 b=nXcegoDOCVen3ebm2iuWqFTAcPuxwcUCuObb4qWgnripIrv4w+rss5hOVxh45OLgfJ
 QXOIYqF2J//Nye26BRs88RIz7GRpSkDetxi1pvYQJxxY5j/jC9F0sjPN+O5T2vV0g01S
 Gbluxa9H5gyweiEHSUl3wAhcgrWQWlAE47jhMKifd2LS1QNrUvm32B27OVPXTAM3IR38
 ywtz8vs0IPfgZqL2aLmp5T987v+0pYDnzxCu7ASsXSyPVP7DzaRa9oZvIwts4Gwa/no2
 VAoqYukmz0JizWp+Nb+AtsgJgVcormVJeQjqLc0KLhCQaebPkthgkE8L5Ec5AIfbkijY
 jDrA==
X-Gm-Message-State: AOAM531uiF/4d3Wi4lFS0UEYQdHERy0pYi3C9xnlTe76uoFgcsZfXESr
 f5mGE+uyACPV2N+nK1rzmKoP3f2NsHCXr9yDPXuGHv20QBvDFmPkewk=
X-Google-Smtp-Source: ABdhPJwQXJ7c06UNK3kyWZdmBQYdpNRNuCFkVWMDvaxRiCvJUDUbmpaSpnFgmJScT3OdqeNpJmz606GVzCSzvVFU9UI=
X-Received: by 2002:a63:1213:: with SMTP id h19mr15039620pgl.468.1640590983929; 
 Sun, 26 Dec 2021 23:43:03 -0800 (PST)
MIME-Version: 1.0
From: Houman <houmie@gmail.com>
Date: Mon, 27 Dec 2021 11:12:27 +0330
Message-ID: <CABBZOskdS0P-3hx91JXkGkE5qaTdx_3B+gYGE4+44N9ZQg8Yhw@mail.gmail.com>
Subject: iOS WireGuard Kit integration with my project can't be distributed to
 AppStore
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 04 Jan 2022 18:20:36 +0000
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

I have followed the instructions from WireGuard Kit Integration to
create a simple client for myself.
https://github.com/WireGuard/wireguard-apple#wireguardkit-integration
I got it perfectly working.

But when I try to release it to the AppStore via Xcode -> Release ->
Archive I get into this situation
where the 'distribute app' option to the AppStore is missing.
Strangely the archive appears only after a few seconds under 'Other
Items' instead of under iOS Apps.

This has been reported previously and explained here:
https://stackoverflow.com/questions/55467829/xcode-10-1-doesnt-show-distribute-app-option-when-archiving-cant-archive
on Stackoverflow, but none of the solutions work for me.

Judging from this answer here:
https://stackoverflow.com/a/67650750/92153 It seems that this is
indeed an issue with Wireguard Framework.

Can someone please advise what to do?
Many Thanks,
