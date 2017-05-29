Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f42e321
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 20:41:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53c7fac0
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 20:41:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ff9234e
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 20:52:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0595119a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 20:52:41 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id h4so89728627oib.3
 for <wireguard@lists.zx2c4.com>; Mon, 29 May 2017 13:54:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACTq0bRv6KcKCvw3iYnkeFU+vvr0WTgHU5nT=TskYQ7F5NodmA@mail.gmail.com>
References: <CACTq0bRv6KcKCvw3iYnkeFU+vvr0WTgHU5nT=TskYQ7F5NodmA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 29 May 2017 22:54:10 +0200
Message-ID: <CAHmME9rzL8ZRb0zpOFXp2i_3eGsWaMSm=MQ2ODyYOs+vAxpz_Q@mail.gmail.com>
Subject: Re: Multiple peers to one wireguard "server"
To: Ibrahim Tachijian <barhom@netsat.se>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Ibrahim,

On Mon, May 29, 2017 at 10:31 PM, Ibrahim Tachijian <barhom@netsat.se> wrote:
> If I understand correctly if I need to connect 10 different wg "clients" to
> one wg "server" I will require one wgX interface per-client on the "server".
>
> Is this correct? Does this mean also that each wgX interface on the "server"
> needs to listen on its own UDP port or can the "server" reuse the same UDP
> port?

No. Each WireGuard interface may have multiple peers:

           [Interface]
           PrivateKey = yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=
           ListenPort = 51820

           [Peer]
           PublicKey = xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=
           Endpoint = 192.95.5.67:1234
           AllowedIPs = 10.192.122.3/32, 10.192.124.1/24

           [Peer]
           PublicKey = TrMvSoP4jYQlY6RIzBgbssQqY3vxI2Pi+y71lOWWXX0=
           Endpoint = [2607:5300:60:6b0::c05f:543]:2468
           AllowedIPs = 10.192.122.4/32, 192.168.0.0/16

           [Peer]
           PublicKey = gN65BkIKy1eCE9pP1wdc8ROUtkHLF2PfAqYdyYBz6EA=
           Endpoint = test.wireguard.io:18981
           AllowedIPs = 10.10.10.230/32

Please see the man page wg(8) or the front page of the website --
www.wireguard.io -- for more details.

Regards,
Jason
