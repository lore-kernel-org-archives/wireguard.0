Return-Path: mathias@hall-andersen.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50b76aa9
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 19:16:20 +0000 (UTC)
Received: from mailrelay4-2.pub.mailoutpod1-cph3.one.com
 (mailrelay4-2.pub.mailoutpod1-cph3.one.com [46.30.212.3])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8249f371
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 19:16:20 +0000 (UTC)
Subject: Re: [PATCH 7/7] tun_darwin: adapt to TUNDevice interface change
To: Simon Ruderich <simon@ruderich.org>
References: <cover.1514726309.git.simon@ruderich.org>
 <33cfb3925304d5047a6e9e81eef0900329aad3b5.1514726309.git.simon@ruderich.org>
From: Mathias Hall-Andersen <mathias@hall-andersen.dk>
Message-ID: <510f63e7-e50a-46a1-b2d8-ea49ae5f2fc8@hall-andersen.dk>
Date: Sun, 31 Dec 2017 20:17:58 +0100
MIME-Version: 1.0
In-Reply-To: <33cfb3925304d5047a6e9e81eef0900329aad3b5.1514726309.git.simon@ruderich.org>
Content-Type: text/plain; charset=utf-8
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Simon

Thanks for your patches!

I am still fixing the interface up / down semantics (stopping / starting
peer timers and routines not needed when the interface is down).
I hope to fix this and merge your linux code in the next couple of days.
This should bring us very close to a usable linux client.

I will look at your OSX code when I have access to an OSX machine.

On Windows, we preferably want to move away from the OpenVPN driver
horrer show altogether.

Once again, thanks for the patch set.

Best Regards & A happy new year
Mathias Hall-Andersen
