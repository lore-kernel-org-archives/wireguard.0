Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f5957a3
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 12:51:45 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7a9ecd0
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 12:51:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9825568
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 12:50:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6baab754
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 12:50:29 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id w9-v6so3560969otj.7
 for <wireguard@lists.zx2c4.com>; Wed, 20 Jun 2018 05:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <b9a234e9f09a7dc2@frisell.zx2c4.com>
 <87zhzpn49n.fsf@dell.be.48ers.dk>
In-Reply-To: <87zhzpn49n.fsf@dell.be.48ers.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 Jun 2018 14:56:17 +0200
Message-ID: <CAHmME9rwrYOfjjkNTkum7_w05YLPU4P2GQowqdCOCj_rU0bUxg@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180613` Available
To: Peter Korsgaard <peter@korsgaard.com>
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

Thanks for the report. Fixed here:
https://git.zx2c4.com/WireGuard/commit/?id=ed04799b1868f45e05d788e614b9b8cfa4fcab46
