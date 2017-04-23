Return-Path: stromberg@mullvad.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8071afbb
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Apr 2017 11:04:58 +0000 (UTC)
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0453b98
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Apr 2017 11:04:58 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id m123so46732748wma.0
 for <wireguard@lists.zx2c4.com>; Sun, 23 Apr 2017 04:13:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1492931136.3430679.953148112.4F826684@webmail.messagingengine.com>
References: <CAHmME9pXHZXfY+ebGQ2KrYPxZwqW7WxNWsi=iMDjsSQcZD3cJw@mail.gmail.com>
 <1492931136.3430679.953148112.4F826684@webmail.messagingengine.com>
From: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Date: Sun, 23 Apr 2017 13:13:21 +0200
Message-ID: <CANTUoefkd_GaS2TPD-T3sAYiGxjdXOy3=YtQ2iEsWeCsj810CA@mail.gmail.com>
Subject: Re: potential preshared-key changes
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

Hi! :)

On Sun, Apr 23, 2017 at 9:05 AM,  <crasm@wireguard.1.email.vczf.io> wrote:
> Forgive me in advance if this is a horrible or misinformed idea, but why
> not blake2s the preshared-key with each peer's public key and distribute
> that as a per-peer "preshared" key, mixing it in last? That would reduce
> the risk of key compromise, since each peer would have a unique key and
> the real key is not copied to each peer.
>
If I understand you correctly you're suggesting:

1. Peer PSK = BLAKE2S( "Real PSK" + "Peer's static pubkey" )
2. Mix in the peer's PSK the same way Jason suggests

In practice this is equivalent to the discussed change, and "Peer PSK"
would be the real key, for that peer.

Regards,
Fredrik Stromberg
