Return-Path: viisauksena@posteo.de
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5847b891
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 23:49:32 +0000 (UTC)
Received: from dovecot03.posteo.de (dovecot03.posteo.de [172.16.0.13])
 by mout01.posteo.de (Postfix) with ESMTPS id D91D420925
 for <wireguard@lists.zx2c4.com>; Tue,  5 Jul 2016 01:52:51 +0200 (CEST)
Received: from mail.posteo.de (localhost [127.0.0.1])
 by dovecot03.posteo.de (Postfix) with ESMTPSA id 3rk3jZ653qz5vMK
 for <wireguard@lists.zx2c4.com>; Tue,  5 Jul 2016 01:52:50 +0200 (CEST)
References: <20160704225300.GC9424@c3po>
 <CAHmME9r33BJHwbx2G-ANf02+ED4TJOs_Go+Ad3xoCX9L8DJY0g@mail.gmail.com>
From: Jens Viisauksena <viisauksena@posteo.de>
To: wireguard@lists.zx2c4.com
Message-ID: <829db05d-422d-4573-a7f5-d1beff657160@posteo.de>
Date: Tue, 5 Jul 2016 01:50:34 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9r33BJHwbx2G-ANf02+ED4TJOs_Go+Ad3xoCX9L8DJY0g@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Subject: Re: [WireGuard] wireguard on gentoo (4.6.3)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 05.07.2016 01:45, Jason A. Donenfeld wrote:
> Your kernel is missing CONFIG_NET_UDP_TUNNEL. For instructions on how

i was sitting right next to him - while i installed it on debian 4.4.6
kernel quiet easy.

we have done all the stuff mentioned, but with his 4.6.3 kernel some of
the namespaces changes slightly - thats what we guessed.
we tryd to build it as module and to build it fix inside kernel -
everytime with reboot - just in case.

the ebuild (ebuild net-misc/wireguard-0.0.20160630 ) runs smoothly with
all the hints from install page, so building was successfull but a
modprobe failed.

maybe he describe this in a deeper way way tomorrow , but if you have a
hint beyond that, that would be awesome

thx, greetz - jens
