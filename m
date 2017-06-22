Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 886790d2
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Jun 2017 00:00:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff9232c5
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Jun 2017 00:00:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f963fbd7
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Jun 2017 00:14:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 93c5d5d3
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Jun 2017 00:14:17 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id p66so630425oia.0
 for <wireguard@lists.zx2c4.com>; Wed, 21 Jun 2017 17:16:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACTq0bTLXJ+HGasd7re7-T4bejfpX71VSojGEWH6fv_FDSxU5w@mail.gmail.com>
References: <CACTq0bTLXJ+HGasd7re7-T4bejfpX71VSojGEWH6fv_FDSxU5w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 22 Jun 2017 02:16:31 +0200
Message-ID: <CAHmME9pR9efJFxzFZRQxd8RDej9BEMJjF7NYtDX-LyrRS3LBCQ@mail.gmail.com>
Subject: Re: wg setconf - does it reinitialize ?
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

Try `wg addconf`.
