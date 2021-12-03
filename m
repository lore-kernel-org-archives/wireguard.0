Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AAEC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Dec 2021 22:26:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2d0c81b3;
	Fri, 3 Dec 2021 22:25:29 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d26a1205
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Dec 2021 22:25:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 07EE6B8297E
 for <wireguard@lists.zx2c4.com>; Fri,  3 Dec 2021 22:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85738C53FCB
 for <wireguard@lists.zx2c4.com>; Fri,  3 Dec 2021 22:25:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="gtbDsgXc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1638570325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dDGAT9rAI+PF6i06Wfy7o483y9xLRlcgS1GGetEQolI=;
 b=gtbDsgXceQc/fxTnns5ZMMHQ3YPeK1F6ZFTWmQAq0xCk0tVgr+26UMMaN7BhdQgnDdi/vB
 nyLzTyaWb3BMBaYa9QSnmSEXM+olA50Lggn+pd8xz2emUNh7rU7lOIK6OjzIhoE9KaKHzT
 Yy1uaN7Lj2vU7MX/gWH8NlQxz2WpVdc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 01cf65ea
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Dec 2021 22:25:25 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id d10so13598485ybn.0
 for <wireguard@lists.zx2c4.com>; Fri, 03 Dec 2021 14:25:25 -0800 (PST)
X-Gm-Message-State: AOAM532+/rQl5xwAecy5KmiN350lyGux+A28sW4LB2EFLT5UsQD1BGdM
 LuDnci6QUmFPhXub5SoGYMGSS2BKxlmJGBLjcmk=
X-Google-Smtp-Source: ABdhPJx92tQfNeK6kFl+2bDBCuZRa1SHAJ4qIYrHV86/MYvQ0KpDqE4Zl8U6XL2ra6tQdUNd3XHt5V4lec2r0Pg6a5A=
X-Received: by 2002:a25:9781:: with SMTP id i1mr26404059ybo.638.1638570324580; 
 Fri, 03 Dec 2021 14:25:24 -0800 (PST)
MIME-Version: 1.0
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9o38fA4_nDVyS9FvO1EL-Z4fS+a2eCo6Xq7VzMSrPYNKQ@mail.gmail.com>
 <c772d6c2-dac7-8c11-7c41-aaa6435a0bd6@grsecurity.net>
 <CAHmME9oyopU8euSuVy7su91fia6xG5V+9i+QodCBdTGdR_rD5Q@mail.gmail.com>
In-Reply-To: <CAHmME9oyopU8euSuVy7su91fia6xG5V+9i+QodCBdTGdR_rD5Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 3 Dec 2021 23:25:13 +0100
X-Gmail-Original-Message-ID: <CAHmME9o=xuWJ610OXZi7_gE0EWxWdMxjcp7F3b8R=8h89kLUHg@mail.gmail.com>
Message-ID: <CAHmME9o=xuWJ610OXZi7_gE0EWxWdMxjcp7F3b8R=8h89kLUHg@mail.gmail.com>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: Mathias Krause <minipli@grsecurity.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Dec 3, 2021 at 11:20 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> on old kernel versions when I backported this to

Er, nix the "when I backported this" part: you sent it originally for
compat and never for mainline.
