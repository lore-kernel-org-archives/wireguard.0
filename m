Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D74AC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Jun 2022 11:41:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2460a084;
	Wed, 1 Jun 2022 11:41:24 +0000 (UTC)
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [2001:4860:4864:20::29])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f26d66cf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jun 2022 11:41:23 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-f2bb84f9edso2289696fac.10
 for <wireguard@lists.zx2c4.com>; Wed, 01 Jun 2022 04:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JMp9qHUXckdYQxK+OA/tLX8A1M79Sf/cEmjzEhd68WE=;
 b=hm64WUG0SunVYdxnl1DzvFd1XDT8zeEprK5qn8a+81rKbdwLRA22ECGEeLrMDGed+Q
 um68cUJwRreQfmkMXwKEsoe1DIjgOR8rLzyWTGZufZveeM5AWHEzUfBE4tvqnfNHSM4A
 aH1fwUKs7nxVRGS7BrYhc/LjWy1egbbzN0w1ZzZG13wW5BSoiQ+pLtyC8DI4N5pRnE4W
 /C5jZwpyIZkW4/YNjUZ0XSuTcout2JDhLS4+W+SQBFaXccsFlVaH71LUhmbZpHHWWzD7
 ih2ZVeCF76as4ygYTvuLANVOAiHnYwxYDbDz18Zx6JbKrzFxmhgThdsQ991RgSuaDSq7
 3tSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JMp9qHUXckdYQxK+OA/tLX8A1M79Sf/cEmjzEhd68WE=;
 b=eC5+t1YQMsNC7pmwJ/8VZZiWKE3X6+zbnC3IobwhJi9T7LjCYtNiU+t55PC9b6Gdt6
 zS0IvvbChJM6eFhx2EBsj4GAkJEFftT3m89MIpa8wtQ3ia5Us4hwzntLmccBaG6QqlWD
 WorgZUWzsnLoz3wwjk/58GlGnXMfSl5lzQdOppDtArm3kf3WhpwtCkGyTk4R9Pj07mHg
 v8uOx9soB36eNzjJ3li5WAwXfacS/dFEX3CXAkJ3V7ZQmQ+JSmfi6/d4BTbltcDIkoEz
 zeCE+US1UrvVm8pavQW0+CNf9Gr4dHLwp89WnWGH474YnoZiiRuyJgFEljpMUZY/halX
 8QVQ==
X-Gm-Message-State: AOAM530INGcs+a7BgM2siRE37poFIUXyeCqNrUdQ2+Yc/FpDb0x+t0rL
 sjr1nWec8O0c7b48tAZwJttTliRWbls6yzHTskQ=
X-Google-Smtp-Source: ABdhPJxhkZYUro//wvWtET0c3qZVj2/xS+MHlIjBvMKFSlrmFRvAB6iPnCgkpN567Sn8MYreFjGeVi8iGIv5NOWdaLY=
X-Received: by 2002:a05:6870:46ac:b0:f3:43f9:709d with SMTP id
 a44-20020a05687046ac00b000f343f9709dmr7378662oap.105.1654083681959; Wed, 01
 Jun 2022 04:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <CABBZOs=CRGXaYmajx6GLJMU0sxZbda=qDgKsiB_KM_k3DygCJg@mail.gmail.com>
 <CAA6-MF84eCwegH3UcQuqrL7YaCQULf5=KafQYZPVJWATEtfL0Q@mail.gmail.com>
 <CABBZOs=kxe4DwHN=utdb8FzDTt3=TcSo05JVAo=-JCUjC_eEug@mail.gmail.com>
 <20220601145143.75234bd8@nvm>
In-Reply-To: <20220601145143.75234bd8@nvm>
From: Houman <houmie@gmail.com>
Date: Wed, 1 Jun 2022 12:40:46 +0100
Message-ID: <CABBZOsmMSnspA6iTCvv0QZLL9KVtGSvt+KPAMqWecOmKubou4Q@mail.gmail.com>
Subject: Re: How to improve Wireguard speed?
To: Roman Mamedov <rm@romanrm.net>
Cc: Janne Johansson <icepic.dz@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Thanks Roman.

