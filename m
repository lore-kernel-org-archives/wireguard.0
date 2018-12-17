Return-Path: <SRS0=kUA2=O2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C317C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 07:50:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9194A2084D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 07:50:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JdBUUoP4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9194A2084D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9019c819;
	Mon, 17 Dec 2018 07:50:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9756073
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:50:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ea72602
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:50:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8eb69d5
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=dciFovUgI7D4MmQAzq4U8Wab7nw=; b=JdBUUo
 P4W6wb5QD9fLQWpJcNamYaOC78hJm4kePtjQ/4BRsmfIJMyTkdPf9lIFLb2N97Dc
 GhVdzi0GdKR3qme5YWy2oePEI/Ea5CFFWDfRFcOQD9z/Y8FWpe7squ/N76IO0iqN
 Q+Xow8+z/m3bwf4AmeYCOD74yQj5kQdMIJWTImJ1xr5CUMnMPe6A1eOFNeXOonGy
 5SxnZMcvaVfofLmcbZImn4gDDu9011WGUvptqHzsgBK0UOXfZKtgjmU5cSpM9ugw
 ejDvtEGbQfxHbjSb4ALaCHT66VhoHC0SV258fXdyuE/RRjwXwkG0Nk7JXnt7CdT4
 kqt3CER2RQCplbIg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 089510b3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:41:07 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id t204so9423470oie.7
 for <wireguard@lists.zx2c4.com>; Sun, 16 Dec 2018 23:50:40 -0800 (PST)
X-Gm-Message-State: AA+aEWbT9roMA4L7Xm0esPmZe7u/Il4qIjZCMJ8zQBxRiq3PSP7g6tPE
 MXsL5rUuxHg7WXH24rK1xlLS+widY9zZams0z6M=
X-Google-Smtp-Source: AFSGD/WZFoZEs07i/P5Dg+2pI7lbK24Jy2Hrvps1hfvn3Pf+eTlm5cO5/MSxJkY5pEDkCm21ITuMOnG56tRZGEFzaCo=
X-Received: by 2002:aca:c650:: with SMTP id w77mr4443761oif.122.1545033039338; 
 Sun, 16 Dec 2018 23:50:39 -0800 (PST)
MIME-Version: 1.0
References: <CAKVinOVZ1nVJh8LvqGme5C27+R=AFBOxPKS22ckO7TEHsbc4-A@mail.gmail.com>
 <20181217074423.GA18720@arch01.localdomain>
In-Reply-To: <20181217074423.GA18720@arch01.localdomain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 17 Dec 2018 08:50:28 +0100
X-Gmail-Original-Message-ID: <CAHmME9pyAt=+DpZH1zmpLh7wJFCDf=ZmX_JrvYsXEy-+zZS1Xg@mail.gmail.com>
Message-ID: <CAHmME9pyAt=+DpZH1zmpLh7wJFCDf=ZmX_JrvYsXEy-+zZS1Xg@mail.gmail.com>
Subject: Re: [Question or Feature Request] Any wg1.conf option to limit peer
 IP as 1-to-1?
To: Tim Weippert <weiti@weiti.org>
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

On Mon, Dec 17, 2018 at 8:44 AM Tim Weippert <weiti@weiti.org> wrote:
> This should normally do what you expected, but i think as stated above
> the /24 routing is "disabling" the correct behaviour.

False. The /24 routing won't disable anything having to do with
allowedips. And some people like to route larger masks than their
peers, so that they can support multiple peers with a single route.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
