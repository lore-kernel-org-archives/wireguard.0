Return-Path: mathias@hall-andersen.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aba76b64
 for <wireguard@lists.zx2c4.com>; Wed, 8 Nov 2017 17:40:41 +0000 (UTC)
Received: from mailrelay4-2.pub.mailoutpod1-cph3.one.com
 (mailrelay4-2.pub.mailoutpod1-cph3.one.com [46.30.212.3])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17f39a1a
 for <wireguard@lists.zx2c4.com>; Wed, 8 Nov 2017 17:40:41 +0000 (UTC)
Subject: Re: WireGuard root-less support for android
To: =?UTF-8?Q?Aur=c3=a9lien_Chabot?= <aurelien@chabot.fr>
References: <20171107043817.9050-1-aurelien@chabot.fr>
From: Mathias Hall-Andersen <mathias@hall-andersen.dk>
Message-ID: <68455df5-a429-09aa-308d-fc3615557530@hall-andersen.dk>
Date: Wed, 8 Nov 2017 18:44:01 +0100
MIME-Version: 1.0
In-Reply-To: <20171107043817.9050-1-aurelien@chabot.fr>
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

Hi Aurélien

Thanks for contributing to the wireguard-go project.

I never anticipated for the implementation to be used as a library.
This means that I either have to:

1. Settle for an API and reconsider what is exported and not.
2. Give no guarantees about API stability

Providing the functionality as a library might be the cleanest solution
in this case.
One option is to have an internal package and a small exported API.

Is the GetUDPConn only used to wait for the device to bind?

The missing device.tun.device.Close() is indeed a bug.

I will look more at your patches during the weekend,
Thanks once again.

Mathias
