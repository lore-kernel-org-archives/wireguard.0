Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40ECFC04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 16:37:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C915020838
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 16:37:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ArVEBrc3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C915020838
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 262bd1c3;
	Thu, 6 Dec 2018 16:29:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d085df09
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 16:29:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e453149
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 16:29:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e998af0b
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 16:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=dO2YcSZ1SG5uRN/cMe6cDCa5XUA=; b=ArVEBr
 c3524AmaDSelvoEpQ2KVm1MzMlAV152cByxKRbd9Pdod8DN+WiZUKIhANgFI2Ox9
 8A2/N9Gk8RqVbx6HZ3EvrCeuXhOBxQIAVf1lT9bqUmbOYDi6R1gA3u9y1JagCwWs
 7gb97VBln8eVmpXoSw1i3dLY0ObUzyH1LtJifEjtcWfS05zI2g0X9q1F6BSkVd6z
 jooAA/FY94TS8UKTn3XnkW9rsFT3JLRVofMDdHXCPqWvR5l5z3XJHONP1Vj+qZxj
 VbrEalgzSBg8qZCRe28ZafmV1GbHLcE77Aw6bEJtuLiMbl5JuOi89/OyF4VXiAaK
 5QSpoPOd0FiuPq1g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9dc931cd
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 16:29:10 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id w25so945751otm.13
 for <wireguard@lists.zx2c4.com>; Thu, 06 Dec 2018 08:37:21 -0800 (PST)
X-Gm-Message-State: AA+aEWYHIpALn4kjHVZPxF+AKbmhN0Wx4Ej6gOj0YT/iKTlRPPaiFLhO
 TjKMsP61yf1dQbgJMWF/jVqHvEu33EjnJUNz7kg=
X-Google-Smtp-Source: AFSGD/X2MWGY/VCCunwFI+ch9nNltW2pRNS99KXhdu5rns8Nv9Ca3CvcW45TVhBuGm9d0zZ6GHn3b7SE5Vj2pUh+wyQ=
X-Received: by 2002:a9d:12e3:: with SMTP id g90mr19599572otg.223.1544114240994; 
 Thu, 06 Dec 2018 08:37:20 -0800 (PST)
MIME-Version: 1.0
References: <CAMhRzNT3Ss4P4h4AFxiZLKcmEG59=sXYFDdFgmnpF9MMWOA0vQ@mail.gmail.com>
 <CAHmME9p7dkgEroU0orBkv9gTVw046TySyhgbrwhpDy9_CJuMJg@mail.gmail.com>
 <CAHmME9pyCqLvTOBHCFYttJJzYGSyf26Way1FmhUtr0NvB8jU6Q@mail.gmail.com>
 <CAMhRzNQ6QwgGT4_LTrVrZ-8LL8bO=T5roFzLRdyGWwVHChvf2w@mail.gmail.com>
In-Reply-To: <CAMhRzNQ6QwgGT4_LTrVrZ-8LL8bO=T5roFzLRdyGWwVHChvf2w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Dec 2018 17:37:09 +0100
X-Gmail-Original-Message-ID: <CAHmME9oWo6dhFgw9eu6Cc0r_wp1v1-Le2b+H9asUP-UXDO=seA@mail.gmail.com>
Message-ID: <CAHmME9oWo6dhFgw9eu6Cc0r_wp1v1-Le2b+H9asUP-UXDO=seA@mail.gmail.com>
Subject: Re: wireguard-go foreground mode broken on Linux
To: cbranch@cloudflare.com, WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Thu, Dec 6, 2018 at 5:31 PM Chris Branch <cbranch@cloudflare.com> wrote:
> Your solution is the same one I tried, but I wasn't yet convinced it was the right one. I'll take it though!

Did you run into issues with it? Or had particular doubts I should consider?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
