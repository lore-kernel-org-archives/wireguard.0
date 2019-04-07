Return-Path: <SRS0=zPvC=SJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02159C10F0E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Apr 2019 10:38:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51CDB213F2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Apr 2019 10:38:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBFHzipv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51CDB213F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b50b3ca;
	Sun, 7 Apr 2019 10:35:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2d4c32a
 for <wireguard@lists.zx2c4.com>; Sun, 7 Apr 2019 10:35:08 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df4b8842
 for <wireguard@lists.zx2c4.com>; Sun, 7 Apr 2019 10:35:07 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id w15so11582110wmc.3
 for <wireguard@lists.zx2c4.com>; Sun, 07 Apr 2019 03:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HiAcJZU2DJUCRoD1zIxd9ndEkx7hE+ySkww209+tvQ4=;
 b=CBFHzipvNMuvWm4/FVsgFO50YeH0v0Nm0RJQLsnKM/cq9RpIXwTPZS6hBqm1k7AjZI
 G7SsF4rebJtvPzTVknLXLZZRf5BRlNe1YLfi0LFw+1LXmq3p7ovIYeZGesDW/CW4IkDn
 kIlA1ZdhnIL5YNE60I9oCCdpWXWXhHbkISYKXp2oJLObICIL6kzGQJwWQiFNCme30KuQ
 O2Ta9j1nw3JJktT3oodxTCYHAfyipuezvLhM/9wn/0dAEgvsF2qVZ7MuhE6I78kCdALA
 bxrmRZJESF4A3DDgmJy/qqlh9fVfA2bU/3qTuhHwmSuIU8ke19MKulG3OkAAT6u8K1CA
 O7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HiAcJZU2DJUCRoD1zIxd9ndEkx7hE+ySkww209+tvQ4=;
 b=LBYdJwR0yMhG9ouKyVWVhRe/bnBukTdAt72lA6FfbnOLyGB28Jy/aVnSU2Xvul3Ah+
 lILqS0gDl+D62i9fhzwv0l2DdAET1jVWUcHaw7odYsMMiNQguh6TUhLhTLoSZJaCJ0HW
 ytHZtpcD3fmCeix+YOZBqKPFnzgg+UyqwEkh5jYzOkNir246YPpgtKvtHnlPX8tiALYt
 XVzJJKcT4e1D9n9NRwttqisa76DHgNUVBgFHtUe2qpDlOYf4B1jRiigvAgu50YckneCH
 Fr3zfxlxdaYVX/H2NGToqOAGwtRMg9ZXfPhZB4tX5PROwhuanvqfDRf+/w7/wahxgwGh
 JayQ==
X-Gm-Message-State: APjAAAXRxDpAxYbk7MPWxIEEcYJz45DL7aEX6j3b6545AaTLGB9FmZ98
 VeZycdTOFeJ05lxSvTaQrjXYsPkeCOI=
X-Google-Smtp-Source: APXvYqx7ujeNl8yJJHAAvx6geDRBj1VkILnP24n6+GFKqAnJW8iXjmhXb22CBJg69PqjQ4ixwapX/g==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr13437824wmb.23.1554633460332; 
 Sun, 07 Apr 2019 03:37:40 -0700 (PDT)
Received: from ?IPv6:2003:c5:5f29:6e00:2289:84ff:fe70:d494?
 (p200300C55F296E00228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f29:6e00:2289:84ff:fe70:d494])
 by smtp.googlemail.com with ESMTPSA id b8sm24973350wrr.64.2019.04.07.03.37.39
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Apr 2019 03:37:39 -0700 (PDT)
Subject: Re: Multiple VPN connections on Android
To: mikma.wg@lists.m7n.se
References: <75dc1198-7727-f342-2756-a160f3f3f994@gmail.com>
 <911c5ed5-0bf8-80bb-cf15-7b2c6ee896fa@m7n.se>
From: Julian Orth <ju.orth@gmail.com>
Message-ID: <d46cbe36-887a-d7ab-4daa-3aea02b78e8c@gmail.com>
Date: Sun, 7 Apr 2019 12:37:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <911c5ed5-0bf8-80bb-cf15-7b2c6ee896fa@m7n.se>
Content-Language: en-US
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

On 3/26/19 8:49 PM, mikma.wg@lists.m7n.se wrote:>
> On 2019-03-26 15:17, Julian Orth wrote:
>> Hello list,
>>
>> I'm currently using WireGuard on Android for two purposes:
>>
>> 1. Routing all traffic via a commercial VPN provider to protect myself on
>>     open wireless networks.
>> 2. Connecting to my home network.
>>
>> Unfortunately WireGuard on Android does not allow me to do both of these
>> things at the same time. I assume this is because VpnService [1] only allows 1
>> VPN connection at a time.
>
> Can't you add the peer for your home network to the same configuration (tun
> device) as the peer for the commercial VPN provider? It seems a straight
> forward solution to me if you are okay with the IP addresses assigned by the
> VPN provider.

Using the same src IP is not going to work in my case. The VPN provider might
also assign me a new IP and then I might have to reconfigure my home network.
Not something I want to deal with.

But this would also require me to share the same public key between my home
network and the VPN provider. For some reason this does not feel right to me. On
the other hand, I use the same SSH key on multiple sites so maybe this feeling
is not justified.

My current provider allows me to generate the key pair locally and to only send
them the public key. If they insistet on generating the keys on their servers
and sending me the private key, then this solution would be impossible.

>
>>
>> Has any thought been put into emulating multiple tun devices in user space?
>
> I don't see why you would need multiple tun devices.

By "emulating multiple tun devices" I did not mean emulating all of the
functionality of tun devices. Packets are processed as follows right now:

1. Kernel chooses the correct route and device
2. Kernel sends the packet via the device
3. If the device is a wireguard tun device:
   a. Choose the peer and wrap the packet in a wireguard packet
   b. Goto 1 with the original packet replaced by the wrapped packet

What I suggest is emulating steps 1 and 2. An emulated tun devices would
therefore only have to consist of a set of assigned routes and an instance of
the wireguard core that implements step 3.

Let's say the Android app currently processes packets as follows:

void process(packet) {
    peer, packet := wireguard.process(packet);
    peer.udp_send(packet);
}

My suggestion is to change this as follows:

void process(packet) {
    seen_peers := { }; // a set
    while (true) {
        tap_dev := find_tap_dev(packet.dst);
        peer, packet := tap_dev.process(packet);
        if (seen_peers.contains(peer)) {
            // routing loop
            return;
        }
        seen_peers.add(peer);
        if (find_tap_dev(packet.dst) == null) {
            peer.udp_send(packet);
            return;
        }
    }
}

The Android tun device created via VpnService would then of course contain the
union of all routes of the emulated tun devices.

>                                                      It is possible to add
> multiple IPv4 and IPv6 addresses to the tun device, but there may be a problem
> with the source address selection. Linux allows specifying a preferred address
> for each route, but it isn't possible in the Android API AFAIK. If you have a
> rooted device then you can potentially update the routing tables with the
> preferred source address for each VPN route.

I don't think routing should be necessary for this. Afaik, other VPN apps
already support using multiple tunnels at once.

>
> /Mikma

PS: Your mail was classified as spam by gmail.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
