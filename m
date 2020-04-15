Return-Path: <SRS0=RTrd=57=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68289C2BA2B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Apr 2020 21:47:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18A5E20774
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Apr 2020 21:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18A5E20774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=attglobal.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c7f3695;
	Wed, 15 Apr 2020 21:37:11 +0000 (UTC)
Received: from p-impout001.msg.pkvw.co.charter.net
 (p-impout006aa.msg.pkvw.co.charter.net [47.43.26.137])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f1df5c1b
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 21:37:08 +0000 (UTC)
Received: from [192.168.0.2] ([76.91.204.161]) by cmsmtp with ESMTP
 id OpsBjJoQb4hsvOpsBjooJD; Wed, 15 Apr 2020 21:47:08 +0000
X-Authority-Analysis: v=2.3 cv=F9QpiZpN c=1 sm=1 tr=0
 a=rO8gbEbqGp3jIVlhlq3uIg==:117 a=rO8gbEbqGp3jIVlhlq3uIg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=c74aSyLInKe8uVJEfVIA:9
 a=QEXdDO2ut3YA:10
Subject: Re: More reliable packages available for RHEL, CentOS, and Fedora
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Joe Doss <joe@solidadmin.com>
References: <20200404211246.GA10066@zx2c4.com>
 <CAHmME9oWwW7qC_wzQ3JUE+CZF3eBzJG7v3x5RZww75H8pW+2tQ@mail.gmail.com>
From: Eddie <stunnel@attglobal.net>
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <024be24b-7f0f-1890-f5c5-b9abb1e7e079@attglobal.net>
Date: Wed, 15 Apr 2020 14:47:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9oWwW7qC_wzQ3JUE+CZF3eBzJG7v3x5RZww75H8pW+2tQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CMAE-Envelope: MS4wfIYF72JEfWX3QE8lHglUmsju2QY4gvA/+xtO1MkpxbchrkKwayy4y8/F5r6lEvgvjuJ8I80p3ZsSi4B/8KzlaV7gzjE5xIZhG6WcZ9xt6VvwUKzYog3b
 ClXOyMuDL667CZtfFOYhx0kgYJBTqxZ8TCcKg0i0OmW6h2oidER9b5fPOCeuTaV4oR/wQpVDFxgWaZD1zzGEHDLn+CtZC/W9+dNuXC/r7cRL5YikNr4YVdSM
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

On 4/15/2020 2:41 PM, Jason A. Donenfeld wrote:
> It turns out that ELRepo is a bit of a crumbling mess, unfortunately.
> FOR CENTOS USERS ONLY, the instructions in the previous email need to
> include:
>
> $ sudo yum install yum-plugins-elrepo
>
> Hopefully Red Hat will simply include WireGuard in RHEL 7 and 8, so
> that we won't have to deal with this. But for now, this appears to be
> the best we've got.
>
> Jason
>
Actually that's:

yum install yum-plugin-elrepo


Cheers.
