Return-Path: <SRS0=mwgs=BA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F71C433E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 14:01:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 079ED2064B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 14:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cagir.me header.i=@cagir.me header.b="AX/54i6N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 079ED2064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cagir.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c287015;
	Tue, 21 Jul 2020 13:36:54 +0000 (UTC)
Received: from qrelay9.mxroute.com (qrelay9.mxroute.com [172.82.139.9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f61c8598
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jul 2020 13:26:46 +0000 (UTC)
Received: from filter003.mxroute.com ([168.235.111.26]
 168-235-111-26.cloud.ramnode.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by qrelay9.mxroute.com (ZoneMTA) with ESMTPA id 17371a2b2f60001411.002
 for <wireguard@lists.zx2c4.com>; Tue, 21 Jul 2020 13:49:14 +0000
X-Zone-Loop: e9ac3f8f03b7a6dfa1f405db63b683fd5d3c8fc82ffa
X-Originating-IP: [168.235.111.26]
Received: from echo.mxrouting.net (echo.mxrouting.net [116.202.222.109])
 by filter003.mxroute.com (Postfix) with ESMTPS id 0FBD260035;
 Tue, 21 Jul 2020 13:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cagir.me;
 s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M8MtDOoNGNytWF8aNMY8cCtpnNfIolH30Knv/G0tweE=; b=AX/54i6Nxlg+3BOOf+bJlnq417
 vepI44Z5yBy5OEtllJPwBOzrHSP+Clbvg0OZFHmLVB9aER+UxkqM9Z3mq45VoXwdBoca4zst/qs47
 W6DJWNbuQYIUZTHdPoQD3M8kWYC7wJgsGh7xyINDXdV75jUOYnFW2p/6WcAzlPp1d1LERSFsf2KZc
 smKzmGrm4Y4wKdJLtN2hIxZYrESGvF+Nzoxh0IisKs8wFQdNnQMNwzvHWgsZVoKDS84yu9SktxVd5
 pkPfpYtA4WOToHCY9g5e31yZ/Q252p3IpmhvMnqvfwjYtBVzLmAERXYP1FbKozP0u+BakRYjkHnt0
 GbRoeH9Q==;
Subject: Re: MacOS IPv6 not functioning without custom static route
To: Adam Cooper <adam@acpr.dev>
Cc: wireguard@lists.zx2c4.com
References: <CAN00TTomuZoagZF2McBkDW1ZimSouN-jnDLm+Hq7OKeH-sF9zg@mail.gmail.com>
 <165a92238115e99b03740768d843a20f@cagir.me>
 <CAN00TTpNmGNuZcHc4aSRHaG26BmqbsdVLL4hYuArk+9RX3oVSQ@mail.gmail.com>
From: =?UTF-8?B?SGFzYW4gQmVya2F5IMOHYcSfxLFy?= <berkay@cagir.me>
Message-ID: <51bfa8c5-d433-d7db-ad42-026b9ced0478@cagir.me>
Date: Tue, 21 Jul 2020 15:49:12 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.0
MIME-Version: 1.0
In-Reply-To: <CAN00TTpNmGNuZcHc4aSRHaG26BmqbsdVLL4hYuArk+9RX3oVSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-AuthUser: berkay@cagir.me
X-Mailman-Approved-At: Tue, 21 Jul 2020 15:36:50 +0200
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

Are you sure that private IPs get routed through WG while AllowedIPs is 
"0.0.0.0/0, ::/1, 8000::/1"? I have just tried to ping my local router 
whilst connected to a tunnel with "0.0.0.0/0, ::/1, 8000::/1" and didn't 
have a problem.

I mean, the way which makes sense is that AllowedIPs should work with 
your configuration and we wouldn't even have this conversation, however 
there are some things awkwardly different on the MacOS version from the 
GNU/Linux versions of WG client(s), so I think it might help to try 
every variation.

Best,
Berkay

On 21.07.20 15:29, Adam Cooper wrote:
> Mmm. It looks like unticking "Exclude Private IPs" and entering
> "0.0.0.0/0, ::/1, 8000::/1" gives me a functional setup. Trouble is I
> don't want to route the private IPs and ticking the box (whilst
> retaining '::/1, 8000::/1') allows no traffic at all. There's
> something odd about the way the client is configuring routes but I've
> not got the expertise to figure it out :(
> 
> On Tue, 21 Jul 2020 at 14:12, Hasan Berkay Çağır <berkay@cagir.me> wrote:
>>
>> On 15/07/2020 14:14, Adam Cooper wrote:
>>> ...
>>> Probably worth mentioning that I tried to replace ::/0 with ::/1,
>>> 8000::/1 but that just results in completely broken connectivity in
>>> IPv6 and IPv4 - which may be another issue in and of itself.
>>
>> Did you try only having "::/1, 8000::/1" in the AllowedIPs option? I had
>> a default route creation issue myself where I'm only trying to tunnel
>> IPv6 through; and having this actually solved it.
>>
>> $ netstat -nr
>> Routing tables
>> Internet:
>> ...
>> Internet6:
>> Destination                             Gateway
>> Flags         Netif Expire
>> ::/1                                    link#14
>> UCS           utun2
>> default                                 fe80::%utun0
>> UGcI          utun0
>> default                                 fe80::%utun1
>> UGcI          utun1
>> default                                 fe80::%utun3
>> UGcI          utun3
>> default                                 [ public IPv6 ]
>> UGcI          utun2
>>
>> If just "::/1, 8000::/1" solves the IPv6 issue, I guess you can give it
>> a try with "0.0.0.0/0, ::/1, 8000::/1" to see if both routes are created
>> properly?
>>
>> Best,
>> Berkay
