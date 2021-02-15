Return-Path: <SRS0=kgOq=HR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B90CC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Feb 2021 18:05:35 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA58364DEB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Feb 2021 18:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA58364DEB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bfbf44c1;
	Mon, 15 Feb 2021 18:04:47 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fa1f642d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Feb 2021 18:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1613412282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qAD06t3G8DmjEkORZS0VKX3QgdQ6sFK9wXdYLjrdZ2c=;
 b=f3NSZOoa3KvoDk4tK5cgr/5x0LLAGKgFR+wger2wpYbTs/5Wvt1u2wOKPMnhc4N9ur5+7d
 fJNrewHnMOo+GZNPzai+vBrYpAG5MH3hVI0D3XdkRPVRVzGMUMJoEJbqjHfGr60CBY9zIM
 G83gR2btYQcFFfXrH4F2vYNaIKeBruc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 68336782
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Feb 2021 18:04:42 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id c131so3178127ybf.7
 for <wireguard@lists.zx2c4.com>; Mon, 15 Feb 2021 10:04:42 -0800 (PST)
X-Gm-Message-State: AOAM530dIF5GJTubF+D5FKeea7wkMuERY/KatWl8Rwvy9BS2PDl7haTd
 LJzdpzA7JEMR8W6xVHqU0m/zTT0ho5UBZ7XdXTM=
X-Google-Smtp-Source: ABdhPJxy4WT6n2JsXkdRNF0Bu7T9ZbAbm/Nt6NodYeeR8SWCrTpf5NAqlak0lkXfVRP8TG5Ebcx2rJ9FHXa0Pptu0uY=
X-Received: by 2002:a25:7693:: with SMTP id r141mr23422483ybc.49.1613412281820; 
 Mon, 15 Feb 2021 10:04:41 -0800 (PST)
MIME-Version: 1.0
References: <b17cf1b329499660a7f242671b8f8114@mail.gmail.com>
In-Reply-To: <b17cf1b329499660a7f242671b8f8114@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 15 Feb 2021 19:04:31 +0100
X-Gmail-Original-Message-ID: <CAHmME9qRbAhk3ms6azd3D2GxE347okmBoDyH3Z-QAUVfiUqsdQ@mail.gmail.com>
Message-ID: <CAHmME9qRbAhk3ms6azd3D2GxE347okmBoDyH3Z-QAUVfiUqsdQ@mail.gmail.com>
Subject: Re: Wintun changelog?
To: clint@openziti.org
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

Changes are available in the git repo:

https://git.zx2c4.com/wintun/log/

Regarding DHCP -- Wintun is Layer 3, so DHCP doesn't go over it. I'm
not sure what the user in question is up to but it's hard to narrow
this down without extensive information.
