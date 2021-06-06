Return-Path: <SRS0=ObIi=LA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDC2C47096
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 10:39:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 311B96135D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 10:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 311B96135D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15dad358;
	Sun, 6 Jun 2021 10:39:34 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0c0922b6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 10:39:33 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id p17so20409349lfc.6
 for <wireguard@lists.zx2c4.com>; Sun, 06 Jun 2021 03:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=lpQE2+y7xGBwzXlYgkb3XZ1aSqtN0rExphjyGtaEDWY=;
 b=EdPauxGF0ZUFEKtxHeNJT0GDoPVbHcSxerC1i1geiBJtvCPekSFG4PW2zPmRYSUeMC
 Ojv1qYPLqcebZVkH/GueiTBrxF88wvtBFZFmgoNjPitlBXUr00gk7Uw6mv5hlYxQbYFF
 NBRuK1Q7pjVvkiqyNQc51WpVLyESsIbt3m29lImWNYwYOiERfPzlqMZnfU1wTNNZzwxv
 WrRxZU+PDrm5WSdfjFphev2kHykUVGF6V2KuLW/LZp0D6kNV23n5vBZFCYE+BUfPY+Iw
 WzHTck1v4aXhWSsGAePjrhKS7qM1RwQC0iCC3TwH0Yjo6Kg2NpwhGyHMRNI9uNv/qu7+
 F5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lpQE2+y7xGBwzXlYgkb3XZ1aSqtN0rExphjyGtaEDWY=;
 b=DfLDFWZkkFN0fGh/3uLe6HrVgVQ8ULSrsh/5QoI40h7uCBcT6P+ekkG7tV9fMGpgxK
 1NfRJrlo61oPH4UdRs/K7pqZRBjarSwnxqVzcWJM3/CUV50UtoYZ9goh8R7889q78QZ7
 hbQuOIcDf0efTStud+aEcS6cbhHory8E+0LbV/jerT6/ZLy9aSUjuV7qmpmWwTBMHhXM
 i5K0RHOJnpRX7VYzHeI9FPMTiDuuBZQtTUWvg+CzA25L5s0V5MEbKM9ZlNYWR0AZhX+q
 KZaB+/UFyaHzmbH+7jSfeOh+0p0l3L701QHwNnHSSwim2ZQij4XUhS9vy9Rrs1ebGEaR
 7K7g==
X-Gm-Message-State: AOAM53045yg7KL6xdQbdYRD77fTEwXe14ZJEYYj1C/3ansutfb8GWEGx
 nrhHPziaJBRjDWxxqSFOyi92iDHmWEA=
X-Google-Smtp-Source: ABdhPJyeNmuDJR7YmhW5cQMZ+7OZLZ8ke24rgwRioLkJyCgtLZ8fpaM7Es5iGLNh0PT/bPqB+4yBnQ==
X-Received: by 2002:a19:4083:: with SMTP id n125mr8406808lfa.585.1622975972472; 
 Sun, 06 Jun 2021 03:39:32 -0700 (PDT)
Received: from [10.10.18.210] ([45.15.16.60])
 by smtp.gmail.com with ESMTPSA id u13sm1112758lfq.201.2021.06.06.03.39.31
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Jun 2021 03:39:32 -0700 (PDT)
Subject: Re: potentially disallowing IP fragmentation on wg packets, and
 handling routing loops better
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
From: Vasili Pupkin <diggest@gmail.com>
Message-ID: <5b6e244e-017a-1e8a-3778-179fa785f236@gmail.com>
Date: Sun, 6 Jun 2021 13:39:21 +0300
User-Agent: Mozilla/5.0 (Windows NT 5.2; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Hi,

I've dig into the subject two years ago and only vague remember details. 
As far as I can recall there was a time when WireGuard set DF flag by 
default and there were two issues:

1) for security reasons WireGuard doesn't issue ICMP fragmentation 
required response in the unencrypted channel if an encrypted packed 
didn't fit and was dropped
2) there is no way client can tell the server of MTU limitation it has 
on its side

Combining the two we have a situation in a chained wireguard VPN setup 
when MTU size is misconfigured on the server and the remote host 
wouldn't get any icmp to help with its PMTUD algorithm. The client can 
still set MSS in its TCP connection though.

Again sorry if I missed or messed something, it was long ago and I don't 
remember details.


On 06.06.2021 12:13, Jason A. Donenfeld wrote:
> Hi,
>
> WireGuard is an encrypted point-to-multipoint tunnel, where onion
> layering of packets via a single interface or multiple is a useful
> feature. This makes handling routing loops very hard to manage and
> detect. I'm considering changing and simplifying loop mitigation to a
> different strategy, but not without some discussion of its
> implications.
>
> Specifically the change would be to not allow IP fragmentation of the
> encrypted UDP packets. This way, in the case of a loop, eventually the
> packet size exceeds MTU, and it gets dropped: dumb and effective.
> Depending on how this discussion goes, a compromise would be to not
> allow fragmentation, but only for forwarded and kernel-generated
> packets, not not for locally generated userspace packets. That's more
> complex and I don't like it as much as just disallowing IP
> fragmentation all together.
>
> Pros:
> - It solves the routing loop problem very simply.
> - Usually when people are fragmenting packets like that, things become
> very, very slow anyway, and it'd be better to just stop working
> entirely, so that people adjust their MTU.
> - Is anybody actually relying on this?
>
> Cons:
> - Maybe people are running
> wireguard-over-gre-over-vxlan-over-l2tp-over-pppoe-over-god-knows-what-else,
> and this reduces the MTU to below 1280, yet they still want to put
> IPv6 through wireguard, and are willing to accept the performance
> implications.
> - Some people don't know how to fix their MTUs, and breaking rather
> than just becoming really slow isn't the best outcome there, maybe.
> - Maybe people are relying on this?
>
> Before anybody asks: we're not going to add a knob for this, simply by
> virtue of this being a decision with pros and cons. Please don't bring
> that up.
>
> I'd be very interested in opinions about this. Are there additional
> pros and cons? I know the matter has come up a few times on the list,
> mostly with people _wanting_ fragmentation (I've CCd a few people from
> those threads - Roman, I expect you to vigorously argue the
> pro-fragmentation stance ;-). but I'm not convinced the outcome of
> those threads was correct, other than, "yea, that's easy enough to
> enable." But on the other hand, maybe the cons are real enough we
> should rethink this.
>
> Please let me know thoughts and ideas.
>
> Thanks,
> Jason
>

