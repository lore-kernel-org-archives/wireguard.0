Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97e4e6c8
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 13:34:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4863fa14
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 13:34:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9772e747
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 13:53:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1155cbf9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 13:53:19 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id j126so6182068oib.8
 for <wireguard@lists.zx2c4.com>; Fri, 06 Oct 2017 07:03:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rQoowRYr_QWfcGtzH=qax=78Jn=_Hdwdv9PECfkz535g@mail.gmail.com>
References: <20171006105940.Horde.-YgH3Xzem0aIzxlyFy3xGun@www.vdorst.com>
 <20171006112215.Horde.PVbxF1OCC2ugTFVlOcX22n3@www.vdorst.com>
 <CAHmME9r9TNxJhWvXRgVEE1GtDktUvy5M2uqbhtuP7g=54BmFGw@mail.gmail.com>
 <20171006134832.Horde.3UZthKbU46LLodtbmlSMMKb@www.vdorst.com>
 <CAHmME9rQoowRYr_QWfcGtzH=qax=78Jn=_Hdwdv9PECfkz535g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Oct 2017 16:03:31 +0200
Message-ID: <CAHmME9o8UgwacOo=9H+hp8Wu8mxxBQRxrEkSgVJdax9nkByLKg@mail.gmail.com>
Subject: Re: netns.sh: Sending cookie response for denied handshake
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
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

Upstream commit:
https://git.zx2c4.com/WireGuard/commit/?id=64669564122e5112a01536cbe28e8c2159eb056b
