Return-Path: stromberg@mullvad.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93854adc
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Apr 2017 11:09:53 +0000 (UTC)
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37c3edb6
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Apr 2017 11:09:53 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id u65so19654886wmu.1
 for <wireguard@lists.zx2c4.com>; Tue, 25 Apr 2017 04:18:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <193CB6CC-DC39-482E-9050-4106262C1260@onebillion.org>
References: <193CB6CC-DC39-482E-9050-4106262C1260@onebillion.org>
From: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Date: Tue, 25 Apr 2017 13:18:30 +0200
Message-ID: <CANTUoecSYvqbpBRy4Bt+fiS2MjEdxTnOF0EkvQJQBz1a1ag2+w@mail.gmail.com>
Subject: Re: Client / Server help
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Apr 25, 2017 at 12:48 PM, Jamie Stuart <jamie@onebillion.org> wrote=
:
> Hi,
> I=E2=80=99d like to trial transitioning our VPN system to WireGuard.
> We currently have an Ubuntu server running OpenVPN with many ( > 50) clie=
nts (running OpenWRT) connecting to it periodically. Clients get addresses =
via DHCP from the server.
> How would I go about transitioning this architecture to Wireguard? Note I=
 have wg on both the clients and server already.
>

Hi Jamie,

Unless something has changed recently Wireguard doesn't support
dynamic provisioning of IP addresses (yet).

Cheers,
Fredrik
