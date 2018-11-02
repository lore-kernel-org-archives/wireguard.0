Return-Path: <SRS0=Sa1Q=NN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F219EC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 07:39:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E332081F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 07:39:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LP2h/lnL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72E332081F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c0028ba;
	Fri, 2 Nov 2018 07:35:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bc39028
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 07:35:52 +0000 (UTC)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c115972e
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 07:35:51 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id q5so896262otl.13
 for <wireguard@lists.zx2c4.com>; Fri, 02 Nov 2018 00:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YugI+TgyFNK5VNz4JoZQOybJmds38dbdNw7wmgbotVU=;
 b=LP2h/lnLx5XAEtQ4yLvhDRmrOF6jnTgCj8c7kDleHY7C91DqgO0h99xQtybrV6Uogu
 AwE7Z8FaCez0PyGTlpMAYmzZCET1WKVScpiiQ32dUNgPs9zinkq9wCnGEDXcd1ZSFmRB
 7v+amhNYFXttHBo4qDy1y1YkBGE4nwFDOYxfybyqk1vTDOASFRkWFDjkObPr7Z2YBfxs
 fnCOEr7sPns0IIs+oY8vMU5fq5JB5Bnwce1LTtiBrUFosPHl0IMJP6HasWp5QB/oHIOZ
 nlJHIowPRszYTq786eUpLdrjHVk18HuuGpDuRVepXBf6F9GdUsMo4dqRwOnQkRm+aip2
 XksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YugI+TgyFNK5VNz4JoZQOybJmds38dbdNw7wmgbotVU=;
 b=pCj+iEGzEXLMrXOpWWik3ldojvGUs7pbgEqktf+k5DlnbZwj3XEeS7Tk0Xu35XJ/4K
 BLgvRlVtgRealdJeKNwvQ0nbH75w3xu6JgI5R/4J+6qGw3G7ZUIbhJWXMXKbvleah8b3
 CU0sRZeKyB8RgB7n9d5zPvblk3LDQktm3jGC0cjnFuVV2zxvHF6rx+AMlfUYQpKs3fQM
 XbasRxkFFiH22FaOJxOqi0s8vWMBRJTrplnmiQHrx9EA4sqmwQDNCQUuPnvkhNhvlGi9
 AYN8ddHg82X5Xm0Px42K6psEBlL8G3wiJz6EtSsyMjw2xtbCD5N4e/3OjlX47nnlFf6c
 /LOw==
X-Gm-Message-State: AGRZ1gJmJUWZL77hRQZQNPRQH2RP56A2v/myW8xYbp0CDVv5YgMvr8Xg
 8SqmktrcOcGVb5dlWfOVZwBQVB4R141BUhEMv+G+25Vt
X-Google-Smtp-Source: AJdET5cjjjIWuH2+UCq05gnMRi06N5S0hbKdM6aXge6Eu45cHgAAkeEt0jCKlTofBI5zJfR6MhHpN+TC3EVSxctJzaw=
X-Received: by 2002:a9d:3cae:: with SMTP id z43mr6619437otc.159.1541144380586; 
 Fri, 02 Nov 2018 00:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <CANcuY=qyERAxMcREiBJutdYbGX-tJPMhUdmxN_=TwQHiamiaNw@mail.gmail.com>
In-Reply-To: <CANcuY=qyERAxMcREiBJutdYbGX-tJPMhUdmxN_=TwQHiamiaNw@mail.gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Fri, 2 Nov 2018 08:39:28 +0100
Message-ID: <CAKXLc7ctgDjAKSyB-DaET8spbgnF9hpf4uBKbRwZY_jVb4YZvg@mail.gmail.com>
Subject: Re: F Droid build 0.0.20181031 broken
To: laszlo.kertesz@gmail.com
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

On Fri, Nov 2, 2018 at 8:26 AM Laszlo KERTESZ <laszlo.kertesz@gmail.com> wrote:
> The current FDroid build (version 0.0.20181031) is broken. The Gui starts but it states "Unknown userspace Go version" and the tunnel activation action results in an error.
>
Hmm... just installed (1st time) and started it, seems fine (haven't
configured it yet).
What is your configuration?

Here: stock (no root) Android-8.1.0 (3.18.71-perf-gd0e0d1a kernel) on
XT1905 phone.

Kalin.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
