Return-Path: <SRS0=qC6o=R6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC7EC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Mar 2019 14:27:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1C612064A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Mar 2019 14:27:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="0/2D+xZa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1C612064A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 158c5a34;
	Wed, 27 Mar 2019 14:26:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db9d6ec0
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Mar 2019 14:26:05 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a23fbfb9
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Mar 2019 14:26:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62647a40
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Mar 2019 14:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=ye8R9P
 Jug8xH6JIgW4UK//0D6kY=; b=0/2D+xZa6hWWIDwIe0Bwt6m+c+dK4FWjlWwgBm
 LKV4aW8SlGNYhSritpr4bA52SFrf07pKJyT8kp32lh+NPRSJwxg7T7CxvB0FpKP7
 O5XCEnUoCqkwSnI9GBF5XEIArwj/Sw4C7jqarB7P/Y1F3MdNYuANloA3XzGMjfkM
 aur6ttf+7FlXvkM4WsL8o0VuhopCNSFig0waYVcX7OMmvFI76yT00U/NosXQv44e
 oU71wKolSsijI1465Ui7jKJr1nnwfy2mHu2M4dWcbfLmmjyxccePl0Jx8hcMnZRE
 +fe6LbYs2lsQykZH0ERPUFz/bvonUrA+lDdDbFcio/QxoyBQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 97e53265
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Mar 2019 14:04:53 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id u15so15021227otq.10
 for <wireguard@lists.zx2c4.com>; Wed, 27 Mar 2019 07:27:17 -0700 (PDT)
X-Gm-Message-State: APjAAAVUyo1/2kswNsrRc1lm7xgWFOZGrAPU7ze0PUtXoI3ow7eM8GLb
 vl+YlXpHpfTqe/PuNCf+PQW1If0ZQX/EFjJV6TE=
X-Google-Smtp-Source: APXvYqy/4FMCMYkv3G2dBK5NnqUewtr0SZj5yQbRgX+eusxFSSsB6rJk5zoiaZWDQwRZAVnmf8OpMzjKBPzSTbUWmW0=
X-Received: by 2002:a9d:3dc9:: with SMTP id l67mr27970083otc.199.1553696836354; 
 Wed, 27 Mar 2019 07:27:16 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Mar 2019 15:27:05 +0100
X-Gmail-Original-Message-ID: <CAHmME9qsK5Mt9nwHVOUf7i043TDBpHER4rt=Z9AAHjNhxVLeHQ@mail.gmail.com>
Message-ID: <CAHmME9qsK5Mt9nwHVOUf7i043TDBpHER4rt=Z9AAHjNhxVLeHQ@mail.gmail.com>
Subject: new rust implementation from cloudflare
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hey folks,

Looks like Cloudflare finally let their WireGuard implementation drop:
https://github.com/cloudflare/boringtun

They've been working on it for some time, and we've discussed this
privately at various points along the way. Each time it came up, I
asked them if they'd consider working with the WireGuard project
itself, and they've repeatedly refused. They have insisted on
remaining separate and expressed that they don't want to work as part
upstream. I expressed various concerns about unity of community and
compatibility of implementations, as well as vision for simplicity and
security, but they were pretty adamant about remaining separate. I
thought the invitation to put their engineers as the head of a
WireGuard subproject was a cool invitation, but alas. That's a bummer,
but that's how it goes; folks are entitled to do what they wish with
software they make. I guess they'll make products or something and
control is important to them; I just hope they don't fragment or
otherwise yank WireGuard in unfortunate directions with their access
to vast engineering resources. It remains to be seen how they'll use
it or what their objectives are.

The reason I think this matters and why their project is relevant is
because WireGuard could really, really use a Rust implementation. Past
developers working on it have flaked out, and we've wound up instead
with a somewhat iffy Go codebase. I haven't read Cloudflare's
implementation yet, and maybe it's garbage, but based on the people
involved, I imagine it's going to turn out to be pretty decent. So,
given the unwillingness of Cloudflare to work as part of upstream and
join our project, and upstream's need for a solid Rust implementation,
we may very well wind up forking it into `wireguard-rs`, to create
something that matches our standards of security and vision. I think
there's significant value in having a first-party Rust implementation
that we can maintain and keep up to date with our ongoing research.
And naturally the door remains open to Cloudflare if they'd like to
work with us.

Reviewing this, assessing our options, and determining whether it's a
good base from which to start will take some time. But as usual, our
progress and development will be in the open, and you're more than
welcome to chime in here or #wireguard if you're interested in getting
involved in one way or another.

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
