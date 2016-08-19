Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30645d9e
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Aug 2016 19:14:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3375e48a
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Aug 2016 19:14:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 173a5c0a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Aug 2016 19:14:20 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id f93so39487552lfi.2
 for <wireguard@lists.zx2c4.com>; Fri, 19 Aug 2016 12:19:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <890b834ba4e320e55889f2bcae74a020@mail.inwebse.com>
References: <CAHmME9pZmAi9tjOzZL178f3tM1MYCQZFR-VFR-bJd0S1FFMruA@mail.gmail.com>
 <acb454d0c202fc330d0a349aeee29256@mail.inwebse.com>
 <CAHmME9ozzYBLJ-0xMocFbWuHWCDsONuVqS_hQpVtWJtMKspd5g@mail.gmail.com>
 <2c13c33b73f45d3bbdeee59b60d736de@mail.inwebse.com>
 <890b834ba4e320e55889f2bcae74a020@mail.inwebse.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 19 Aug 2016 21:19:51 +0200
Message-ID: <CAHmME9o=tAMikWRsEn6Gv-_V=cgBMhLcpSv4XXboHAtk5Rj9OA@mail.gmail.com>
To: sorcus@inwebse.com
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard doesn't work with network namespace on
	ArchLinux
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

You need ip forwarding enabled on the server, of course. I suspect
that's not the issue you're facing though. Instead, I imagine that UDP
port isn't open on the server, or the keys are not configured
correctly.
