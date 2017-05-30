Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d7e0849
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 12:32:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f286c61
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 12:32:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 725455ef
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 12:44:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 12ee6be5
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 12:44:13 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id w10so109578129oif.0
 for <wireguard@lists.zx2c4.com>; Tue, 30 May 2017 05:45:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9ou95Lq=Dc86iCC7H1_N+oLckyM7Ngrv1hwOp=TarOkRQ@mail.gmail.com>
References: <61E1F38E-66AB-4AD1-B3B0-79FB42A3B4C8@gmail.com>
 <CAHmME9rtEXCHG6LE+JP7jaDnM7cR+faJOAKJLW0bMBKawoZZ0Q@mail.gmail.com>
 <987716C2-3ABE-4705-A7AA-98511627C777@gmail.com>
 <CAHmME9ou95Lq=Dc86iCC7H1_N+oLckyM7Ngrv1hwOp=TarOkRQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 30 May 2017 14:45:47 +0200
Message-ID: <CAHmME9o1tngXJWLOrKMbtwZizb=0gt+njaC9NphJ_yhNfEqk_A@mail.gmail.com>
Subject: Re: Kernel panic on ARM
To: Alexandre Karlov <bassbeat@gmail.com>
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

Hey Alexandre,

Can you try this patch, and tell me if it makes the problem go away?

http://ix.io/vMh

If it works, I'll include this in the next snapshot.

Thanks,
Jason
