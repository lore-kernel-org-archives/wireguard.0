Return-Path: neumann@cgws.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd5a4216
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 12:30:37 +0000 (UTC)
Received: from mail.dabax.net (mail.dabax.net [88.99.12.75])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c969f667
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 12:30:37 +0000 (UTC)
Subject: Re: WG: Need for HW-clock independent timestamps
From: Axel Neumann <neumann@cgws.de>
To: wireguard@lists.zx2c4.com
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <403fa228-40e5-cbe4-4135-15b71cf76553@cgws.de>
 <20180521112235.v2ksniasmd36kern@ghostArch.localdomain>
 <97874cad-ac60-5a88-a384-f036f9688668@cgws.de>
Message-ID: <53200162-b2fa-8f32-c52a-aae5a15b1605@cgws.de>
Date: Mon, 21 May 2018 14:31:32 +0200
MIME-Version: 1.0
In-Reply-To: <97874cad-ac60-5a88-a384-f036f9688668@cgws.de>
Content-Type: text/plain; charset=utf-8
Reply-To: neumann@cgws.de
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 21.05.2018 13:52, Axel Neumann wrote:
> On 21.05.2018 13:22, Reto Brunner wrote:
>> On Mon, May 21, 2018 at 12:07:38PM +0200, Axel Neumann wrote:
>>> entirely superfluous. As discussed earlier [3] it can be achieved with
>>> essentially one file-system write operation each boot.
>>
>> You might as well achieve the same with the timestamp.
>> Just add a pre-shutdown hook, which touches a file.
> 
> yes, can be an option, but would only work in "normal" soft-shut-down
> cases, not in case of a hard reset or power cycle. A not-so-uncommon
> scenario for embedded home-network devices and community-network
> deployments. Especially when considering the first choice of a  normal
> user (desperately trying to fix its internet-via-WG tunnel connection):
> Power cycle the device.
> 
> /axel
> 
>> Restore the system clock to this upon boot (which may very well be off
>> but who cares).
>>
>> After the wg tunnel is back up, sync with any NTP server you trust and you
>> are back up and running.
>>
>> What is the advantage of doing it with a counter?
>> I fail to see the benefit.

Sorry, forgot to reply here: The advantage is that
you could save a counter value in advance that is to-be-used after the
NEXT reboot. It can be saved during boot or before WG starts (not during
shut-down), so you are safe against unexpected hard resets.

The (WG) boot procedure would be:
1) Read saved_counter from disk (take zero first time) and memorize it
as current_counter.
2) Write saved_counter + NextBootOffset to disk.
3) Use and incremented current_counter by +1 with each new WG handshake.

Considering NextBootOffset = (2^16 * 10^9):
With 1 WG handshake per ms the NextBootOffset would be exhausted every
~1800 years.
With 1 system reboot every ms the total 96bits counter range would
overlap in ~9000 years.

/axel





>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 
