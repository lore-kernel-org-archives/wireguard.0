Return-Path: <SRS0=wyc1=2U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8394EC2D0D3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Dec 2019 11:51:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09980207E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Dec 2019 11:51:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="tBWa4vvO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09980207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59b6eb81;
	Mon, 30 Dec 2019 11:50:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c170c21
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 11:50:47 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 239ee86f
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 11:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1577706645;
 bh=iH5n9n9ifun7KHyyheo+BuNi7YQ6bQUZbJEI65Fj9sA=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=tBWa4vvOQRqYInPUTWVBQFj4tCF7MDwss9BldI27q+/SV6oEE08x1wYwEN1ZY5Gv8
 ohQBfHZeEBALSMfRLRO9Artpaw6MAaEK9XX2v7CfjiPLksDtqlbDIKI6e92coF155V
 LGBfnHmFpBSefuvEykc8jn5qkPY/l4QdeGlheIlk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.34] ([93.207.123.91]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lhvpu-1jYgn12G26-00nBdU; Mon, 30
 Dec 2019 12:50:45 +0100
Subject: Re: remove peer endpoint
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CtiLrRxfJF8VjxK15ZVRrI9eJBflmVjOBKiOTYAHVAmF7lVPMuQvg3luFb89M3FKdy2fvemWnkfXd-LRJ1MCGy0GC2TddQuX0-Wga9hBS_4=@protonmail.com>
 <A02FDAAF-B405-4735-9DD1-95A7F6CE9B3F@lonnie.abelbeck.com>
 <bWad1d4zSz8UESfEBgTLTfDZQbC9-fLXfJF2R3GoONB9PuL3WjNnYrnFQOYmt-gQa9sLLMDJJ8p6zY8XEUlXxxudvzNC5OUjuG75yjbBMIY=@protonmail.com>
 <CAHmME9q1s8Ze40Uzi9+9PM8h=iWAs7_U=Zh2+5O8GjAjQKFeag@mail.gmail.com>
 <CAHmME9q=L1kyxSu8KBVMkZx6-A77RaAeCtXeOaYQbXGDho-Ujg@mail.gmail.com>
 <b01381cb-dd21-10fe-8223-19bbcf9fcca8@web.de>
 <CAHmME9pj1V5s3UzYx3BGmgD9ffuOepHM76k5OGU1f08Xr9j-oQ@mail.gmail.com>
From: em12345 <em12345@web.de>
Autocrypt: addr=em12345@web.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <54c26a82-4b7b-1bbd-4879-4c504392fc1a@web.de>
Date: Mon, 30 Dec 2019 12:50:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9pj1V5s3UzYx3BGmgD9ffuOepHM76k5OGU1f08Xr9j-oQ@mail.gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:msvN3v4gx+Ffv0l+Gi9PvJp6pOXBnNfZv2yfp0C8AfMQ76dSBeS
 iXGdAsDEf9WgxNzFstzXza34QsicOYk+wtCEonKfKSmsutxcQmyZmksRoH2FdCYMhTdv0EZ
 T/rVtQ1hy8nd/vMLAbB73SvfeBZDcSetUGv6qW03sQtI4TPCPzLJXmbaICnFNm3fYCao9mG
 wv2M5QOrZNs6P+gsG1+bA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q1MQXtrVD0c=:ecERHR+fWOLWGcLv9e1HqF
 dzdisfABGUqAZGIDT4WLHG/GMpCYZFWkPd5tKLlf8X3HLxCqQDQYs7UDkygu9PkKCb6T+VZ36
 KptBwg8uimBpL/v3zfcThuvViX7djhJEWsF/GUF1St7ts0wrL0cS5+uDu+fW8Y7+tU6eV3uJz
 lNQJT796onU/iL/As6pUMxENtq/g6HSRxWn4BN3KTqV9TdITcxUWUApQVCrQnw0n0gpyvHl0D
 5wYPxDDHLPJPqRXo9lP6NHmvwBMrjBuPyT2bhpwPNmuP3BC5KLPOu/4NJA7QS4ar6rRbbyBV1
 +aXCi1fbOJQPTQZlG+pJKz90nVvUxKHh2xIFTCSiYtIX6QBi/oznNxcoGjT6yrr0QQ0ws2pat
 QQ+J8M6Z53yHV+TDoosph1HqOMaoRmN68yAtZwwIwhLdYI9BZuW1ZiiIGmpX3FD31bqqu0vdn
 xEPuQEAMMun0VdAzZ+4SAOBqGpTbqlu4gLsjjCPK8dA+7IhxZCdlR2tWTfSR2GcG0yF549q1Y
 XEnr53S7T10YhfaI2SZJ83D8r4dBLZLVjXJVr3W2Whgc0dSjcJfj6buE3i/NtEc0vpdPY0cx8
 ITERxGndt+RJHd08/aA02lcOJ38fHqZSMiHno/4t9G4RLYaEL2YpU9PfiRtyDMRRwnk7QJmLr
 gp7YDkVyWHVUePfSlzmbH0tXNxeM+f4njt/gIcw9Aj0pNr2p2gZskwX5HWRb1BWXcldXDZmtw
 50QYiapYPgjsK1pHbDaPv9YsZdjCaowbPEmJXjvhzbjrKBIxFchFG6nmNAXRoneDQz+Z/5Y+O
 Al8g9QEgvbM5SiRrdH/G5gzdgnIcE2JSmBXiyhWejd3tlwAbfxQp+AYd964bx6llRTNyAx6DS
 v4lCJM3eWg5L7lk1AuMTrotVogz1nRY6E89oK/Mv1IQPEUl3nlujK5TIjIq37sZ8LuMhM9HfO
 lrOHCzhl1BEDpYlDy9+N5jZKfTps1KHVOeNMWS+NWMTsIYQ0OFcVYZ4IyQtHvLGjPkYCs3wqT
 IzLI3RwiZWZZFPHpJ8YvQFCyl3SjNgaosxl/DmuoTH+D3Z//VZiF5VGO6q9ZsIVlurmBmZh9I
 XPFbWOn6eZopM6DE8+EyQrkLUmR8EBs/2QxChrmUSdEKR+mjYgHiP8AnUPb4t+SS/RMeUmUXj
 kiLcgJENQe+2PEA6HvuSKF4fdfy98rrt/zFV8VkNslGm+EeWY5/R4/NbnIrp32nTWjW3CGilY
 e+9TVdmSoZtkEao8e351Gorjt9PokXagkZLkSIQ==
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

Sorry, may be I was not clear enough. I didn't intend to ask for the
removal of the ability to set an endpoint, but for the ability to
configure a peer without knowing the endpoint at configuration time.
Because the endpoint is only known at a later point.




On 2019-12-30 11:58, Jason A. Donenfeld wrote:
> On Mon, Dec 30, 2019 at 11:13 AM em12345 <em12345@web.de> wrote:
>>
>> Hi,
>>
>> in my case the reason is not exactly being able to remove the endpoint,
>> but rather being able to setup a peer without endpoint, so that only the
>> endpoint needs to be setup later.
>>
>> Scenario:
>> All keys for interface and peer are configured via "wg" standard config
>> file, so that the interface can be brought up at boot time.
>>
>> But when having to use a to be resolved host name as endpoint, then the
>> boot process blocks for around a minute in case no network (incl. DNS)
>> is available. At least when running systemd reading
>> /etc/network/interfaces. I'm not using systemd builtin wg support.
>>
>> There is of course the possibility to bring up the wg-* interfaces later
>> altogether. But the easiest way for me was to use a local endpoint IP
>> (127.0.1.1) address, and then use up/down scripts triggered on LAN/WLAN
>> up/down, which then only resolve the endpoint host name and set via wg
>> the resolved IP of that.
>>
>> This way I'm also able to use several hostnames from different DynDNS
>> providers, in case one service provider is down, which wg as far as I
>> know doesn't currently support.
>> I.e:
>>         1.) resolve first host name
>>         2.) set endpoint IP on peer
>>         3.) ping into tunnel to see if it is working
>>         4.) if not working, then try next host name
>>
>>
>> Thanks,
>>
>> Emmanuel
>
> You've misunderstood the discussion. Nobody is discussing removing the
> ability to set an endpoint after the interface has been configured.
> This exists and works today and isn't going anywhere. Rather, this is
> a discussion about being able to unset an endpoint.
>
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
