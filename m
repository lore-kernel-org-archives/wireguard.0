Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433D6C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:30:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1B8A2068E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:30:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="qnPyMcEe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1B8A2068E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3550afb5;
	Wed, 27 Nov 2019 12:29:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb1c94be
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:29:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a23624b9
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:29:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1af6623
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=lI+eGgNAH6DPzDCJik0JPn0xo74=; b=qnPyMc
 EejrXozmI1upf4SN4H0mMnyJMU8eJtahqkUAvegAeSiJZG8NwjxFUrKCW8bqCr+L
 NBOv3G0xQ2yJsW60cZmbL5wGO0jAM0Au13BG2tYNgmVxAvgIYfXjgSr0Z8C6+OMt
 xaRdP2OV4G09iRKuTuFiF0uBh0PZlB/XPFixI/K4nyyxJ5O9wGjpL5rN3QOnc4l2
 WR0F5/apmCJzHqBJEUt5xOhTeUHLmtzrbdxwOQKe4flSqXP0cz6U/fqHz+DaAwiJ
 hCIiIM0H5Okgfe+Yd/i4qbINQosJsNtjN0ZCmae8yZkDrONawoA6az8A3MYn5Y09
 oMSeWi2QlFxjNx3g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5f0bdc4f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:35:26 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id d22so19910360oic.7
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 04:29:17 -0800 (PST)
X-Gm-Message-State: APjAAAUpGmptAUwOe7eZRnNl7Pgx1zL9+/fxsJEuHhU67QMI0J9Gk0o+
 RA47nh0fk9hexMlar/0353A9nIeHHgZvmJAckHc=
X-Google-Smtp-Source: APXvYqxcG+40ykjLur9ptz6kwwRd80fI6JrgGbympKcKlAyTpdk7N1ZxiSpfYnRP9fvnORltXhN9zJOXs0kaoKChlQc=
X-Received: by 2002:a05:6808:687:: with SMTP id
 k7mr4035389oig.115.1574857756992; 
 Wed, 27 Nov 2019 04:29:16 -0800 (PST)
MIME-Version: 1.0
References: <CABPTpJBGQcze6b3_tJij8Ysp8zwb_4fyQAEv_fy4Bx9YpVcpRw@mail.gmail.com>
In-Reply-To: <CABPTpJBGQcze6b3_tJij8Ysp8zwb_4fyQAEv_fy4Bx9YpVcpRw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Nov 2019 13:29:06 +0100
X-Gmail-Original-Message-ID: <CAHmME9rjiN_q7yhFtaUybaX+x60qeVJ8+oFTdWtr65yb6CMzqQ@mail.gmail.com>
Message-ID: <CAHmME9rjiN_q7yhFtaUybaX+x60qeVJ8+oFTdWtr65yb6CMzqQ@mail.gmail.com>
Subject: Re: Wireguard for Windows - local administrator necessary?
To: Chris Bennett <chris@ceegeebee.com>
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

On Wed, Nov 27, 2019 at 10:07 AM Chris Bennett <chris@ceegeebee.com> wrote:
> However I've found the logged in user needs local Administrator access to activate and de-activate a tunnel.  Is there any way around this?  Is it in the roadmap to remove this requirement?

No intention of reducing the security of the system, no. WireGuard
requires administrator access because redirecting an entire machine's
network traffic is certainly an administrator's task.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
