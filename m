Return-Path: <SRS0=iDgY=II=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D403C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Mar 2021 00:53:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B626650AD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Mar 2021 00:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B626650AD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 443c1feb;
	Wed, 10 Mar 2021 00:53:33 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3c2b444d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Mar 2021 00:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615337609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XPUNBE4h0n/Isof6XC6RNbrybJsukbqh68fbmNgNvEU=;
 b=ADcdA6PK6XvJKaPLv9ujf6hvvK40R8L+MwUYJfFWqPjLJhULFSjvvMNU9yywC5st0q7281
 sijVy1EnW4QsV6zhaEqDEOmO4qGrLHJdmp8vE0FLCbHcYGjoBV8MbYLzjafBuuQArGRhTX
 9gOPGJEQYqOGgAhsP6dfFUQ6E0XSolE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f4b3d38f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Mar 2021 00:53:28 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id l8so15949817ybe.12
 for <wireguard@lists.zx2c4.com>; Tue, 09 Mar 2021 16:53:28 -0800 (PST)
X-Gm-Message-State: AOAM53002SyOoop+5jX0+irfyQly+pd0GBi8iFdwj1bTnxd0E3kAx0Ta
 V9yPFbwxmuOsByMTOJ2mpCFHPD9f3bX2SXK+g3o=
X-Google-Smtp-Source: ABdhPJzEFegGyCBwMzuQu1fAnl716HIOjY98AXeOXc8v8WHf49rmF6ebILxXFkj28lII0aXc5q51PjQaj+cuAH6NfW0=
X-Received: by 2002:a25:1442:: with SMTP id 63mr704445ybu.123.1615337608496;
 Tue, 09 Mar 2021 16:53:28 -0800 (PST)
MIME-Version: 1.0
References: <CAKVinOUJVEyxfT-bOhUe4gZb7yUN_=xwun13pnt+iDZus=LRXQ@mail.gmail.com>
 <CAHmME9pC=y2_d_z6iyB2ci0O2gKw7WyXnkTxj7AAfwbWLcA7zg@mail.gmail.com>
 <CAKVinOWSAKSmJZAnx5FazKQqXWnwQkt-AxBH3pR6JrL3SYvi+Q@mail.gmail.com>
In-Reply-To: <CAKVinOWSAKSmJZAnx5FazKQqXWnwQkt-AxBH3pR6JrL3SYvi+Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 9 Mar 2021 17:53:17 -0700
X-Gmail-Original-Message-ID: <CAHmME9rqXMAo8ptzAuL0SL6oVuZk_MGiU969sd0QVYAiN+pAPA@mail.gmail.com>
Message-ID: <CAHmME9rqXMAo8ptzAuL0SL6oVuZk_MGiU969sd0QVYAiN+pAPA@mail.gmail.com>
Subject: Re: Any possibility to run wireguard-go with android vpnservice?
To: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
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

> So in my case, command line wireguard accessibility is in first priority.

The library I sent you does actually set up a listening socket that
wg(8) can talk to. You should be able to control it from the command
line.
