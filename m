Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B309DC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 02:17:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACB4A60F70
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 02:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACB4A60F70
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5da251f;
	Fri, 24 Sep 2021 02:17:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8eb88be6
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 02:17:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A3C461039
 for <wireguard@lists.zx2c4.com>; Fri, 24 Sep 2021 02:17:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="VTnVqkLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632449837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d8HCrnfSUaEkQ5FaJMLsSK1qy1TFYEIWHf+etIysqWg=;
 b=VTnVqkLWTR/272dheA9LzeKtdxLq/23+4e3N0UHbP0wJa0Wut50Q4CSq4hid9lkkmlcf5n
 JrPgDZ3TqWTtWPfYvorTX7SyF5EPdw5HYZBF9IiTtnzU/Qxf0ee5hF3lC/+JjpiY7XuqZI
 hrcBXjKcCD+2EvVNGkslifdq3unzCbY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ecc22a81
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 02:17:17 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id i12so2503796ybq.9
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 19:17:17 -0700 (PDT)
X-Gm-Message-State: AOAM531U3IH8fMvzplscn6w+V+s40lFS5RES7ByYsTMk/5TnVtPvjdXS
 4jQjJ3dnxd9BEaHtJ0h1KKHVd8KBHmU/MwKETms=
X-Google-Smtp-Source: ABdhPJxImL2Xm/yQYFQds3ybE/3bwwVMsuDoCQeqGDZNMqtOmkRzOWqzZhk1FMPnIWfet0Jj8cRm5fxO4tMtHNIcPJg=
X-Received: by 2002:a25:3214:: with SMTP id y20mr9556064yby.416.1632449836574; 
 Thu, 23 Sep 2021 19:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9oKfJJfnrKeXcaHeb-oa+JZ+OgnxLVny==uSgwa5c5sKA@mail.gmail.com>
 <F238DB7D-1876-4821-ABC2-4FCF029FBB2B@anatoli.ws>
 <CAHmME9orYEOFa-33XvYs==XHjsUrxTn2BtOaVySwFuxS+oj+MQ@mail.gmail.com>
In-Reply-To: <CAHmME9orYEOFa-33XvYs==XHjsUrxTn2BtOaVySwFuxS+oj+MQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 23 Sep 2021 20:17:04 -0600
X-Gmail-Original-Message-ID: <CAHmME9oH6s=x0W+aBvGumTtJ9=bj+a9SBy0TQxXv8ZtU-pnDBA@mail.gmail.com>
Message-ID: <CAHmME9oH6s=x0W+aBvGumTtJ9=bj+a9SBy0TQxXv8ZtU-pnDBA@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: Anatoli <me@anatoli.ws>
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

On Thu, Sep 23, 2021 at 11:26 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Thu, Sep 23, 2021 at 8:42 AM Anatoli <me@anatoli.ws> wrote:
> > Please let us know in this thread when the update is in the AppStore.
>
> Indeed I will. It's been in the "waiting for review" state for about
> 13 hours. So hopefully that'll change somewhat soonish.

This has been released now. I'll send out an email in a new thread
announcing this.
