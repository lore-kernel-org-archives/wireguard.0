Return-Path: <SRS0=nAhE=O3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C327C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Dec 2018 22:46:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FEBF21871
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Dec 2018 22:46:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="OSZZpucw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FEBF21871
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a451c5bb;
	Tue, 18 Dec 2018 22:45:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73eabf7a
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 22:45:29 +0000 (UTC)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6187989d
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 22:45:29 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id w13so60787oiw.9
 for <wireguard@lists.zx2c4.com>; Tue, 18 Dec 2018 14:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M0fovPaejCSnAIlXPUHQDx5Uqw4k7X3eLw0EVDan47I=;
 b=OSZZpucwNqWG92kh++ew3zK4p4mwWbTuVpmgmoTvPqRqcOpPl9R+vCnM3VWPCSX+wm
 e85UQ2agUTZilGZN1Jd5EYhFtkNNNDFW2LDtSRMrWt/mykwRYcQrY8zX7J/BxKdjCoRz
 hwrl7D4mxa7Q0tI/zV3LDzYouqMJ8npzRqIINNpVkkpDTT3/s52shk8qjY70l/TOzHfu
 iOVyoGZ5KCQW0Z3KLhHGoTvWG4YnHKYjWy/HjKUY8CGw9Fr5DvDCJ2ZDa5xoz6oOpAeo
 YP5F3/B3NK+EqNaAqCBuzpK2TtHK1HoIOqBMiRpfzijLfKMdN5vgmvhXUmvcaqe+VO+l
 Hosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M0fovPaejCSnAIlXPUHQDx5Uqw4k7X3eLw0EVDan47I=;
 b=jo0e5Ecc+I1pBViUDpIofHcB2o5x5PqwBYG1YkdWWxr+/SJ9a5F4uYEIpyVyihcqAj
 TXYNAyApu7TzMAyAgNQNXPlfLb0QKyYF3CaOg+l4U9UHQHjJl8xnLbmDhfUAu/crqMkq
 FKbOxCmd7HNZFi6drXhzV1Pr3PI7puKGhFT9qMxV13ejvGB/5pTCYec5iGMqP/tiDZJc
 JR6/Q1zVjbCBVhyramPL+QYAJ4J5xK4VBHmV4S16XRnxpDidBQ+P2x0roSFt19rkhD7F
 rjOCJqRqQIrTi4tfBGgcCCPehtpsL0JL4SDAvoC0kR3n/GRYfKuHyso7JQZgQbXGbedO
 aCiQ==
X-Gm-Message-State: AA+aEWZuB0JmAvT8ANpilE/LRkSaiQ/4o0dd+qsUxZg7EMIsFK12+sZn
 MY0scbGuLQpMYNS0skW7wzsLzuWPBIBC6kEEDedqq4qu6EQYqA==
X-Google-Smtp-Source: AFSGD/UYtgxK60YJzx6lawe1YXgsM9uCcN+5cgYZ2T6MpfrX727CvXHAdFCr1NANj9VCkiQR9lQujgaE18SCYfMWW/Q=
X-Received: by 2002:aca:3c06:: with SMTP id j6mr8650772oia.126.1545173158885; 
 Tue, 18 Dec 2018 14:45:58 -0800 (PST)
MIME-Version: 1.0
References: <CAO_nJAZG+GtovJG0tCusWD3VrMdV=ZMJ1=OXTTO4DQsChtriVg@mail.gmail.com>
 <CAKXLc7ewkUKnVLugQAzqWbRxb8w1NaDBV4_DtAJeBSVyggveOA@mail.gmail.com>
In-Reply-To: <CAKXLc7ewkUKnVLugQAzqWbRxb8w1NaDBV4_DtAJeBSVyggveOA@mail.gmail.com>
From: John <graysky@archlinux.us>
Date: Tue, 18 Dec 2018 17:45:48 -0500
Message-ID: <CAO_nJAaxt5TmkVe1JJf1c1Aw2fD0_ya4TcSPyT1D3RNtHrn=+g@mail.gmail.com>
Subject: Re: Syntax for iperf3 to use over pair wireguard interfaces on a LAN?
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
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

My mistake... I opened 500/udp for both sides... a quick fix was to
allow all from 10.0.9.0/24 and it works. Thank you for the reply.

On foo:
% iperf3 -s
                                     :(
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
Accepted connection from 10.0.9.16, port 54812
[  5] local 10.0.9.15 port 5201 connected to 10.0.9.16 port 54814
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec   102 MBytes   854 Mbits/sec
[  5]   1.00-2.00   sec  98.1 MBytes   823 Mbits/sec
[  5]   2.00-3.00   sec   107 MBytes   901 Mbits/sec
[  5]   3.00-4.00   sec   107 MBytes   894 Mbits/sec
[  5]   4.00-5.00   sec   104 MBytes   870 Mbits/sec
[  5]   5.00-6.00   sec   101 MBytes   848 Mbits/sec
[  5]   6.00-7.00   sec   107 MBytes   899 Mbits/sec
[  5]   7.00-8.00   sec   107 MBytes   901 Mbits/sec
[  5]   8.00-9.00   sec   107 MBytes   901 Mbits/sec
[  5]   9.00-10.00  sec  98.1 MBytes   823 Mbits/sec
[  5]  10.00-10.04  sec  4.50 MBytes   901 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-10.04  sec  1.02 GBytes   872 Mbits/sec                  receiver

On bar:
% iperf3 -c 10.0.9.15
Connecting to host 10.0.9.15, port 5201
[  5] local 10.0.9.16 port 54814 connected to 10.0.9.15 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   107 MBytes   898 Mbits/sec    0    361 KBytes
[  5]   1.00-2.00   sec  98.0 MBytes   822 Mbits/sec    0    361 KBytes
[  5]   2.00-3.00   sec   107 MBytes   901 Mbits/sec    0    361 KBytes
[  5]   3.00-4.00   sec   107 MBytes   898 Mbits/sec    0    442 KBytes
[  5]   4.00-5.00   sec   100 MBytes   840 Mbits/sec    0    465 KBytes
[  5]   5.00-6.00   sec   105 MBytes   880 Mbits/sec    0    488 KBytes
[  5]   6.00-7.00   sec   107 MBytes   897 Mbits/sec    0    513 KBytes
[  5]   7.00-8.00   sec   107 MBytes   900 Mbits/sec    0    513 KBytes
[  5]   8.00-9.00   sec   107 MBytes   901 Mbits/sec    0    513 KBytes
[  5]   9.00-10.00  sec  98.2 MBytes   823 Mbits/sec    0    513 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.02 GBytes   876 Mbits/sec    0             sender
[  5]   0.00-10.04  sec  1.02 GBytes   872 Mbits/sec                  receiver

iperf Done.

On Tue, Dec 18, 2018 at 4:49 PM Kalin KOZHUHAROV <me.kalin@gmail.com> wrote:
>
>
>
> On Tue, 18 Dec 2018, 20:50 John <graysky@archlinux.us wrote:
>>
>> On bar:
>> % iperf3 -c 10.0.9.15 -B 10.0.9.16
>> iperf3: error - unable to connect to server: Connection timed outa
>
> iperf -c 10.0.9.15
>
> Also for the server, omit ipaddr, it listens to all interfaces by default.
>
> Kalin.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
