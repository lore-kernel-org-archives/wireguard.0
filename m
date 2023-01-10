Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C609C54EBC
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Jan 2023 00:40:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe8cad74;
	Thu, 12 Jan 2023 00:36:40 +0000 (UTC)
Received: from midgard.reox.at (midgard.reox.at [2a01:4f8:151:1288::2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7e465d1e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2023 09:44:45 +0000 (UTC)
Received: from 127.0.0.1 (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by midgard.reox.at (Postfix) with ESMTPSA id 2DA161200E6
 for <wireguard@lists.zx2c4.com>; Tue, 10 Jan 2023 10:44:44 +0100 (CET)
Message-ID: <fc9bde3b-2366-b9f2-3a90-aacf5890c9f4@reox.at>
Date: Tue, 10 Jan 2023 10:44:43 +0100
MIME-Version: 1.0
From: reox <mailinglist@reox.at>
Subject: Re: Connection hangs over CGNAT (Starlink)
Content-Language: en-GB
To: wireguard@lists.zx2c4.com
References: <CALGY4fuH9oXpa34nzyj+jc94sS+ZQ5MaJUktFJF2A2-p213vEQ@mail.gmail.com>
 <CA+hy6dtEXTG9wQJ0Cb=2iEgZd6bOpCghBinawgS5UPCQ+95sGA@mail.gmail.com>
In-Reply-To: <CA+hy6dtEXTG9wQJ0Cb=2iEgZd6bOpCghBinawgS5UPCQ+95sGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 12 Jan 2023 00:36:34 +0000
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

Interesting, because I was going to post a similar question here - but 
would not have thought about multi-network.
For me, this happens on my Android phone, where I use WG to route DNS 
traffic to my own server.
In some wifi networks, I get this issue that after some time (sometimes 
only minutes, sometimes hours), that for example K9mail is unable to 
fetch mails because it presumably runs into a DNS timeout (it cannot be 
a connection timeout to the mail server, because that is not routed via WG)
Toggling Wifi, switching to mobile network only, or toggling wireguard 
solves the issue.
I had this problem, however, also rarely in other wifis. Before that, I 
thought that the wifi network itself was the culprit, but as it happens 
also on other occasions, thus I thought it might be a combination of 
specific wifi setup and my server setup.
However, I have no idea how I could debug this, especially as DNS 
requests using termux and dig work flawlessly, even though at the same 
time k9mail hangs.
Using KeepAlive did not work so far.
I wanted to debug this further by running tcpdump on the server, but 
unfortunately, I have right now no wifi where I can trigger this bug 
reliably. In my own wifi, it happens every now and then - typically only 
once a month or less...

Best,
Sebastian

On 17.12.2022 23:15, Szymon Nowak wrote:
> I've noticed the same thing on a WIndows client, it happens when you
> provide internet from two sources, e.g. Wifi and mobile network or
> Wifi and LAN in case of computer, When one of these sources has a
> problem and internet is not available on it. Then Wireguard stops
> working even though it doesn't break the tunnel. Completely
> disconnecting the faulty connection and reconnecting the tunleu solves
> this problem. I don't know why they don't work even though the tunnel
> is connected
> 
> On Sat, Dec 17, 2022 at 11:05 PM Nikolay Martynov <mar.kolya@gmail.com> wrote:
>>
>> Hi!
>>
>> I'm experiencing strange behaviour with wireguard: from time to time
>> connection 'freezes'.
>> Most often I'm observing this on an Android phone when connected from
>> my home over Starlink.
>> Server: latest Openwrt, Client: latest Android app.
>> The connection establishes and works fine for some time. After some
>> time the client still shows connection is established, but no incoming
>> data is coming.
>> On a server side 'latest handshake' goes into hours/days.
>> The freeze happens randomly, for no apparent reason and I think only
>> over starlink. I do not think I have ever observed this problem on
>> cell networks.
>>
>> Reconnection solves the problem immediately.
>> I did some tcpdumping when the problem was present and found the following:
>> * Server side sees incoming traffic from the client and sends responses.
>> * On my own router connected to Starlink (i.e. interface between my
>> router and Starlink router) I see data going from the client to the
>> server - but no packets coming back.
>>
>> So my 'hypothesis' is that somehow Starlink's CGNAT 'forgets' one side
>> of the connection - and so data continues to go in one direction, but
>> it doesn't come back. The thing with the wireguard is that it looks
>> like it doesn't change the outgoing port when it attempts to do
>> another handshake. This means that it continues using the same 'half
>> broken' connection forever.
>>
>> I think the same happens to me at least once on a Linux client - but
>> the difference with the phone is that the phone is always on and
>> therefore the duration of the connection is much longer.
>>
>> I tried experimenting with keepalive messages - but it looks like they
>> make no difference. Once connection freezes I see keepalived arriving
>> onto the server, server sending reply - but that reply never arrives
>> to the client.
>>
>> It looks like the solution to this problem would be for the client to
>> use a different outgoing port when sending a handshake but I was not
>> able to find an option for that.
>>
>> Is this something that is possible to do?
>> Thanks!
>>
>>
>> --
>> Martynov Nikolay.
>> Email: mar.kolya@gmail.com
