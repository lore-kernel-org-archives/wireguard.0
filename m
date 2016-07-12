Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f63ddb11
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 15:48:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bff9deb4
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 15:48:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 88e7db6b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 15:48:59 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id q132so17542168lfe.3
 for <wireguard@lists.zx2c4.com>; Tue, 12 Jul 2016 08:49:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
References: <CAMRLKH8cAu+sD0Pss=GGVbqGUiZxvE3HT1sVgTsRFyKiQGpOog@mail.gmail.com>
 <CAHmME9pueP4YvQ4GJAhq7D06_MdDYq024vR5RSEj7cL1zx4qiQ@mail.gmail.com>
 <CAMRLKH_Ve7cnhYP9ZtBT868m298fhxKYvRAEHhkdCVfmpVZbSQ@mail.gmail.com>
 <CAHmME9qw1Ymrjyfhkmh7YOBgBuKGP5r=VdurAR1KLpaoFzqCyQ@mail.gmail.com>
 <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 12 Jul 2016 17:49:46 +0200
Message-ID: <CAHmME9rK0YkgyZ4YqgyCzTy3drXxeww01LVOedZvi_1xL=Exzw@mail.gmail.com>
To: Quan Zhou <quanzhou822@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Troubleshooting with WireGuard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Quan,

You've goofed up your keys.

srv1.Interface.PrivateKey should be `wg genkey`
srv2.Interface.PrivateKey should be `wg genkey`

srv1.Peer.PublicKey should be `echo srv2.Interface.PrivateKey | wg pubkey`
srv2.Peer.PublicKey should be `echo srv1.Interface.PrivateKey | wg pubkey`

Here's an example:

srv1:
[Interface]
PrivateKey  = qOmcJSeA6Ewp/PYunF1k2LfMMJRhJQO8L1mMAJBwPnE=
[Peer]
PublicKey = /0I75wp3pTBPj2WOU2olEc+MdZfv/yMkEIfWrQlx5hE=

srv2:
[Interface]
PrivateKey = UHBCSeBaz2ydkuObf5itzGT1iT66hEQW3VDYEssk6GY=
[Peer]
PublicKey = PRrLsRYLyCto5CMTqnR71hg722/4Uhbd4Xev0QyW+m4=

You can confirm yourself here that srv1.Peer.PublicKey = `echo
srv2.Interface.PrivateKey | wg pubkey` and that srv2.Peer.PublicKey =
`echo srv1.Interface.PrivateKey | wg pubkey`.

This should fix your problem.

Jason
