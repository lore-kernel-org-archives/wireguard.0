Return-Path: neumann@cgws.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7fd803e
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 May 2018 19:26:39 +0000 (UTC)
Received: from mail.dabax.net (mail.dabax.net [88.99.12.75])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa1d7eb9
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 May 2018 19:26:38 +0000 (UTC)
Subject: Re: Need for HW-clock independent timestamps
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
From: Axel Neumann <neumann@cgws.de>
Message-ID: <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
Date: Sat, 12 May 2018 21:29:24 +0200
MIME-Version: 1.0
In-Reply-To: <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: neumann@cgws.de
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Thanks a lot for your replies. But as you can see from my comments below
this all does not look like a valid option for many embedded use cases.
BTW, my background are community mesh networks which are maintained by
all kind of different individuals using a zoo of different device types.

I would really appreciate if WG can further elaborate on this issue.
There are many real-life communities with embedded-device deployments
that would be looking forward to use WG.

Could you also comment on the described approach (see again at the end
of the mail) of allowing (maybe as an alternative) a sequence number
instead of a timestamp?


More inline below...

On 12.05.2018 00:45, Kalin KOZHUHAROV wrote:
> On Sat, May 12, 2018 at 12:07 AM, Axel Neumann <neumann@cgws.de> wrote:
>> We have the following chicken-egg problem:
>> We are using WG on openwrt devices which do not have a hardware clock so
>> that time is resetted after each reboot.
>> Because internet access shall be routed via WG tunnels the internet and
>> network-time services (NTP) is not available unless WG works properly.
>> But, guess, to reconnect, WG needs a greater time than before it
>> rebooted :-(
>>
>> I heard that a suggested solution is to periodically save the current
>> time to filesystem and then fix it during boot based on the last saved
>> one. But all embedded devices use flash memory with a limited amount
>> (about 10^5) of write cycles before they become unstable which would
>> destroy the flash within weeks.
>>
> Good/Hard problem!
> 
>> Any ideas how to circumvent this problem?
>>
> I only see 2 ways:
> * hardware: add a cheap RTC (best), or storage (USB, SD)

That is not convenient. People buy standard devices, often for outdoor,
which can not easily be extended with extra storage.

> * policy: add exception for ntpdate on base UDP (not WG) (or have
> dedicated server/s for that, which you control).

You want WG to secure your network. So the suggestion can not be to open
your network for a pretty insecure deamon in order to get WG working.
This would essentially allow attackers to a fake the ntp server and then
block WG forever.

> 
> BTW, while flash write cycles are indeed limited, you are writing a
> very small data (that causes a single block to be rewritten).
> So a device with say 32 MB(8000 x 4K blocks) will last about 9000
> years if you write one block once per hour until 10% (=800) of its
> cells are past 10^5 writes.
> (or 3 years if you write once per second!)
> But my knowledge says 10^3-10^4 write cycles (so still 90-900 years for 1/hour).

Actually, many devices have only 8MB flash (some only 4MB almost
entirely used) and from this there is only few space left. So the blocks
used for storing can not be cycled as much as you suggest. And time
should not be saved 1/hour because nobody wants to wait an hour after a
reboot to let his connectivity recover. Such effects would likely cause
users to do any kind of panic-like rescue measures which usually hits
security first. So again, I don't think its a way to go.

> 
> If you have a large number of devices of the same hardware, 

Community networks don't !

> I'd
> suggest a "kill test" of one of them, by rewriting its flash. You can

I do not understand this. Could you explain in more detail?

> further use specific file-systems optimized for NAND/NOR flash.

I think openwrt already does a lot to optimize this. Still it would not
solve but only mitigate the problem.



On 12.05.2018 00:07, Axel Neumann wrote:
> As a remark, BMX7 is doing it the following way:
> Instead of using timestamps to protect against replay attacks the
> approach is to use just an always increasing integer (sqn), for each new
> signature (from the WG white paper I understand that that should be
> possible). Sqn Jumps, as long as they are just increasing the sqn, are
fine.
> Now, to save the sqn over reboot it is read from filesystem as
> current_sqn during boot and immediately saved as
> save_sqn=current_sqn+100000 and then only be re-saved (again as new
> current_sqn+100000) when the last used current_sqn equals the last saved
> save_sqn. This way, jumps of at most 100000 occur only in case of node
> reboots. But as such jumps are harmless anyway its ok. And with a
> 48-bit-timestamp field it would still survive 28^9 reboots till the
> timestamp reaches end-of-life. Of course the 100000 is debatable as I do
> not know how much DH-based connection attempts may happen over a day or
> week. But given that no more than one sqn save occurs in average per day
> the flash lifetime could already be increased significantly.


Thanks a lot
/Axel
