Return-Path: stromberg@mullvad.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e14f745c
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Apr 2018 15:09:50 +0000 (UTC)
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5b95cd5
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Apr 2018 15:09:50 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id u189so26909568wmd.1
 for <wireguard@lists.zx2c4.com>; Tue, 10 Apr 2018 08:23:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <632862084.551608.1523366176107.JavaMail.zimbra@mtz.desoft.cu>
References: <1183404859.513012.1523305020741.JavaMail.zimbra@mtz.desoft.cu>
 <1523310199.2505184.1332166016.6F8F8F11@webmail.messagingengine.com>
 <632862084.551608.1523366176107.JavaMail.zimbra@mtz.desoft.cu>
From: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Date: Tue, 10 Apr 2018 17:23:35 +0200
Message-ID: <CANTUoecxMp-Tu-XofcShbrKXwX6sP0FaRJBesT57SjsmviK1oQ@mail.gmail.com>
Subject: Re: Working only one way
To: =?UTF-8?Q?Ing=2E_Luis_Felipe_Dom=C3=ADnguez_Vega?=
 <luis.dominguez@mtz.desoft.cu>
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Luis,

On Tue, Apr 10, 2018 at 3:16 PM, Ing. Luis Felipe Dom=C3=ADnguez Vega
<luis.dominguez@mtz.desoft.cu> wrote:
> 1 - Can I change the length (to 4096 bits for example) of private key? or=
 is not neccesary, I am a little paranoic with this kind of security cipher=
.
>

No. WireGuard uses cryptographic primitives which are
state-of-the-art, with a large security margin. No options means
there's nothing for users to misconfigure, or any risk of so called
downgrading attacks.

Also note that the bit length you are asking for is normal for RSA,
but enormous for elliptic curve based primitives, which is what
WireGuard uses.

Cheers,
Fredrik
