Return-Path: <SRS0=LBMS=NH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F08ECDE46
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Oct 2018 01:23:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 899822082B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Oct 2018 01:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="3POtod2D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 899822082B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 491b459c;
	Sat, 27 Oct 2018 01:20:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1a48675
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Oct 2018 01:20:27 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27c0cab5
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Oct 2018 01:20:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7bb41ec
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Oct 2018 01:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=nKoefFLH0AW4/t9gpoDwIP8iZKw=; b=3POtod
 2DlLdryjqomihabJEornAKFolKYZaPyoOySXlKuHSId3a6c8OGYpbrzK0ow4TGCF
 9J7PjGVSU4Ab9WTanNgeUmdps4X6Wm0e0kJUsn6hYAOUXO8EHSgVzh98l0Ca91uD
 sASVNJuQf+sReRUgRZbdcLfQHf7+K1MSxbPplTNK9ok580h9wTO804B8AqmOUGZv
 FkN+uKJPmGVJhKqhu6duvLDKbhSmha69g45k4NejGuH768iYytaYIHS4fq6Y4TTJ
 Dh5oe/WloSomKmmfxZEqAMwzy18k08nAL9hQZ7brfmiLPC5QvkOV2LK5zHzEVR8P
 9DUHWteHE6tPPXHA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 919dd398
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Oct 2018 01:20:27 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id d5so2755860oti.6
 for <wireguard@lists.zx2c4.com>; Fri, 26 Oct 2018 18:23:30 -0700 (PDT)
X-Gm-Message-State: AGRZ1gImCmm08jyavXDjafS9MTXBN56A1uqLg5jZ5nykDi+FXs1r7aO9
 /hB7N2TCagKW+lgrSE2STdqs806KqSPPRH6TNFA=
X-Google-Smtp-Source: AJdET5cawmDsCpj0YAVVQ5wBOoPGGBNdEG3rDu1BZXe4TniozGuJbPKgtdtnkCEPS+jovYfuK62O5GmrbHpNu8usfsA=
X-Received: by 2002:a9d:27aa:: with SMTP id c39mr3407418otb.144.1540603410178; 
 Fri, 26 Oct 2018 18:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20180810080617.20283-1-ahanins@gmail.com>
 <CAHmME9pCdYSc5vLUJt_7xkCG9PLMkQE5qMMbrxQ9uCq0U0KL-Q@mail.gmail.com>
 <fef438a2-f085-b3fd-4d8e-041b5c62c030@gmail.com>
 <CAHmME9o3uu6ZN7ptuDorWJ5C0B1LMnU7Qf6V2NN0Kdv20WBggg@mail.gmail.com>
 <0d8cad17-593a-9e96-eb4e-dc01c87743fe@gmail.com>
 <be9f1e51-6ed4-3d21-2c20-c7ed6d31aadb@gmail.com>
In-Reply-To: <be9f1e51-6ed4-3d21-2c20-c7ed6d31aadb@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 27 Oct 2018 03:23:18 +0200
X-Gmail-Original-Message-ID: <CAHmME9qg0uaLyWwJkm4efwnijq6KQt-Or+OMnL34bET9=8QcoQ@mail.gmail.com>
Message-ID: <CAHmME9qg0uaLyWwJkm4efwnijq6KQt-Or+OMnL34bET9=8QcoQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] Fix broken inner checksums for non TCP/UDP protocols
To: ahanins@gmail.com
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

Merged as https://git.zx2c4.com/WireGuard/commit/?id=d985b8c767ed8a20d9cf1c368f153e6a52299aaf

Thanks for your analysis and sorry for the delay.

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
