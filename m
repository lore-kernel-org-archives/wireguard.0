Return-Path: <SRS0=89gA=OS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE6CC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 03:30:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2084260FC0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 03:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2084260FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1f9be0f;
	Tue, 28 Sep 2021 03:28:11 +0000 (UTC)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [2607:f8b0:4864:20::b29])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ab628451
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Sep 2021 03:28:07 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id u32so7991738ybd.9
 for <wireguard@lists.zx2c4.com>; Mon, 27 Sep 2021 20:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RiLP08FsZBUk+hWO/2M+gq118BWhjglrDtGcyjcLYZg=;
 b=NmGk5Lw5EOaYWFM7N7E3gGogGPSxpA3ggQ/sgi6HrDoQve8fssajfEU1wpDmEcOJJk
 d+Cc7OfX/V95KcldC+nX74z7+HOEIGOBYotn9F6sSvkvUt87E0+HdEko/+vYKuugEFFL
 SyGmBKSRiP3M1+55ZqA8g/YfQf4DxvNamXlz0zzDU5vOHtn2clRpBmYxb3I774m7oTiG
 lG4nijiuXcI3BLEocBxJImeV5z86+EuOxS++FgeODMplgAiXnoZtln/IW5th21CqvS2p
 ch9koVK27O8EOGIVn/fs5Our4ZpB5XLtSBnzJ4ZO7uKiacm4Fge2pSZ0KWtAuLJk1SDk
 iOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RiLP08FsZBUk+hWO/2M+gq118BWhjglrDtGcyjcLYZg=;
 b=rXDr5Q7sUzpihp+Cc+Keooz7REGXQQ9ABREtPr1447Wt4NRwfczK19HHdjrGn4p+wo
 Vma4eRkuVmlis9KYkPmlsGwn2pTrK9QdMCmAOpfUNJ3MKYHBkOEMAdY+sqX0GzxtB9HE
 9+YcTO4I6CwYnAElD2oPfDjymRiohLatpD4VqJg08Fih8nuRFsxjXcD5i3taHZmmJDsV
 Qr8i0ocs0P+/zHIymIYfJ8xhc/hUykFS5ByxRnWiMYxUnVbLbJSHfmIQsy87LwdtQvp6
 ja4v42HQlYQB9LpLdrMZrfOv09j8xLqMwxmjwV2LPcfjWNQRzq4p8RG82YxRZ2VaWlUB
 RylA==
X-Gm-Message-State: AOAM531FSYxloLkCaRRlFq+0TXm3kxJQUaV2GH/o6e/iAeZKl16I8xj7
 XF3+MiIjBW2wFfstyvGRnfNvD7Q06as6usjaMSc=
X-Google-Smtp-Source: ABdhPJwSPhW9ae7dgYmz4ku03bVZmlDul9/+i/Io4gAHOAW5aIH0uUpjt/qoDPEREFo+Dl5V/XtZb6ZT4iCZ/bZsp1o=
X-Received: by 2002:a25:3b04:: with SMTP id i4mr4162689yba.524.1632799686518; 
 Mon, 27 Sep 2021 20:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210928031938.17902-1-xiyou.wangcong@gmail.com>
 <CAHmME9rbfBHUnoifdQV6pOp8MHwowEp7ooOhV-JSJmanRzksLA@mail.gmail.com>
In-Reply-To: <CAHmME9rbfBHUnoifdQV6pOp8MHwowEp7ooOhV-JSJmanRzksLA@mail.gmail.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Mon, 27 Sep 2021 20:27:55 -0700
Message-ID: <CAM_iQpV-JKrk8vaHDeD0pXaheN0APUxH5Lp+mGCM=_yZQ1hd4w@mail.gmail.com>
Subject: Re: [Patch net] wireguard: preserve skb->mark on ingress side
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Netdev <netdev@vger.kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Cong Wang <cong.wang@bytedance.com>, Peilin Ye <peilin.ye@bytedance.com>
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

On Mon, Sep 27, 2021 at 8:22 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Cong,
>
> I'm not so sure this makes sense, as the inner packet is in fact
> totally different. If you want to distinguish the ingress interface,

The contents are definitely different, but skb itself is the same.

Please also take a look at other tunnels, they all preserve this
in similar ways, that is, comparing net namespaces. Any reason
why wireguard is so different from other tunnels?

> can't you just use `iptables -i wg0` or `ip rule add ... iif wg0`?
>

My bad, I forgot to mention we run eBPF on egress side, where
skb->dev is already set to egress device (a non-wireguard device),
and of course skb_iif has been cleared even earlier.

Thanks.
