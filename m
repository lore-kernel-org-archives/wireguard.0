Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A7CC64EC4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 17:03:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28f5abe1;
	Sun, 19 Feb 2023 17:03:05 +0000 (UTC)
Received: from mail.as41281.net (mail.as41281.net [2a0f:df00:0:300::109])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b8379df1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 16:54:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ABF90161AAD
 for <wireguard@lists.zx2c4.com>; Sun, 19 Feb 2023 17:54:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keff.org; s=dkim;
 t=1676825670; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=P7dyiCeg1soKSo1FBukZpXucfKX2T69MAJgBCWLHNNs=;
 b=D/ApZIAelAE2R7mvbgdLNp1iZb1R1ec1pCEaqIj491u4qE04tgkNIajP5js+kbq2C1aja6
 sdwSRm9h/1MLSTzHPv8Dmcbl1mkjRgnN/XNEwKtbz4xguHSKKakk3bfXHF1CYIsdtldX73
 RpE0fuo339oXVo3XcEUhm57pNCDpgTk=
Message-ID: <00b94fdf-22d5-00ad-e068-30ad4a453236@keff.org>
Date: Sun, 19 Feb 2023 23:54:10 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:110.0) Gecko/20100101
 Thunderbird/110.0
Subject: Re: Source IP incorrect on multi homed systems
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch> <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
From: Sebastian Hyrvall <sh@keff.org>
In-Reply-To: <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Sun, 19 Feb 2023 17:02:58 +0000
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

You should get into that debate. Proposing firewall workarounds is not a 
correct solution so please don't do it. It needs to be fixed. It's an 
immature VPN solution that always just proposed a workaround instead of 
fixing the problem. It seems to be designed by people that are good at 
software and cryptography but has no clue about networking stacks.

On 2023-02-19 23:32, David Kerr wrote:
> Without getting into the debate of whether wireguard is acting
> correctly or not, I think there is a possible workaround.
>
> 1. In the iptables mangle table PREROUTING, match the incoming
> interface and destination address and --set-xmark a firewall MARK
> unique to this interface/destination
> 2. Create a new ip route table that sets the default route to go out
> on the interface with the source address you want (same as destination
> address in iptables)
> 3. Create a new ip rule that sends all packets with firewall mark set
> in iptables to the routing table you just created
>
> Repeat above for each interface/address you need to mangle, with a
> unique firewall mark and routing table for each.
>
> It may be necessary to use CONNMARK in PREROUTING and OUTPUT to
> --restore_mark.  I can't remember if this is needed or not, its been a
> while since I configured iptables with this.
>
> This should ensure that any packet that comes into an
> interface/address is replied to from the same interface/address.
>
> David
>
>
> On Sun, Feb 19, 2023 at 9:44 AM Christoph Loesch <wireguard-mail@chil.at> wrote:
>> Hi,
>>
>> I don't think no one wants to fix it, there are several users having this issue. I rather guess no one could find a suitable solution to fix it.
>>
>> @Nico: did you try to delete the affected route and add it again with the correct source IP ?
>>
>> as I mentioned it in https://lists.zx2c4.com/pipermail/wireguard/2021-November/007324.html
>>
>> ip route del <NET>
>> ip route add <NET> dev <ALIAS_DEV> src <SRC_IP>
>>
>> This way I was able to (at least temporary) fix this issue on multi homed systems.
>>
>> Kind regards,
>> Christoph
>>
>> Am 19.02.2023 um 13:13 schrieb Nico Schottelius:
>>> Hey Sebastian,
>>>
>>> Sebastian Hyrwall <sh@keff.org> writes:
>>>
>>>> It is kinda. It's been mentioned multiple times over the years but no one seems to want to fix it. Atleast you should be able to specify bind/src ip in the
>>>> config. I gave up WG because of it. Wasn't accepted by my projects security policy since src ip could not be configured.
>>>>
>>>> There is an unofficial patch however,
>>>>
>>>> https://github.com/torvalds/linux/commit/5fa98082093344c86345f9f63305cae9d5f9f281
>>> the binding is somewhat related to this issue and I was looking for that
>>> feature some time ago, too. While it is correlated and I would really
>>> appreciate binding support, I am not sure whether the linked patch does
>>> actually fix the problem I am seeing in multi homed devices.
>>>
>>> As long as wireguard does not reply with the same IP address it was
>>> contacted with, packets will get dropped on stateful firewalls, because
>>> the returning packet does not match the state session database.
>>>
>>> Best regards,
>>>
>>> Nico
>>>
>>> --
>>> Sustainable and modern Infrastructures by ungleich.ch