> So did you apply both of that, and what was the effect?

I will create a new environment this afternoon and test the MTU
changes mentioned earlier and investigate the outcome.

> What are the other point that you test against, is it another VPS (better if
> you could try with that), or your home connection?

The iPhone is connected via Wifi to the home network, which is 500 Mbps / fibre.
I have a code snippet on the iPhone that downloads a 1 GB test file
from my AWS bucket (London) for 10 seconds. Then measures
totalBytesWritten / time elapsed / (1024.0 * 1024.0) * 8.0.
Which is the formula for Mbps as far as I am aware.

Client (iPhone) --> server (VPS) --> S3 (AWS) = 117 Mbps
Client (iPhone) --> S3 (AWS) = 506 Mbps

I run this once the Wireguard connection is established and I get 117
Mbps. Then I disconnect the VPN and run the same code again to fetch
the test file without VPN that comes down to 506 Mbps. Client
(iPhone), server (VPS) and S3 (AWS) are all in located London, UK.

I have run your iperf test.  On the VPS the Lost/Total Datagrams is
0%. On the client (Mac) the Lost/Total Datagrams is 0.13%.  This test
proves that the ISP isn't messing around with UDP.

[  5] local 192.168.1.101 port 62103 connected to xxxxx port 5201
[ ID] Interval           Transfer     Bitrate         Jitter
Lost/Total Datagrams
[  5]   0.00-1.00   sec  59.5 MBytes   499 Mbits/sec  0.034 ms  0/44538 (0%)
[  5]   1.00-2.00   sec  59.7 MBytes   500 Mbits/sec  0.012 ms  0/44677 (0%)
[  5]   2.00-3.00   sec  59.3 MBytes   497 Mbits/sec  0.021 ms
15/44400 (0.034%)
[  5]   3.00-4.00   sec  60.0 MBytes   503 Mbits/sec  0.015 ms  0/44913 (0%)
[  5]   4.00-5.00   sec  59.5 MBytes   499 Mbits/sec  0.020 ms  0/44588 (0%)
[  5]   5.00-6.00   sec  59.3 MBytes   498 Mbits/sec  0.018 ms
219/44662 (0.49%)
[  5]   6.00-7.00   sec  59.6 MBytes   500 Mbits/sec  0.065 ms  0/44633 (0%)
[  5]   7.00-8.00   sec  59.6 MBytes   500 Mbits/sec  0.037 ms  0/44614 (0%)
[  5]   8.00-9.00   sec  59.6 MBytes   500 Mbits/sec  0.024 ms  0/44633 (0%)
[  5]   9.00-10.00  sec  59.2 MBytes   497 Mbits/sec  0.024 ms
339/44686 (0.76%)
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Jitter
Lost/Total Datagrams
[  5]   0.00-10.01  sec   596 MBytes   500 Mbits/sec  0.000 ms
0/446756 (0%)  sender
[SUM]  0.0-10.0 sec  657 datagrams received out-of-order
[  5]   0.00-10.00  sec   595 MBytes   499 Mbits/sec  0.024 ms
573/446344 (0.13%)  receiver


For now I'm out of ideas. I will try to play around with MTUs this
afternoon and see what happens.
Thanks,





> It could be your home provider has different speed limits (shaping) in place
> for UDP. Should be possible to test this with:
>
>   iperf3 -s                        # on VPS
>
>   iperf3 -u -b 500M -c <VPS IP> -R # on the other side
>
> And then see how many "Lost/Total Datagrams" (xx %) you get. A high percentage
> would indicate that the actual top speed for UDP is less than 500Mbit by this
> value.
>
> --
> With respect,
> Roman
