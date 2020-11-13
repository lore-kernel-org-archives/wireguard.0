Return-Path: <SRS0=pWoz=ET=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC21C388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Nov 2020 15:51:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E81FA208D5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Nov 2020 15:51:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ZMkWy0uF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E81FA208D5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46348b1a;
	Fri, 13 Nov 2020 15:47:05 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 10e2692c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Nov 2020 15:47:02 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7bb3999
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Nov 2020 15:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=NLUG3siYExpOR/QNLYNYw1++2JM=; b=ZMkWy0
 uFbXf6k7RPRrF/VMcRvYvhIiXy4Hklp+XBtlDfijqWCgXoLjAKTFnix2Zz32GK/t
 zvOtaKNZ6q7IqtOGIhJ/wjJF+0sEwczPrM7uUYdsckYoDpc6VRov9cH126kw44DA
 +IOQg24tLIOK92F4rKhCMr1T38TUzbVbi1KV4sM/ttIWzqMPKaaNUrTL7c8Bji2D
 aMEIIucPaYS80jwaqBc9CvaDjlN96BGh06M3AZPLYq8HUaC4ihFii6cx4himlemU
 AyMu/4K4tI/U/rGmgz8f97vGAPi/pjhWsWCJhbIfO7/27xEOgjAMXNsYlkHRbqZT
 Bs+ZMwsorKt3nANQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3cefb8a7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Nov 2020 15:47:48 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id 2so9071105ybc.12
 for <wireguard@lists.zx2c4.com>; Fri, 13 Nov 2020 07:51:08 -0800 (PST)
X-Gm-Message-State: AOAM532c2HsJxwAm7ZgTJeOiNcmdnpwY5los4AxUhQeUTGoh6UgetkAB
 /yJWpKM5So08P2rmk36DFI3cny4nDfJTg5kfgRk=
X-Google-Smtp-Source: ABdhPJzAMftPHD2fnzVVf+/JOqr6jejPZ9cymCX1GZJlrkeFNAmAAM59AkNNse4gqBbEuq1qp4IqRUtJLC5o2eDfnHw=
X-Received: by 2002:a25:d047:: with SMTP id h68mr3351736ybg.49.1605282663353; 
 Fri, 13 Nov 2020 07:51:03 -0800 (PST)
MIME-Version: 1.0
References: <6bfa482b-42ee-ebc3-f2cb-4f52d9d2e219@molgaard.org>
In-Reply-To: <6bfa482b-42ee-ebc3-f2cb-4f52d9d2e219@molgaard.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 13 Nov 2020 16:50:52 +0100
X-Gmail-Original-Message-ID: <CAHmME9qVUvad__o+MWvx9y_JPfqpOhyK_ttwKvB+hoLMiACCCw@mail.gmail.com>
Message-ID: <CAHmME9qVUvad__o+MWvx9y_JPfqpOhyK_ttwKvB+hoLMiACCCw@mail.gmail.com>
Subject: Re: Hooks in clients?
To: =?UTF-8?Q?Sune_M=C3=B8lgaard?= <sune@molgaard.org>
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

wg-quick-based clients have this, but the UI clients do not.

However, for your use case, port knocking, I'd recommend getting rid
of the port knocking. WireGuard is silent to unauthenticated packets,
which means you don't need to port knock it. It was specifically made
as a port knocking replacement.
