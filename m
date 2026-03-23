Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3094AF483D5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2026 17:09:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7259f861;
	Mon, 23 Mar 2026 17:09:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 79c36da5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2026 17:09:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B16DF44013
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2026 17:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4C4C4CEF7
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2026 17:09:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="arj7Digb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1774285780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gzGx2Bq45p4KoUso/dPHj4RpiGRdbSb0iwb9R4aM2DM=;
 b=arj7Digb3ti69chumsX6uU7xC37pmfNMsbdfBNQvBTW9YkP+ZBJ1wvKRUeMHPBX0jP6Vyd
 IBYqviTKiHL2f3RuSE8yYSs/gz3/bnDouGlo9RAp//xGfDqu2AjhzvMcPVdlTtHArgqOLn
 Gl1G53YH0ErWCiiX3jfVJVD78a9nqJU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7602241d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2026 17:09:39 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-7d750eeaec3so1266963a34.0
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2026 10:09:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YxoTJmENmGqWKL59YKtYiOp66f8UNbtINxzzVoy8+6drVQUpOCs
 T48BHOBgnv/Bb33h6Q0gf22+m5LzlbrnNKEPn0hD88Rx0kJPAvNSTON2JB1wC7lzPj1/dNvETp7
 gjgVlk/qiXyQS/ANxB/S2yyU77QTaidI=
X-Received: by 2002:a05:6870:8996:b0:417:31f3:5def with SMTP id
 586e51a60fabf-41c112b5cbamr7954976fac.32.1774285778105; Mon, 23 Mar 2026
 10:09:38 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Mar 2026 18:09:26 +0100
X-Gmail-Original-Message-ID: <CAHmME9q4gC3Ag4hW0ERTkZNi6VMv1-qMExO6+OfOKYZ5rC4mgg@mail.gmail.com>
X-Gm-Features: AQROBzAxV7nnTpzgPH0vu7uUCZ4JH5zcmefvUMk7xZ5WszkgrS-HRmtnuOesfjU
Message-ID: <CAHmME9q4gC3Ag4hW0ERTkZNi6VMv1-qMExO6+OfOKYZ5rC4mgg@mail.gmail.com>
Subject: Sunsetting support for old Windows versions
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Simon Rozman <simon@rozman.si>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hey everyone,

The time has finally come. Future releases of WireGuard for Windows
will support Windows =E2=89=A510 and Windows Server =E2=89=A52016.

With Windows 10 first released to manufacturing on July 15, 2015,
that's supporting an operating system that's 3,904 days old, as
opposed to supporting an operating system that's 6,088 days old.
Nonetheless, supporting an OS that's over 10 years old is still a long
time, even if it's not an OS that's over 16 years old.

I must admit, however, that I am a bit sad about this. After coding up
[1] this dialog box for the installer, I felt a few pangs of sadness
when testing it for the first time on Windows 7 and seeing the tragic
result: https://data.zx2c4.com/bye-bye-wg-win7.png . But it was a
familiar feeling. For, long ago, I'd already watched the beauty of
Windows fall to pieces. To me, Windows 2000 is the most beautiful of
Windows operating systems. Yes, we can all ogle at the engineering
marvel that was NT 3.51. But Windows 2000 really elevated that whole
vision to perfection, and was also the pinnacle of the classic UI
design. I can't think of a classier OS released since. Though, I must
say, it was Windows XP that captured my heart and formed the basis of
my childhood, the new style and all; I would switch between classic
theme and the XP theme frequently, and later flirted a bit with the
MCE themes. It was just a very nice OS, had everything one could want,
a great suite of software, really good stability, ever widening
hardware support, sane and consistent interfaces. It came
pre-installed on my Dell Inspiron 8100 and I loved it. At some point I
switched to running Linux on my laptop, but would still sneak down to
the family computer to fiddle around with Windows development on our
XP machine. I could go on and on. Then Vista was released, and it was
annoying and introduced inconsistencies, which Windows 7 tried to
smooth out and succeeded to some degree, but it was just never the
same to me. And we all remember what happened next with 8, 8.1, 10,
and 11.

So, it's sad to make this change, but it's far less sad than what
already happened in the Windows world post 2000 and post XP.

On the plus side, this has enabled a lot of significant cleanups
throughout the code, and will be yielding more and more as this
process continues. Windows programming is as fun as ever -- arguably
more fun, as the archaeological dumpster heap of historic Microsoft
APIs, each one filled with a unique history and competing corporate
and technical vision of operating system futurism, only ever gets
deeper to dive in. So I'm relatively happy to make this change, even
if somewhat wistful about it.

I had first asked the mailing list whether this was acceptable in 2020
and then again in 2021. Fast forward 5 years and the ecosystem has
changed a lot, and our upstream dependencies have similarly dropped
support. I realize this leaves the still-technically-supported Server
2012 and 2012R2 out in the cold, but 8 and 8.1 haven't been supported
in two years, and I think most realistic users have similarly dropped
the corresponding server editions. In other words, I don't anticipate
any real fallout. However, I know that Windows 7 and Server 2008 and
2008R2 users are usually pretty committed to their ways and can be
vocal. So, by all means pipe up to sing an elegy if you'd like. But
we're moving forward with the sunsetting.

I hope this all seems reasonable enough. Let's pour one out for
Blackcomb/Vienna, and while we're at it, for Whistler long before
that.

Jason

[1] https://git.zx2c4.com/wireguard-windows/tree/installer/customactions.c#=
n101
