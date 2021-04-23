Return-Path: <SRS0=RWyD=JU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D706C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 Apr 2021 20:37:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97D906141C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 Apr 2021 20:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97D906141C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71beabac;
	Fri, 23 Apr 2021 20:33:48 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fe9c5e3b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Apr 2021 20:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1619210024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZsxagrRXUeRwomGPKHkvyxpyXzCdyasXayy9pMyl2/k=;
 b=FSUD2ClVQmrR/nW9lXC6I708UT/DIm1JLDKafIRCEgr9T/UXbO1Tjn6+3vdeaFdwlMWY7X
 kzGyNsV6iETwcXShEqO7nhwZpruEG9busa01qOOwPBuURP5wPAjp5jWa8R9GrA/TXsB5F/
 WYFjZ5WmHIcUTeZ1HBXNSb9drjnOwU8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e0521b24
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Apr 2021 20:33:44 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id g38so57058557ybi.12
 for <wireguard@lists.zx2c4.com>; Fri, 23 Apr 2021 13:33:44 -0700 (PDT)
X-Gm-Message-State: AOAM533n/4J/CeKCJsZv5zPg5v7JngHLB+Gt/RrZqzqo+ykgW8JYskth
 Kyi4pewB93GNvIlx3MsXc0v6AZbCM3Vw8EP3vzA=
X-Google-Smtp-Source: ABdhPJxDVTe6tXZFvF2BFEsWtUL676m7HRZ0nWPC+4ZTRwZsZcDianuSd1MwcepElbaFusxBzAb6gT/4ul/ClPYnpgU=
X-Received: by 2002:a5b:5c6:: with SMTP id w6mr7903267ybp.279.1619210024239;
 Fri, 23 Apr 2021 13:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210423171938.583964-1-cascardo@canonical.com>
 <20210423171938.583964-2-cascardo@canonical.com>
In-Reply-To: <20210423171938.583964-2-cascardo@canonical.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 23 Apr 2021 14:33:33 -0600
X-Gmail-Original-Message-ID: <CAHmME9o8GG9mxgBEGYOF9QjYqri2LRFA4tMG0V3ZAxXf_v3ekA@mail.gmail.com>
Message-ID: <CAHmME9o8GG9mxgBEGYOF9QjYqri2LRFA4tMG0V3ZAxXf_v3ekA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Revert "compat: skb_mark_not_on_list will be
 backported to Ubuntu 18.04"
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
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

Thanks. Applied as:
https://git.zx2c4.com/wireguard-linux-compat/commit/?id=1edffe201ad08d70fe74290b657a929cd4229df5
