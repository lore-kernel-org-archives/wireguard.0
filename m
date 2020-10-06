Return-Path: <SRS0=oTJ6=DN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE230C4363D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Oct 2020 13:54:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E4320760
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Oct 2020 13:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1E4320760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-free.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88fe68a3;
	Tue, 6 Oct 2020 13:21:38 +0000 (UTC)
Received: from s2.spam-free.eu (s2.spam-free.eu [195.5.121.125])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 15e279a8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2020 13:21:36 +0000 (UTC)
Received: from [192.168.129.206]
 (dslb-002-204-084-239.002.204.pools.vodafone-ip.de [2.204.84.239])
 by s2.spam-free.eu (Postfix) with ESMTPSA id 7B8AB1C39A0;
 Tue,  6 Oct 2020 15:54:04 +0200 (CEST)
Subject: Re: wg-quick up (on linux) fails in case of several default routes
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
References: <mailman.0.1601114111.20018.wireguard@lists.zx2c4.com>
 <ebc8ff04-a073-13a8-2f80-a5cf01ab8416@spam-free.eu>
 <CAHmME9qUWGbuSasA+xxoJO+ycog9+S6TPW9aPF8fFDkgaQDP3g@mail.gmail.com>
 <79a4e995-763c-9724-02b7-81da87c0f88a@spam-free.eu>
 <CAHmME9pYFjNC+g85BNaaYUsVp9h5mxrGtGZwvZ-WRrSxXEHNgA@mail.gmail.com>
From: Chris <wireguard@spam-free.eu>
Message-ID: <413570f5-1761-2864-65c8-706a9858d491@spam-free.eu>
Date: Tue, 6 Oct 2020 15:54:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9pYFjNC+g85BNaaYUsVp9h5mxrGtGZwvZ-WRrSxXEHNgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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

Oh, this is veeery suprising, I did not expect that:
It is the standard recent ubuntu repo:

*************************
dpkg -S `which wg-quick`
wireguard-tools: /usr/bin/wg-quick

apt-cache policy wireguard-tools
wireguard-tools:
   Installed: 1.0.20200513-1~20.04.2
   Candidate: 1.0.20200513-1~20.04.2
   Version table:
  *** 1.0.20200513-1~20.04.2 500
         500 http://archive.ubuntu.com/ubuntu focal-updates/universe amd64 Packages
         100 /var/lib/dpkg/status
      1.0.20200319-1ubuntu1 500
         500 http://archive.ubuntu.com/ubuntu focal/universe amd64 Packages
**************************


On 06/10/2020 15:47, Jason A. Donenfeld wrote:
> On 10/6/20, Chris <wireguard@spam-free.eu> wrote:
>> Hello Jason,
>>
>> setup is
>> two default routes with diffenrent metrics (the second being the failover in
>>
>> case the lower metric connection goes down).
>> For good reasons wg-quick will setup an individual route to the wg server
>> (for
>> the possibility of changing th default route afterwards).
>> However wg-quick fails:
>>
>> ******log follows***********
>> wg-quick up wg_client
>> [#] ip link add wg_client type wireguard
>> [#] wg setconf wg_client /dev/fd/63
>> [#] ip -4 address add 10.0.129.200/24 dev wg_client
>> [#] ip link set mtu 1420 up dev wg_client
>> [#] GATEW=$(ip route list 0.0.0.0/0|sed -n 's/.* via \(.*\)
>> dev.*/\1/p');route
>> add s1.spam-free.eu gw $GATEW
>> SIOCADDRT: No such device
> Where did you get your wg-quick? I would never name a variable 'GATEW'
> or print out an expression like that to the console. IOW, I don't
> recognize what's happening here because this doesn't seem to be code
> I've shipped.
>
>
>> [#] ip link delete dev wg_client
>> ******log  end  ***********
>>
>> The point is, that GATEW is NOT a single address but rather a list of ip
>> addresses and the command setting the route fails.
>>
>> Instead one should always run through ALL default gateways and set
>> individual
>> routes to the server through ALL the default gateways with the same metric
>> as
>> the respective default route.
>> This will then also work in case the failover route is in operation.
>>
>> Of course, tearing down the client should delete ALL individual routes to
>> the
>> server.
>> Hope this clarifies is a bit.
>>
>> Cheers,
>> Chris
>>
>> On 06/10/2020 14:20, Jason A. Donenfeld wrote:
>>> On Mon, Oct 5, 2020 at 3:51 PM Chris <wireguard@spam-free.eu> wrote:
>>>> wg-quick tries to set the route to the wg server through the default
>>>> gateway.
>>> On Linux? It shouldn't be iterating default gateways at all, but
>>> rather using suppress_prefix. Can you provide more technical
>>> information about what you're seeing and maybe a patch to fix the
>>> issue?
>>>
>>> Jason

