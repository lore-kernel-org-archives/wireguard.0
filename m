Return-Path: <SRS0=UpYJ=F3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5A7C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Dec 2020 22:03:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B93AB223DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Dec 2020 22:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B93AB223DB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 144e5b59;
	Wed, 23 Dec 2020 21:53:18 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 57bb2b33
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Dec 2020 21:53:16 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8561c4ec
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Dec 2020 21:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=iNQZVIz0hQZI8EDBkzH81mbHvj0=; b=J8J43D
 0xphW7kAmzUQGL0p6kjozImmEJS7LrlFMUVHAFNMV9QeLo09ue0sMBRpioj5j0tT
 Ll5hXxUR1l+zIFk8IsMvaO9QQqakqLVQ5TivjcgcVeE3xsUrP+j1GpxIzd3GeIkb
 Utvg/U7SPOdbXZ0oEtSB+fhhWJh1QzX13KHSI7oz+51Du3AkqWruSQA2mIw6I6nU
 IxvX00KCxv4jWJp/MLnXXrK3c22KqY1cyZ4mGNV5SR9TK2iC7g+yrk//uPTeT56j
 Ryd3nrFYnmlg8pogEMd/xn2J0SLGWkMAg8LdR9YS4OsNsoT9XPw/xzVwp5BH1NXx
 tSxFSDqGcLcNZoHQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 49252c36
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Dec 2020 21:54:02 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id u203so791733ybb.2
 for <wireguard@lists.zx2c4.com>; Wed, 23 Dec 2020 14:02:37 -0800 (PST)
X-Gm-Message-State: AOAM5332tFnye0MOLh2MPZU19lQLTR0nm8W7dZisbjmmTCOH49Xtqc/V
 TS5MeF5/PEH3qNapxb+8EaQKe3MPsdEu6RBFVxk=
X-Google-Smtp-Source: ABdhPJzpEllRXO9/ohanmB0RAnmQ+W3798KECOZ7P9xG9FKGNjcPE6/a6cIL0PynnZKrKnPqkziJMN+LETCJwEWOPXA=
X-Received: by 2002:a25:4744:: with SMTP id u65mr41218422yba.239.1608760956761; 
 Wed, 23 Dec 2020 14:02:36 -0800 (PST)
MIME-Version: 1.0
References: <CADnbd5jx0PtvG3Vuw8MMnfuXmO184+1J_UAWgud7A7wvfwnnHQ@mail.gmail.com>
In-Reply-To: <CADnbd5jx0PtvG3Vuw8MMnfuXmO184+1J_UAWgud7A7wvfwnnHQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 23 Dec 2020 23:02:25 +0100
X-Gmail-Original-Message-ID: <CAHmME9p1qhvrhty-JYTA6RbO9NnS7MaJq22d1auodhAGa7Wxww@mail.gmail.com>
Message-ID: <CAHmME9p1qhvrhty-JYTA6RbO9NnS7MaJq22d1auodhAGa7Wxww@mail.gmail.com>
Subject: Re: Mac AppStore vs real version string mismatch
To: Luke Hamburg <luke.hamburg@gmail.com>
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

An update on this: we're now matching git tags with app store versions.
