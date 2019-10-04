Return-Path: <SRS0=ZOV3=X5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1C4C4360C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  4 Oct 2019 12:52:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 419EF2070B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  4 Oct 2019 12:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCmPpw/A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 419EF2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 064233ab;
	Fri, 4 Oct 2019 12:52:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 288bfb29
 for <wireguard@lists.zx2c4.com>; Fri, 4 Oct 2019 12:52:37 +0000 (UTC)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9a8880f
 for <wireguard@lists.zx2c4.com>; Fri, 4 Oct 2019 12:52:37 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id l3so8382855qtr.4
 for <wireguard@lists.zx2c4.com>; Fri, 04 Oct 2019 05:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MtCUK+ZHxgV8HE/TIL5vbnHjgx+FJSt2PF0+oqd1npE=;
 b=MCmPpw/Am4GQAmRksFZW6urCykNd2+cIBhYuQzpLDSh+GK4aYTofYDpz6NUdJ9DbNz
 wUCm51zD33Spix2KuCtqORc183zQJhFkg+yGg6PiavD08S8JmVMg4/KUvobSoN7Vm8CJ
 tlitW/EeGrwyRpTeQb7njX3kd3qhW87WPVT3pRpp4jY/t6qoSSqLNqN+rmxaKl87e5bG
 f++x0KFuRfJe++X58DFpFlJz8rQtAxQFl6A3CUhOxzrN1wuqqtVPCEzrvl/4aHJE6QV5
 1GhrRKcOVSA7v9E9D3AnDves6p/B690FiAK2OvUgfuSR/SSgYhnUFRQOPpaoSbIBck50
 ayeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MtCUK+ZHxgV8HE/TIL5vbnHjgx+FJSt2PF0+oqd1npE=;
 b=Q9FRH4S4vMJxHDFHw2yH9MObKta+OlI5f8Q6O8dN3wUcY/AGs8vOn9dnHeDsrD7IGY
 fWiZLiUR7Lq0nWeGn1DjDoMYMgCzjpePKGSp6dtIs+6ZgTvy+0J0QZ+EnZaLM3Rnh936
 3UcN7EWolL77X4btnoWIZKuiTEVDZXaQldmV0eHdy7fZVIrZTy+/sSEl+kVs9inbI+i4
 q3BNyCc2/mJbvpubx8TQ46XUWUDMLZFKeEui3WqF8kUQG72BDgGndK8mVbcFHIT2n8M9
 AV3gZ3Hrc3lo3rr4dzgPtsaBReLIuqLJ1IEaOWYIOeX7s7hM8kO8pOJp68qlIxZluSlD
 uJcA==
X-Gm-Message-State: APjAAAWt01vNNAYC3upb3ygH6iBa0RVtdo/Cc00luUy2BdlCR1Ze723i
 1luUM/8/LThn/FFJwcrAYbqGQn9qP9Jars4m35E=
X-Google-Smtp-Source: APXvYqzjudR98nQgTPZefTxzGR0qVBvA6ZqeuhyJsCyp1h14Lvb9SKAvna/p/TefkYWF7KNTB+9D7lAIPPFGXhmLxQw=
X-Received: by 2002:ac8:1935:: with SMTP id t50mr14946416qtj.214.1570193556266; 
 Fri, 04 Oct 2019 05:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <CA+kUo267JEndBxav--GABQ3o02ZXMOVmktB1ZW2R6Tzx-X0v-Q@mail.gmail.com>
In-Reply-To: <CA+kUo267JEndBxav--GABQ3o02ZXMOVmktB1ZW2R6Tzx-X0v-Q@mail.gmail.com>
From: Simone Rossetto <simros85@gmail.com>
Date: Fri, 4 Oct 2019 14:52:25 +0200
Message-ID: <CAEBQdhi6DrBPxT6RC6evvw8982GKcX9oKQO=2mN0OEoFp3GaeA@mail.gmail.com>
Subject: Re: Strange firewall dnat rule to make WireGuard work on
 dual-interface
To: James <james.b.price@gmail.com>
Cc: wireguard@lists.zx2c4.com
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

Hi James

Il giorno mer 25 set 2019 alle ore 10:51 James
<james.b.price@gmail.com> ha scritto:
> By design or lack of features, it ignores what the interface and IP the incoming packet was received on.

Yes, it seams that.

> I'm trying to do something similar to you but even with your IPtables I can't get mine to work. I have a more complicated setup and I can't seem to get the outbound packets to follow a routing table using a mark.

Maybe I can help you... tell me which is your configuration and what
you need to accomplish.


Bye
Simone
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
