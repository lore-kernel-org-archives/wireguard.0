Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e5f340a
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 13:29:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac247b1f
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 13:29:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e074368a
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 13:48:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fbb810ce
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 13:48:24 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id j126so29757839oia.10
 for <wireguard@lists.zx2c4.com>; Fri, 06 Oct 2017 06:58:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171006134832.Horde.3UZthKbU46LLodtbmlSMMKb@www.vdorst.com>
References: <20171006105940.Horde.-YgH3Xzem0aIzxlyFy3xGun@www.vdorst.com>
 <20171006112215.Horde.PVbxF1OCC2ugTFVlOcX22n3@www.vdorst.com>
 <CAHmME9r9TNxJhWvXRgVEE1GtDktUvy5M2uqbhtuP7g=54BmFGw@mail.gmail.com>
 <20171006134832.Horde.3UZthKbU46LLodtbmlSMMKb@www.vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Oct 2017 15:58:36 +0200
Message-ID: <CAHmME9rQoowRYr_QWfcGtzH=qax=78Jn=_Hdwdv9PECfkz535g@mail.gmail.com>
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

Hi Ren=C3=A9,

That makes sense. Jiffies is initialized to -300*HZ:
http://elixir.free-electrons.com/linux/latest/source/include/linux/jiffies.=
h#L170

Jason
