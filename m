Return-Path: jugs@protonmail.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d39d5349
 for <wireguard@lists.zx2c4.com>; Thu, 8 Feb 2018 19:08:20 +0000 (UTC)
Received: from mail3.protonmail.ch (mail3.protonmail.ch [185.70.40.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id edaed875
 for <wireguard@lists.zx2c4.com>; Thu, 8 Feb 2018 19:08:20 +0000 (UTC)
Date: Thu, 08 Feb 2018 14:14:18 -0500
From: jugs <jugs@protonmail.ch>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: wg-quick systemd service does not work directly after boot
Message-ID: <5KOTFDe17sagyWs3-jk_vBjCoyO5MvpXPA5Dyp6wjGl8EuDcki0nfOUxFbFpM4aPzeI93mpIdHaACKCUdB3CGQ==@protonmail.ch>
In-Reply-To: <3e901b97-c67f-728b-332b-b301bb466dba@urlichs.de>
References: <d2debbc5-fc31-2671-6790-0f33194b146f@posteo.de>
 <3e901b97-c67f-728b-332b-b301bb466dba@urlichs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: jugs <jugs@protonmail.ch>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Or just use the IP address in the config?

=E2=80=8B-jugs

=E2=80=8B

-------- Original Message --------
 On February 7, 2018 1:06 PM, Matthias Urlichs <matthias@urlichs.de> wrote:

>On 07.02.2018 12:54, Mytril wrote:
>>The interface cannot resolve the dynamic domain, because the internet
>> connection is not established at this moment.
>>But i have also only a workaround to create wg0. I also start the wg at
>> a later time.
>>So i think this is not a bug, but rather a problem with the order of
>> network connection startup.
>>
>Right. There cannot be a "correct" way of ordering wireguard vs. other
> interfaces that works in all circumstances.
>
> However, instead of sleeping, a dependency on network-online.target
> might be more appropriate if wireguard needs to resolve a name.
>
>
>-- Matthias Urlichs
>
>
>WireGuard mailing list
>WireGuard@lists.zx2c4.com
>https://lists.zx2c4.com/mailman/listinfo/wireguard
>
