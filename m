Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3571EC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 12:12:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DEB621E92
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 12:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DEB621E92
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4d0d9cd;
	Mon, 4 Jan 2021 12:00:58 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 45619972
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 12:00:56 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59d3863f
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 12:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=kTBaAM2wthb+FRUboiky+W08vRU=; b=uZEjux
 oSvFMfT+m0IoWfBUl13L9GZSbblNIyfJbgIjiXKIB87gXE3yyf2Lns8gVCuIKWUV
 QOm0VAarmvHjnM5zgzHeKdv33a43lgbLofcbKAKnGZ4yLg78Tst1yoT6GfzV8eJC
 YVH+qTF+DHhti9AeZ3Y5DjunA8VpxtaW2AX/eaX97xJDmJMJ5wlv3JIQbZpZJOzx
 f1/7yydHF7Uh2Of49gUk8VvolRnowVn8n2fwb0JqgRNKVRDCRQ5uYL3o8hSfRiHk
 93zbyzckEL9TttKPQ2wSwYGk+gfvITZsiKRBNZm8OwFkQIhcWteNnP2SnYPKl8Vf
 d6h9RyezARceBaXA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9e3b4bb6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 12:01:42 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id v67so25812892ybi.1
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jan 2021 04:11:47 -0800 (PST)
X-Gm-Message-State: AOAM533VHtBZ4ZMwdtsICARAzoQfjAit79Nez+JabPnQKQxNRHQGIgl/
 IprHuMwyB5yPsQTLczIBR2ADczT249Uyj5KPPK0=
X-Google-Smtp-Source: ABdhPJwJcAe8LmatpMbIpO4lNK0NxXB4uVxLXeyEW39+XCERIFxQ8MCi3UczgCKdymk5hMSqDGsDL0+bFpaB8IJg0Gk=
X-Received: by 2002:a25:880a:: with SMTP id c10mr47890159ybl.456.1609762306999; 
 Mon, 04 Jan 2021 04:11:46 -0800 (PST)
MIME-Version: 1.0
References: <C89F9RDE1IDH.3GNEXRZ4X6IA9@enhorning>
In-Reply-To: <C89F9RDE1IDH.3GNEXRZ4X6IA9@enhorning>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 4 Jan 2021 13:11:36 +0100
X-Gmail-Original-Message-ID: <CAHmME9p5TtnmDB2=L4auOrUs8R8pjUG+oPKxn9jWs9LAP85efQ@mail.gmail.com>
Message-ID: <CAHmME9p5TtnmDB2=L4auOrUs8R8pjUG+oPKxn9jWs9LAP85efQ@mail.gmail.com>
Subject: Re: Windows manager error
To: Riccardo Paolo Bestetti <pbl@bestov.io>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Simon Rozman <simon@rozman.si>
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

Hi Riccardo,

Thanks for the report. https://github.com/lxn/walk/pull/749 should fix
it, and will be part of the next version.

Jason
