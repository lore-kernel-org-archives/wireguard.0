Return-Path: <SRS0=g8VQ=JF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370F2C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Apr 2021 08:49:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC71E6113A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Apr 2021 08:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC71E6113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd9d92b0;
	Thu, 8 Apr 2021 08:47:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 01df3c4b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Apr 2021 08:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Message-ID:From:CC:To:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=gsWrGuL7JlgEHjWn2OEVuvqkqPeWhxotOUPBquHCkhg=; b=WsH13v8VwakTn6bIuKiBF4BVGq
 w0VbDFjompPoWT9+ymVG1Q/meZepzd8BD5Dltk6WqH6O7uyZ5/r33FKkYo7rDd7wcNI477u+sOP55
 RXagOjiV9buYe2U8CwrubzQ/jPgPaGCmwnLtiTE/77f2f1hUxjePasIAty6wMxqfrZi92iYHocXe0
 R3RxYMUWG4wvMp5T5zukFJovG3/zR3U27V+9IK8+ZtskbT/Ui266KqPXOcd6e1YUPd5IdvnFt6H13
 EE9u3a26gXcJ8/2nbA3WdOGvPaifKe6Uh3saxBOdn+Nae+Fec1Xuim+4E6B4rupGJxZZSGIa4j/+4
 6RirPXmQ==;
Received: from [2a01:4c8:1074:a3c8:59e:d8eb:a298:2095]
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lUQJS-007NSQ-QQ; Thu, 08 Apr 2021 08:46:55 +0000
Date: Thu, 08 Apr 2021 09:46:43 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <CAOw_LSEasJuHDPXGkVQnYh_aHd+nOY53D0LRUXuH+pN45ynz2w@mail.gmail.com>
References: <e166447dac58ecaa73bf3f6a2b9bece6a01bf5cd.camel@infradead.org>
 <CAHmME9q-qw=sCxz6Fije+ENQTY2-GdS4bZLSakuh+6Eze4LR3w@mail.gmail.com>
 <CAOw_LSEasJuHDPXGkVQnYh_aHd+nOY53D0LRUXuH+pN45ynz2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: Duplicate IP address, and permissions problems on Windows
To: Daniel Lenski <dlenski@gmail.com>,"Jason A. Donenfeld" <Jason@zx2c4.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: David Woodhouse <dwmw2@infradead.org>
Message-ID: <5D336E0F-1A42-4692-8597-6A035C4FA699@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
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



On 8 April 2021 00:00:46 BST, Daniel Lenski <dlenski@gmail=2Ecom> wrote:
>On Tue, Apr 6, 2021 at 5:17 PM Jason A=2E Donenfeld <Jason@zx2c4=2Ecom>
>wrote:
>> It's pretty typical behavior on Windows for IP addresses to be
>> exclusive per interface=2E WireGuard for Windows does something
>similar:
>>
>https://git=2Ezx2c4=2Ecom/wireguard-windows/tree/tunnel/addressconfig=2Eg=
o#n22
>
>Thank you! That's very interesting=2E
>
>Following David's initial implementation, I wrote something for
>OpenConnect that's pretty much the same as yours:
>https://gitlab=2Ecom/openconnect/openconnect/-/compare/5e6e9b850756157164=
f83cd4fedafb747fbbd50f=2E=2E=2E0bca5b32ac478b5d03b6e88f96bf29c6556610a5
>
>1=2E Uses GetAdaptersAddresses to list all the addresses
>2=2E If/when it finds a clashing address, it uses
>GetUnicastIpAddressTable to determine the up/down state of the other
>interface
>3=2E Only delete the address from the other interface if it's non-UP=2E
>
>I was also annoyed that the GetAdaptersAddresses return structure
>doesn't provide the adapter state, and that I had to go for this
>convoluted O(n^2) design=2E
>
>I guess this reassures me that there isn't an obviously-better way to
>do it=2E

Unless netsh will do it for us when we ask *it* to set the IP address? Ope=
nConnect doesn't normally bother itself with administrivia like setting IP =
addresses; its job is to pass packets=2E

When I first wrote it, I just usurped the vpnc-script from vpnc which does=
 all the routing/DNS/etc configuration for every platform under the sun, so=
 all we do generally in OpenConnect is set the environment variables up and=
 spawn the script=2E

The only reason we ever set a Legacy IP directly in C for Tap-Windows was =
to make it do all the fake ARP nonsense correctly=2E (And ISTR we didn't ne=
ed to do anything for IPv6 as it just needs to use a known lladdr as the ro=
ute gw)=2E We don't need that with Wintun=2E

I preserved it in the first cut of Wintun support because the existing vpn=
c-script for Windows actually depends on it=2E=2E=2E but purely for waiting=
 for the interface to come up=2E Can we ditch that, let the script set the =
address for us, and forget we ever saw that O(n=C2=B2) code because netsh h=
andles the conflicting interfaces for us?



--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
