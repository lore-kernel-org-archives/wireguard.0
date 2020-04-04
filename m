Return-Path: <SRS0=CDXv=5U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E226AC2BA15
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 23:00:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B393206F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 23:00:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="u+TobDQY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B393206F5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4e7d632;
	Sat, 4 Apr 2020 22:50:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8533c17d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 4 Apr 2020 22:50:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 033de5e6
 for <wireguard@lists.zx2c4.com>; Sat, 4 Apr 2020 22:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ebbfc8AgCn+4H6p6dK9MTQnUnPI=; b=u+TobD
 QYvc8dENKA93O2AJMCe2YYif2qpLsTIb6N5uYwk19mujpGsBRm5LdgeIQzErxlkm
 Os4zcptC8mON5UWpLCvnUPGW5nlxtcQqQPxgQaet96lPetbVaabCjZ71FK0SkQmk
 T3YxfF4OWNTgwCMyaJtAa173Zr4nUZnPi/ZxMu/l08y07GglylM50/zDvq1YWQVx
 TIS0L/S4QtAHaRY7xiQMP999E/Y8hwzfghbbyZ/pn18zxGX9EKgzvyyV+MVRnIfb
 wyH0j233h8RGual99enexrQKp0dh/sj6QvN2JJO0WrNtSOzVJKMHOi6H+xxBqNJZ
 peQcOWz2igxZh+NQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9274a445
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 4 Apr 2020 22:50:51 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id y14so11690331iol.12
 for <wireguard@lists.zx2c4.com>; Sat, 04 Apr 2020 15:59:26 -0700 (PDT)
X-Gm-Message-State: AGi0PuYP2hthYtPW/3O3lusIwrijMUGxAtPz90ArYGjaXTHGtC5KJ+vA
 B9CDYtWos1O86JcGZW0BoYvu1DdXfRheV15ZEic=
X-Google-Smtp-Source: APiQypKvOLqL4uE7NWAaF6PJgNGvnS0GyqwjKmGqSt+n0jsu+Knnm02vlFxoA3YJPHjUSWu77T0PtTETKPJArN1OvJs=
X-Received: by 2002:a05:6602:2e8e:: with SMTP id
 m14mr7266356iow.25.1586041166020; 
 Sat, 04 Apr 2020 15:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <16959081-aaec-9187-8893-8b627054ec2a@dtms.de>
In-Reply-To: <16959081-aaec-9187-8893-8b627054ec2a@dtms.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 4 Apr 2020 16:59:15 -0600
X-Gmail-Original-Message-ID: <CAHmME9rkTZPVGmvOCcemNJwvn-J3+-gdXDVigSm-TOp8vQNsog@mail.gmail.com>
Message-ID: <CAHmME9rkTZPVGmvOCcemNJwvn-J3+-gdXDVigSm-TOp8vQNsog@mail.gmail.com>
Subject: Re: SIP/SDP Issue
To: Roman Chumakov <roman.chumakov@dtms.de>
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

"It doesn't work with some unspecified software" means that we can't
and won't do anything, since how could we?

- What is the name of the software? Is it open source? Is it free?
Have you reverse engineered any of it?
- What debugging have you done already to conclude it has to do with
the ip address being recognized?
- What debugging have you done already to conclude it has to do with
the sdp proto?

This is a technical mailing list; we need technical details to fix things.
