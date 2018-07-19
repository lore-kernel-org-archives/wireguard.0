Return-Path: stunnel@attglobal.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ceb424ea
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Jul 2018 00:23:17 +0000 (UTC)
Received: from dnvrco-cmomta02.email.rr.com (dnvrco-outbound-snat.email.rr.com
 [107.14.73.232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5bf681c
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Jul 2018 00:23:17 +0000 (UTC)
Subject: Re: Should wg-quick with SaveConfig accumulate IPv6 link-local
 addresses
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <2e6b4759-1acd-ddd3-2471-14ce932ac82a@attglobal.net>
 <4T5B-J-USwNbZveJ1mRtq4Mh9Ih8P2yAgR-uqecHysgG0JEw4GpUZwpWRAo8I5WdUihhGnot-qByAePKl7_xiA==@protonmail.ch>
From: Eddie <stunnel@attglobal.net>
Message-ID: <c430b4be-fc84-40c3-c9d2-5d5833d8ae89@attglobal.net>
Date: Wed, 18 Jul 2018 17:31:39 -0700
MIME-Version: 1.0
In-Reply-To: <4T5B-J-USwNbZveJ1mRtq4Mh9Ih8P2yAgR-uqecHysgG0JEw4GpUZwpWRAo8I5WdUihhGnot-qByAePKl7_xiA==@protonmail.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Reply-To: stunnel@attglobal.net
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Yeah, Network Manager is installed.

And I'm guessing that it's a different address each time, because the 
(fake) MAC address is random.

Cheers.


On 7/14/2018 11:02 AM, jugs wrote:
> I don't get an IPv6 link local address address on my wg interface. Do you use network manager?
>
>
> ​-jugs​
>
> ‐‐‐‐‐‐‐ Original Message ‐‐‐‐‐‐‐
>
> On July 10, 2018 10:20 PM, Eddie <stunnel@attglobal.net> wrote:
>
>> ​​
>>
>> Not sure if this is intended behaviour, or not.
>>
>> Every time I start an interface using wg-quick with the SaveConfig =
>>
>> true it reloads all the previous, saved, IPv6 link-local addresses plus
>>
>> generates a new one.  So the first time the interface is started there
>>
>> is 1 link-local address.  The next time, 2.  Then 3. Then 4, etc. etc.
>>
>> Cheers.
>>
>> WireGuard mailing list
>>
>> WireGuard@lists.zx2c4.com
>>
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
>
