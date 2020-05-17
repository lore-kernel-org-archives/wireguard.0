Return-Path: <SRS0=k9se=67=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8EEC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 May 2020 08:51:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18E7A205CB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 May 2020 08:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18E7A205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pineview.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eaff07da;
	Sun, 17 May 2020 08:36:58 +0000 (UTC)
Received: from mail.pineview.net (mail.pineview.net [203.33.246.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a475e5d4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 May 2020 08:36:56 +0000 (UTC)
Received: from HigherTime.pineview.net (HigherTime.pineview.net
 [203.33.246.62])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.pineview.net (Postfix) with ESMTPSA id EBB8480072;
 Sun, 17 May 2020 18:20:35 +0930 (ACST)
Subject: Re: Significant Dropped Packets on WG interface
To: Roman Mamedov <rm@romanrm.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <21e7d9c5-1d0d-efc0-e698-f59325960df1@pineview.net>
 <20200514141508.294bf88c@natsu>
From: Mike O'Connor <mike@pineview.net>
Autocrypt: addr=mike@pineview.net; prefer-encrypt=mutual; keydata=
 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
Message-ID: <9b569ea3-47cb-1011-a613-6a49d68a047a@pineview.net>
Date: Sun, 17 May 2020 18:20:35 +0930
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514141508.294bf88c@natsu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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

Hi All

So after dropping all the way down to 1364 I'm still getting a lot of
dropped packets, only at one end.

A ping test using 'ping -M do -s 1472 IP' works from both directions but
1473 does not.

I really think there is something else wrong, but I had no idea what.

Mike

On 14/5/20 6:45 pm, Roman Mamedov wrote:
> On Thu, 14 May 2020 16:35:30 +0930
> Mike O'Connor <mike@pineview.net> wrote:
>
>> Hi All
>>
>> For the last few weeks my Wireguard link which I use to as my default
>> gateway has been having issues with TCP connections stalling.
>>
>> I've been trying to work out what is wrong. I just noticed that the
>> Wireguard link has dropped packets at both ends.
>>
>> wg-p2p    Link encap:UNSPEC  HWaddr
>> 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
>>           inet addr:104.127.123.10  P-t-P:103.127.123.10 
>> Mask:255.255.255.248
>>           inet6 addr: 2506:c500:ff4:1::ab/64 Scope:Global
>>           inet6 addr: fe80::e6/64 Scope:Link
>>           UP POINTOPOINT RUNNING NOARP  MTU:1500  Metric:1
> Reduce MTU of the WG interfaces to accomodate for overhead. See 
> https://www.mail-archive.com/wireguard@lists.zx2c4.com/msg01856.html for
> calculations of by how much.
>
>>           inet6 addr: 2506:c500:ff4:1::aa/64 Scope:Global
> I wonder what's this IP range, is this some VPN service? Squatting on
> unassigned IPs within 2000::/3 seems like a very bad practice. If they wanted
> an imaginary GUA for their NAT66, I'd suggest something like 66::/16 instead.
>

