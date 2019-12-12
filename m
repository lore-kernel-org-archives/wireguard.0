Return-Path: <SRS0=NvnE=2C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF95C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 13:19:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1843021655
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 13:19:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="V5EQ9/y4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1843021655
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b707b6d4;
	Thu, 12 Dec 2019 13:18:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc466a2d
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 13:18:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 558aca2a
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 13:18:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86bde3f3
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 12:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=+U3Pqe7m4fLf4oKCLbxn6mJHU/Q=; b=V5EQ9/
 y4Hz87Ew5GVtjaBpsBSFal+TUrIQlBMDR0iahQVA/6yhmcwkoqmpJe+X5uoF9qal
 ilXq1xtHIWHXPyjl5gERAkWPFJtc14LP00/jqFVSB+iT+SUeOL9KGSuzg80VkR6d
 E4cxE4I79lwZq44tBpbbC7LfSV+p4QcjT+0nkXU816a7lkC3NLQeJ79cxhDBrKAs
 /N/1WW61zF/eOSO1PU1CidslKI9dwIDG2o9Ia23j+Ii77mookE1xx00s2kU2O8ou
 SFOEO2C/OXWViYqUImbt+lYqjkjmToVLIG1/RU+X+nST+zgaXD54kIrcSfhSX25s
 nlLKAZ0hnj4aSYBA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6e3934ae
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 12:23:04 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id 59so1908016otp.12
 for <wireguard@lists.zx2c4.com>; Thu, 12 Dec 2019 05:18:51 -0800 (PST)
X-Gm-Message-State: APjAAAV1Vxpc72/8K1MEpwjIHWKXXwGlCePmae/xBjM8yUJX/euRvctf
 aRtEB3V5dQ49sJyZbuGhVmusKNpf58U5+WykQVA=
X-Google-Smtp-Source: APXvYqynF9rpuGdcTgFI25Yw0ARUz0SOhDe9yE6k3uqBPqIUhVVAjbf7THev3UXVoGsdH6cigA7rVH1XsyB3eVZamfY=
X-Received: by 2002:a05:6830:1b6a:: with SMTP id
 d10mr8381765ote.52.1576156731010; 
 Thu, 12 Dec 2019 05:18:51 -0800 (PST)
MIME-Version: 1.0
References: <20191212120055.129801-1-weiyongjun1@huawei.com>
In-Reply-To: <20191212120055.129801-1-weiyongjun1@huawei.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 12 Dec 2019 14:18:39 +0100
X-Gmail-Original-Message-ID: <CAHmME9qjDkwXCF0Q=QNJwZ6Cs97Mbm=V13wA7+zf1PEyifQeZg@mail.gmail.com>
Message-ID: <CAHmME9qjDkwXCF0Q=QNJwZ6Cs97Mbm=V13wA7+zf1PEyifQeZg@mail.gmail.com>
Subject: Re: [PATCH net-next] wireguard: Using kfree_rcu() to simplify the code
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Wei,

On Thu, Dec 12, 2019 at 1:03 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
> The callback function of call_rcu() just calls a kfree(), so we
> can use kfree_rcu() instead of call_rcu() + callback function.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

I've queued this up as:
https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/wireguard-linux.git/commit/?id=2ddefeb5872878fe2fffb83664c02bd104fb1a52
I'll submit this to net-next next week as part of a cleanup series I'm
preparing.

In case you're curious, this originally was call_rcu_bh, as there was
no kfree_rcu_bh function. Since the _bh functions got unified a few
releases ago, this was changed to just a simple call_rcu, but
apparently missed the optimization you've done here using kfree_rcu.
So thanks for the patch.

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
