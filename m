Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f4d6ba2
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 14:56:52 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 5d46ec6c
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 14:56:52 +0000 (UTC)
Date: Mon, 21 May 2018 09:56:18 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Matthias Urlichs <matthias@urlichs.de>
Subject: Re: WG: Need for HW-clock independent timestamps
Message-ID: <20180521145618.GA3199@wolff.to>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <403fa228-40e5-cbe4-4135-15b71cf76553@cgws.de>
 <20180521112235.v2ksniasmd36kern@ghostArch.localdomain>
 <97874cad-ac60-5a88-a384-f036f9688668@cgws.de>
 <20180521123558.qemdunuwgr4u7gsj@ghostArch.localdomain>
 <8fc246f8-7662-2fd2-f6ee-93d6802a37f0@urlichs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <8fc246f8-7662-2fd2-f6ee-93d6802a37f0@urlichs.de>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, May 21, 2018 at 15:53:10 +0200,
  Matthias Urlichs <matthias@urlichs.de> wrote:
>On 21.05.2018 14:35, Reto Brunner wrote:
>> If you just want a single write cycle, then you loose the ability to graceful
>> handle unexpected shutdowns.
>Why?
>> Even if you increment the counter by 10'000 when restoring it, who's to
>> say the device hasn't been running for several weeks before the
>> unexpected power cycle happened?
>
>So increment the counter by a trillion instead. It's large enough and
>you're not going to send a trillion packets before the next reboot.

If you want to go that route, you should just treat it as a two part number. 
One for a boot count, that would get incremented every boot and saved and 
a low order part that is reset to 0 at every boot. Note that this scheme 
leaks information to the peer.
