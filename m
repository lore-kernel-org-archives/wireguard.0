Return-Path: <SRS0=RTrd=57=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157E2C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Apr 2020 21:56:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A810D20774
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Apr 2020 21:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A810D20774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=attglobal.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c38fc4a3;
	Wed, 15 Apr 2020 21:46:17 +0000 (UTC)
Received: from p-impout001.msg.pkvw.co.charter.net
 (p-impout001aa.msg.pkvw.co.charter.net [47.43.26.132])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 884ef7eb
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 21:46:15 +0000 (UTC)
Received: from [192.168.0.2] ([76.91.204.161]) by cmsmtp with ESMTP
 id Oq10jMH1c9GgiOq11jGcAy; Wed, 15 Apr 2020 21:56:15 +0000
X-Authority-Analysis: v=2.3 cv=Cb52G4jl c=1 sm=1 tr=0
 a=rO8gbEbqGp3jIVlhlq3uIg==:117 a=rO8gbEbqGp3jIVlhlq3uIg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=vyE7voxVtgBtdI70WLkA:9
 a=QEXdDO2ut3YA:10
Subject: Re: kmod-wireguard 20200413 fails transaction check
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <50d9516e-9546-07ce-d0f4-434e5893f2a9@attglobal.net>
 <CAHmME9qRQGQLbuDcfcf8zvsW9twzCkCNqkdMd8kMgEABF=kBYw@mail.gmail.com>
From: Eddie <stunnel@attglobal.net>
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <1a6e785f-9c33-e0e2-d267-4f857040ed20@attglobal.net>
Date: Wed, 15 Apr 2020 14:56:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9qRQGQLbuDcfcf8zvsW9twzCkCNqkdMd8kMgEABF=kBYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Envelope: MS4wfAIqh7husGpR3guTYm7Yys3PxTAfYNrbHdIpg2NnWIniiAquNxVJaqK+FAuwSSKZxds5FFP5DiwnQSliLXs4XEXIKdULtJJNhxHuSIyuqEN5TOFwrZdx
 e0k3TtRQ+Q5JVbRV9tZNGvW8btlyqfOet4OX+TojyADzRVdsA61zDHad/6Iq1lANXtEc2+ir2gpE3bTIQMtXAs1NMVTuSmwLoVc=
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
Reply-To: stunnel@attglobal.net
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 4/15/2020 2:39 PM, Jason A. Donenfeld wrote:
> This is because ELRepo is a crumbling mess held together by bubble gum
> and scotch tape. Run this:
>
> $ sudo yum install yum-plugins-elrepo
>
> And then try again.
>
Much better this time, updated successfully.  Thanks.

Cheers.
